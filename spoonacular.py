"""Use Spooncular API to send get requests and to add recipe information to database."""

import unirest
from pprint import pprint
import os
from urllib import quote
from model import connect_to_db, db, Recipe, Ingredient, RecipeIngredient, RecipeDiet, Diet
from server import app



PREFIX = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/"


def header():
    """Return header information for API calls."""

    HEADER = {"X-Mashape-Key": os.environ['X_MASHABLE_KEY'], "Accept": "application/json"}
    return HEADER


def get_recipe_instructions(source_url):
    """Get recipe instructions from the source URL."""

    # Encode source URL to be concatentated with get request.
    encode_source = quote(source_url, safe='')

    response = unirest.get(PREFIX + "extract?forceExtraction=false&url=" + encode_source,
                            headers=header()
                            )

    # response.body is a dictionary containing a key "instructions".
    instructions = response.body["instructions"]

    # Some recipes have None values for their instructions from Spoonacular. s
    # If they are None, then return the source_url to redirect user to the original recipe source.
    if instructions:
        return instructions

    return source_url


def get_restricted_recipes(diet="any",
                            excludeIngredients=None,
                            includeIngredients=None,
                            intolerances=None,
                            query=None):

    """Get recipes to add to database.

    This API call does not include the searched ingredient as one of the ingredients in the recipe.
    get_recipe_info takes care of that.
    """

    payload = {
            "diet" : diet,
            "fillIngredients" : "false",
            "includeIngredients" : includeIngredients,
            "limitLicense" : "false",
            "number" : 100,
            "offset" : 101,
            "query" : query,
            "ranking" : 1
            # "excludeIngredients" : excludeIngredients,  # To be used for future implementation.
            # "intolerances" : intolerances,  # To be used for future implementation.
            }


    response = unirest.get(PREFIX + "searchComplex", params=payload,
                            headers=header()
                            )
    # The HTTP status code.
    print "\nSTATUS:\n", response.code

    # The HTTP headers.
    print "\nHEADERS:\n", response.headers

    pprint(response.body["results"])

    # Call function to add recipes, ingredients, diet information to database.
    add_to_db(response.body["results"])



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

    # This is a dictionary containing recipe information.
    recipe = response.body

    recipe_dict = {}

    # Will store ingredients as the key and the respective measurement as a value.
    ingredients = {}

    for ingred in recipe["extendedIngredients"]:
        measurement = "{} {}".format(ingred["amount"], ingred["unit"])
        ingredients.setdefault(ingred["name"], measurement)

    # Get the recipe instructions by calling get_recipe_instructions.
    instructions = get_recipe_instructions(recipe["sourceUrl"])

    recipe_dict["id"] = recipe["id"]
    recipe_dict["title"] = recipe["title"]
    recipe_dict["image"] = recipe["image"]
    recipe_dict["vegan"] = recipe["vegan"]
    recipe_dict["vegetarian"] = recipe["vegetarian"]
    recipe_dict["ingredients"] = ingredients
    recipe_dict["instructions"] = instructions

    return recipe_dict


def add_to_db(api_response):
    """Add recipes, ingredients, and diet information to database.

    This function is called in get_restricted_recipes. The argument
    passed into this function will be the response from
    get_restricted_recipes.
    """

    # response is a list of recipe dictionaries
    response = api_response

    for recipe_dict in response:

        # Query recipes table to check that recipe does not exist in database.
        # If it does not, then instantiate a Recipe object and add it to the recipes table in the database.
        if not db.session.query(Recipe.title).filter_by(title=recipe_dict["title"]).all():

            # Get the recipe_id to pass into get_recipe_info function.
            recipe_id = recipe_dict["id"]

            # Returns a dictionary with recipe id, title, image,
            # vegan/vegeatarian info, ingredients, instructions.
            recipe_info = get_recipe_info(recipe_id)

            # Instantiate a Recipe object.
            recipe = Recipe(recipe_id=recipe_info["id"],
                            title=recipe_info["title"],
                            image=recipe_info["image"],
                            instructions=recipe_info["instructions"])

            db.session.add(recipe)

            # Need to commit here because recipe_id is a foreign key in the RecipeDiet table.
            db.session.commit()

            # Instantiate RecipeDiet objects for each recipe. Each recipe can have more than one diet_code.
            # Any recipes that are vegan will have a diet_code "vg".
            if recipe_info["vegan"]:
                diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="vg")
                db.session.add(diet)

            # Any recipes that are vegan will have a diet_code "v".
            if recipe_info["vegetarian"]:
                diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="v")
                db.session.add(diet)

            # Add a diet_code of "a", which indicates no dietary restriction to all recipes.
            diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="a")
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
                recipe_ingredient = RecipeIngredient(recipe_id=recipe_id,
                                                    ingredient_id=ingredient_id,
                                                    measurement=measurement)

                db.session.add(recipe_ingredient)

    db.session.commit()





# Call function to seed database. Can add more recipes to database by calling
# function in terminal or calling function in this file. Will need to drop database
# and create it again if doing the latter.
get_restricted_recipes(includeIngredients="chicken")
get_restricted_recipes(includeIngredients="lamb")
get_restricted_recipes(includeIngredients="pork")
get_restricted_recipes(includeIngredients="beef")








if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.

    connect_to_db(app)
    print "Connected to DB."