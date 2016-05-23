"""Use Spooncular API to send get request of input ingredients and returns recipes as a response."""

import unirest
from pprint import pprint
import os
from urllib import quote
from model import connect_to_db, db, Recipe, Ingredient, RecipeIngredient, RecipeDiet, Diet
# from serverdb import app  # Need to comment out if running serverdb.



PREFIX = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/"
# HEADER = {"X-Mashape-Key": os.environ['X_MASHABLE_KEY'], "Accept": "application/json"}


def header():
    """Return header information for API calls."""

    HEADER = {"X-Mashape-Key": os.environ['X_MASHABLE_KEY'], "Accept": "application/json"}
    return HEADER


def parse_ingredients(*ingredients):  # Function can take more than one parameter with *. * used because user can input n arguments.
    """Parse ingredients."""

    ingredients = list(ingredients)

    encode_ingredients = ("%2C").join(ingredients)  # Encode the list of ingredients to be passed into get_recipe.

    return encode_ingredients


def get_recipes(*ingredients):
    """Get recipes containing input ingredients."""

    # response = unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients=" + parse_ingredients(*ingredients) + "&limitLicense=false&number=5&ranking=1",
    #     headers=header()
    # )

    response = unirest.get(PREFIX + "findByIngredients?fillIngredients=false&ingredients=" + parse_ingredients(*ingredients) + "&limitLicense=false&number=5&ranking=1",
        headers=header()
    )

    print "\nSTATUS:\n", response.code  # The HTTP status code.

    print "\nHEADERS:\n", response.headers  # The HTTP headers.

    print "\nPARSED:"  # The parsed response, a list of dictionaries.
    pprint(response.body)

    return response.body


def get_recipe_source(recipe_id):
    """Get the source URL of a recipe and call get_recipe_instructions to get recipe instructions."""

    recipe_id = str(recipe_id)
    response = unirest.get(PREFIX + recipe_id + "/information?includeNutrition=false",
        headers=header()
    )

    print "\nSTATUS:\n", response.code  # The HTTP status code.

    print "\nHEADERS:\n", response.headers  # The HTTP headers.

    print "\nPARSED:"  # The parsed response, returns a dictonary.
    pprint(response.body)


    source = response.body["sourceUrl"] # Get the source URL of the original recipe.

    return get_recipe_instructions(source)


def get_recipe_instructions(source_url):
    """Get recipe instructions from the source URL."""

    encode_source = quote(source_url, safe='')  # Encode source URL to be concatentated with get request.

    response = unirest.get(PREFIX + "extract?forceExtraction=false&url=" + encode_source,
        headers=header()
    )

    instructions = response.body["instructions"]  # response.body is a dictionary containing a key "instructions".

    # Some recipes have None values for their instructions. If they are None, then return the source_url to redirect user to the original recipe.
    if instructions:  # If true
        return instructions

    return source_url


def get_restricted_recipes(diet="any", excludeIngredients=None, includeIngredients=None, intolerances=None, query=None):
    """Get recipes based on user input ingredient and any diet they select.

    This API call does not include the searched ingredient as one of the ingredients in the recipe.
    get_recipe_info takes care of that. 
    """

    payload = {
            "diet" : diet,
            # "excludeIngredients" : excludeIngredients,
            "fillIngredients" : "false",
            "includeIngredients" : includeIngredients,
            # "intolerances" : intolerances,
            "limitLicense" : "false",
            "number" : 100, # Change back to 100
            "offset" : 101, # Change back to 101
            "query" : query,
            "ranking" : 1
            }


    response = unirest.get(PREFIX + "searchComplex", params=payload,
            headers=header()
    )

    print "\nSTATUS:\n", response.code  # The HTTP status code.

    print "\nHEADERS:\n", response.headers  # The HTTP headers.

    # print "\nPARSED:"  # The parsed response, returns a dictionary.
    pprint(response.body["results"])

    add_to_db(response.body["results"])  # Call function to add recipes, ingredients, diet information to database.



def get_recipe_info(recipe_id):
    """Get information for a specific recipe and store it in a dictionary to be used 
    to instantiate objects in add_to_db.

    Returns the recipe id, title, image, whether it is vegan and/or vegetarian,
    all ingredients and respecitve measurements in the recipe, and the instructions. 
    Using this particular API call gives all ingredients in the recipe. To get the
    instructions for a recipe, get_recipe_instructions is used. 
    """

    response = unirest.get(PREFIX + str(recipe_id) + "/information?includeNutrition=false",   
        headers=header()
    )

    
    recipe = response.body  # This is a dictionary containing recipe information.
    # pprint(recipe)  # For debugging.

    recipe_dict = {}
    ingredients = {}  # Will store ingredients as the key and the respective measurement as a value.

    for ingred in recipe["extendedIngredients"]:
        measurement = "{} {}".format(ingred["amount"], ingred["unit"])
        ingredients.setdefault(ingred["name"], measurement)

    instructions = get_recipe_instructions(recipe["sourceUrl"])  # Get the recipe instructions by calling
    # another function. 

    recipe_dict["id"] = recipe["id"]
    recipe_dict["title"] = recipe["title"]
    recipe_dict["image"] = recipe["image"]
    recipe_dict["vegan"] = recipe["vegan"]
    recipe_dict["vegetarian"] = recipe["vegetarian"]
    recipe_dict["ingredients"] = ingredients
    recipe_dict["instructions"] = instructions

    # Below does not work because images have different image format.
    # recipe_dict["image"] = "https://webknox.com/recipeImages/" + str(recipe["id"]) + "-556x370.jpg"  # Using this URL because the images are formatted to same height and width.


    # recipe_dict = {}
    # ingredients = []

    # for ingred in recipe["extendedIngredients"]:
    #     ingredients.append(ingred["name"])

    # recipe_dict["id"] = recipe["id"]
    # recipe_dict["title"] = recipe["title"]
    # recipe_dict["image"] = recipe["image"]
    # recipe_dict["vegan"] = recipe["vegan"]
    # recipe_dict["vegetarian"] = recipe["vegetarian"]
    # recipe_dict["sourceUrl"] = recipe["sourceUrl"]
    # recipe_dict["ingredients"] = ingredients
    # print "DICT: "  # For debugging.
    # pprint(recipe_dict)  # For debugging.

    return recipe_dict


def add_to_db(api_response):
    """Add recipes, ingredients, and diet information to database."""

    response = api_response

    for recipe_dict in response:  # response.body["results"] is a list of recipe dictionaries.

        # Check that recipe title is in ascii format before adding to db. Conditional statemet?


        # Query recipes table to check that recipe does not exist in database. 
        # If it does not, then instantiate a Recipe object and add it to the recipes table in the database.
        if not db.session.query(Recipe.title).filter_by(title=recipe_dict["title"]).all():

            recipe_id = recipe_dict["id"]  # Get the recipe_id to pass into get_recipe_info function.

            recipe_info = get_recipe_info(recipe_id)  # Returns a dictionary with recipe id, title, image, vegan/vegeatarian info, ingredients, instructions.

            recipe = Recipe(recipe_id=recipe_info["id"], title=recipe_info["title"], image=recipe_info["image"], instructions=recipe_info["instructions"])  # Instantiate a Recipe object.

            db.session.add(recipe)
            db.session.commit()  # Need to commit here because recipe_id is a foreign key in the RecipeDiet table. 


            # Instantiate RecipeDiet objects for each recipe. Each recipe can have more than one diet_code.
            if recipe_info["vegan"]:  # Any recipes that are vegan will have a diet_code "vg".
                diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="vg")
                db.session.add(diet)

            if recipe_info["vegetarian"]:  # Any recipes that are vegan will have a diet_code "v".
                diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="v")
                db.session.add(diet)

            diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="a")  # Add a diet_code of "a", which indicates no dietary restriction to all recipes.
            db.session.add(diet)


            # recipe_info["ingredients"] is a key with a value that is a dictionary of ingredient-measurement pairs, 
            # so need to use .items().
            for name, measurement in recipe_info["ingredients"].items():

                # Query ingredients table to check that ingredient does not exist in database. 
                # If it does not, instantiate an Ingredient object and add it to the ingredients table in the database. 
                if not db.session.query(Ingredient.name).filter_by(name=name).all():
                    ingredient = Ingredient(name=name)
                    db.session.add(ingredient)

                # Query for the ingredient_id, which is unique, and use it to instantiate a RecipeIngredient object.
                ingredient_id = db.session.query(Ingredient.ingredient_id).filter_by(name=name).one()
                recipe_ingredient = RecipeIngredient(recipe_id=recipe_id, ingredient_id=ingredient_id, measurement=measurement)

                db.session.add(recipe_ingredient)

    db.session.commit()







# def add_to_db(api_response, diet):
#     """Add recipe, ingredients, and diet to database."""

#     response = api_response

#     for recipe_dict in response:  # response.body["results"] is a list of recipe dictionaries.
#         # Query recipes table to check that recipe does not exist in database. 
#         # If it does not, then instantiate a Recipe object and add it to the recipes table in the database.
#         if not db.session.query(Recipe.title).filter_by(title=recipe_dict["title"]).all():

#             recipe_id = recipe_dict["id"]  # Get the recipe_id to pass into get_recipe_info. 
#             # print "ID HERE: ", recipe_id  # For debugging.

#             recipe_info = get_recipe_info(recipe_id)  # Returns a dictionary with recipe_id, title, image, vegan/vegeatarian info, sourceUrl.

#             # print "LOOK HERE:", recipe_info  # For debugging.

#             instructions = get_recipe_instructions(recipe_info["sourceUrl"])  # Call function to get recipe instructions.

#             # print "INSTRUCTIONS HERE: ", instructions  # For debugging.
#             recipe = Recipe(recipe_id=recipe_info["id"], title=recipe_info["title"], image=recipe_info["image"], instructions=instructions)

#             # print "instantiate THIS: ", recipe  # For debugging.
#             db.session.add(recipe)
#             db.session.commit()  # Need to commit here because recipe_id is a foreign key in the RecipeDiet table. 


#             if recipe_info["vegan"]:  # Any recipes that are vegan will have a diet_code "vg".
#                 diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="vg")
#                 db.session.add(diet)

#             if recipe_info["vegetarian"]:  # Any recipes that are vegan will have a diet_code "v".
#                 diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="v")
#                 db.session.add(diet)

#             diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="a")  # Add a diet_code of "a" indicating no dietary restrcition to all recipes.
#             db.session.add(diet)


#             # Query ingredients table to check that ingredient does not exist in database. 
#             # If it does not, instantiate an Ingredient object and add it to the ingredients table in the database.

                # for ingred in recipe_info["ingredients"]:  # recipe_info["ingredients"] is a key with a value that is a dictionary of ingredients.
                # if not db.session.query(Ingredient.name).filter_by(name=ingred).all():
                #     ingredient = Ingredient(name=ingred)
                #     db.session.add(ingredient)

                # # Query for the ingredient_id, which is unique, and use it to create an object to 
                # # be added to the recipe_ingredients table.
                # ingredient_id = db.session.query(Ingredient.ingredient_id).filter_by(name=ingred).one()
                # recipe_ingredient = RecipeIngredient(recipe_id=recipe_id, ingredient_id=ingredient_id)

                # db.session.add(recipe_ingredient)

#     db.session.commit()









if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    # app.debug = True

    connect_to_db(app)
    print "Connected to DB."