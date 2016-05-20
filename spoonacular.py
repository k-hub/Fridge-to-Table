"""Use Spooncular API to send get request of input ingredients and returns recipes as a response."""

import unirest
from pprint import pprint
import os
from urllib import quote
from model import connect_to_db, db, Recipe, Ingredient, RecipeIngredient
from serverdb import app


PREFIX = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/"
# HEADER = {"X-Mashape-Key": os.environ['X_MASHABLE_KEY'], "Accept": "application/json"}

# def prefix_url():
#     """Return beginning of URL for API calls."""
#     prefix = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/"
#     return prefix
### DEFINE CONSTANT INSTEAD OF FUNCTION

def header():
    """Return header information for API calls."""

    HEADER = {"X-Mashape-Key": os.environ['X_MASHABLE_KEY'], "Accept": "application/json"}
    return HEADER
### DEFINE CONSTANT INSTEAD OF FUNCTION

def parse_ingredients(*ingredients):  # Function can take more than one parameter with *.
    """Parse ingredients."""

    ingredients = list(ingredients)

    encode_ingredients = ("%2C").join(ingredients)  # Encode the list of ingredients to be passed into get_recipe.

    return encode_ingredients


def get_recipes(*ingredients):
    """Get recipes for input ingredients."""

    # response = unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients=" + parse_ingredients(*ingredients) + "&limitLicense=false&number=5&ranking=1",
    #     headers=header()
    # )

    response = unirest.get(PREFIX + "findByIngredients?fillIngredients=false&ingredients=" + parse_ingredients(*ingredients) + "&limitLicense=false&number=5&ranking=1",
        headers=header()
    )
    
    # response = unirest.get(PREFIX + "findByIngredients?fillIngredients=false&ingredients=" + parse_ingredients(*ingredients) + "&limitLicense=false&number=5&ranking=1" + HEADER)

    print "\nSTATUS:\n", response.code  # The HTTP status code.

    print "\nHEADERS:\n", response.headers  # The HTTP headers.

    print "\nPARSED:"  # The parsed response, a list of dictionaries.
    pprint(response.body)

    return response.body


    # for item in response.body:  # Iterate through list of dictionaries.
    #     item.pop('imageType')
    # return response.body  # Returns title, image, missedIngredientCount, likes, usedIngredientCount, id but no imageType.


def get_recipe_source(recipe_id):
    """Get the source URL of a recipe and call get_recipe_instructions to get recipe instructions."""

    recipe_id = str(recipe_id)
    response = unirest.get(PREFIX + recipe_id + "/information?includeNutrition=false",
        headers=header()
    )

    print "\nSTATUS:\n", response.code  # The HTTP status code.

    print "\nHEADERS:\n", response.headers  # The HTTP headers.

    print "\nPARSED:"  # The parsed response, returns a dictionary.
    pprint(response.body)

    # print "\nSOURCE URL:\n", response.body['sourceUrl']  # Get the source URL of the original recipe.

    source = response.body["sourceUrl"] # Get the source URL of the original recipe.

    return get_recipe_instructions(source)


def get_recipe_instructions(source_url):
    """Get recipe instructions from the source URL."""

    encode_source = quote(source_url, safe='')  # Encode source URL to be concatentated with get request.

    response = unirest.get(PREFIX + "extract?forceExtraction=false&url=" + encode_source,
        headers=header()
    )

    print "\nNEW PARSED:\n"  # The parsed response, returns a dictionary.
    pprint(response.body)

    instructions = response.body["instructions"]

    # print "\nINSTRUCTIONS:\n", instructions

    # Some recipes have None values for their instructions. If they are None, then return the source_url to redirect user to the original recipe.
    if instructions:  # If true
        return instructions

    return source_url





#### NEED TO REFACTOR CODE BELOW INTO SMALLER FUNCTIONS.###########
# def get_restricted_recipes(diet="any", excludeIngredients=None, includeIngredients=None, intolerances=None, query=None):
#     """Get recipes based on user input ingredients and any diet they select."""

#     # intolerances = ','.join(intolerances)
    
#     # print "INTOLERANCES: ", intolerances

#     payload = {
#             "diet" : diet,
#             # "excludeIngredients" : excludeIngredients,
#             "fillIngredients" : "true",
#             "includeIngredients" : includeIngredients,
#             # "intolerances" : intolerances,
#             "limitLicense" : "false",
#             "number" : 100, # Change back to 100
#             "offset" : 101, # Change back to 101
#             "query" : query,
#             "ranking" : 1
#             }


#     response = unirest.get(PREFIX + "searchComplex", params=payload,
#             headers=header()
#     )

#     print "\nSTATUS:\n", response.code  # The HTTP status code.

#     print "\nHEADERS:\n", response.headers  # The HTTP headers.

#     print "\nPARSED:"  # The parsed response, returns a dictionary.
#     # pprint(response.body)

#     pprint(response.body["results"])


#     for recipe_dict in response.body["results"]:  # response.body["results"] is a list of recipe dictionaries.

#         # Query recipes table to check that recipe does not exist in database. 
#         # If it does not, then instantiate a Recipe object and add it to the recipes table in the database.
#         if not db.session.query(Recipe.title).filter_by(title=recipe_dict['title']).all(): 
#             recipe = Recipe(recipe_id=recipe_dict['id'], title=recipe_dict['title'], image=recipe_dict['image'])

#             db.session.add(recipe)

#             #### NEED TO THINK ABOUT HOW TO ADD THE QUERIED INGREDIENT TO THE TABLE. ######

#             for missed_ingred in recipe_dict['missedIngredients']:

#                 # Query ingredients table to check that ingredient does not exist in database. 
#                 # If it does not, instantiate an Ingredient object and add it to the ingredients table in the database. 
#                 if not db.session.query(Ingredient.ingredient_name).filter_by(ingredient_name=missed_ingred['name']).all():

#                     ingredient = Ingredient(ingredient_name=missed_ingred['name'])
#                     db.session.add(ingredient)
#                     # print "MISSED: ", missed_ingred['name']  # For debugging.

#                     # Query for the ingredient_id, which is unique, and use it to create an object to 
#                     # be added to the recipe_ingredients table.
#                     ingredient_id = db.session.query(Ingredient.ingredient_id).filter_by(ingredient_name=missed_ingred['name']).one()
#                     recipe_ingredient = RecipeIngredient(recipe_id=recipe_dict['id'], ingredient_id=ingredient_id)

#                     db.session.add(recipe_ingredient)

#     db.session.commit()
    

#     return response.body["results"] # Return the recipe results as a list of dictionaries.

#####################
def get_restricted_recipes(diet="any", excludeIngredients=None, includeIngredients=None, intolerances=None, query=None):
    """Get recipes based on user input ingredients and any diet they select."""

    # intolerances = ','.join(intolerances)
    
    # print "INTOLERANCES: ", intolerances

    payload = {
            "diet" : diet,
            # "excludeIngredients" : excludeIngredients,
            "fillIngredients" : "false",
            "includeIngredients" : includeIngredients,
            # "intolerances" : intolerances,
            "limitLicense" : "false",
            "number" : 20, # Change back to 100
            "offset" : 21, # Change back to 101
            "query" : query,
            "ranking" : 1
            }


    response = unirest.get(PREFIX + "searchComplex", params=payload,
            headers=header()
    )

    print "\nSTATUS:\n", response.code  # The HTTP status code.

    print "\nHEADERS:\n", response.headers  # The HTTP headers.

    # print "\nPARSED:"  # The parsed response, returns a dictionary.
    # pprint(response.body)

    # pprint(response.body["results"])
    
    for recipe_dict in response.body["results"]:  # response.body["results"] is a list of recipe dictionaries.

        # Query recipes table to check that recipe does not exist in database. 
        # If it does not, then instantiate a Recipe object and add it to the recipes table in the database.
        if not db.session.query(Recipe.title).filter_by(title=recipe_dict['title']).all():

            recipe_id = recipe_dict['id']  # Get the recipe_id to pass into get_recipe_info. 
            # print "ID HERE: ", recipe_id  # For debugging.

            recipe_info = get_recipe_info(recipe_id)  # Returns a dictionary with recipe_id, title, image, vegan/vegeatarian info, sourceUrl.

            # print "LOOK HERE:", recipe_info  # For debugging.

            recipe = Recipe(recipe_id=recipe_info['id'], title=recipe_info['title'], image=recipe_info['image'])

            # print "instantiate THIS: ", recipe  # For debugging.
            
            db.session.add(recipe)


            # Query ingredients table to check that ingredient does not exist in database. 
            # If it does not, instantiate an Ingredient object and add it to the ingredients table in the database. 
            for ingred in recipe_info['ingredients']:
                if not db.session.query(Ingredient.ingredient_name).filter_by(ingredient_name=ingred).all():
                    ingredient = Ingredient(ingredient_name=ingred)
                    db.session.add(ingredient)
                    # print "MISSED: ", ingredient  # For debugging.


                # Query for the ingredient_id, which is unique, and use it to create an object to 
                # be added to the recipe_ingredients table.
                ingredient_id = db.session.query(Ingredient.ingredient_id).filter_by(ingredient_name=ingred).one()
                recipe_ingredient = RecipeIngredient(recipe_id=recipe_id, ingredient_id=ingredient_id)

                db.session.add(recipe_ingredient)
                # print "NEW RI: ", recipe_ingredient  # For debugging.


    db.session.commit()
    # return response.body["results"] # Return the recipe results as a list of dictionaries.
#########


def get_recipe_info(recipe_id):
    """Get information for a specific recipe and store it in a dictionary.

    Returns the recipe id, title, all ingredients in the recipe, and whether
    it is vegan or vegetarian, and the sourceUrl.
    """

    response = unirest.get(PREFIX + str(recipe_id) + "/information?includeNutrition=false",   
        headers=header()
    )

    # print "\nSTATUS:\n", response.code  # The HTTP status code.

    # print "\nHEADERS:\n", response.headers  # The HTTP headers.

    # print "\nPARSED:"  # The parsed response, returns a dictionary.
    # # pprint(response.body)
    
    recipe = response.body
    # pprint(recipe)

    recipe_dict = {}
    ingredients = []

    for ingred in recipe['extendedIngredients']:
        ingredients.append(ingred['name'])

    recipe_dict['id'] = recipe['id']
    recipe_dict['title'] = recipe['title']
    recipe_dict['image'] = recipe['image']
    recipe_dict['vegan'] = recipe['vegan']
    recipe_dict['vegetarian'] = recipe['vegetarian']
    recipe_dict['sourceUrl'] = recipe['sourceUrl']
    recipe_dict['ingredients'] = ingredients

    # print "DICT: "
    # pprint(recipe_dict)

    return recipe_dict



# def get_restricted_recipes(diet="any", excludeIngredients=None, includeIngredients=None, intolerances=None, query=None):
#     """Get recipes based on user input ingredients and any diet or intolerances they select. Recipe results are prioritized by recipes that include the most user input ingredients to the least user input ingredients."""

#     # intolerances = ','.join(intolerances)

#     # print "INTOLERANCES: ", intolerances

#     payload = {
#             "diet" : diet,
#             # "excludeIngredients" : excludeIngredients,
#             "fillIngredients" : "true",
#             "includeIngredients" : includeIngredients,
#             # "intolerances" : intolerances,
#             "limitLicense" : "false",
#             "number" : 5, # Change back to 100
#             "offset" : 6, # Change back to 101
#             "query" : query,
#             "ranking" : 1
#             }


#     response = unirest.get(PREFIX + "searchComplex", params=payload,
#             headers=header()
#     )

#     print "\nSTATUS:\n", response.code  # The HTTP status code.

#     print "\nHEADERS:\n", response.headers  # The HTTP headers.

#     print "\nPARSED:"  # The parsed response, returns a dictionary.
#     # pprint(response.body)

#     pprint(response.body["results"])

#     # for recipe_dict in response.body["results"]:  # response.body["results"] is a list of recipe dictionaries.
#     #     if recipe_dict['usedIngredientCount'] != len(list(intolerances)):
#     #         print "No recipes found with your criteria. Here are recipes you may be interested in."  ###DISPLAY THIS MESSAGE ON THE TEMPLATE # http://programminghistorian.org/lessons/creating-and-viewing-html-files-with-python

#     return response.body["results"] # Return the recipe results as a list of dictionaries.


    #### Code below will keep making calls to the API for results. If response.body["totalResults"] not equal to the payload["number"], then stop making calls. 
    # while response.body["totalResults"] != payload["number"]:
    #         response = unirest.get(prefix_url() + "searchComplex", params=payload, headers=header())
    #         return response.body["results"]
    #         payload["offset"] += 5




# response = unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=true&ingredients=apples%2Cflour%2Csugar&limitLicense=false&number=5&ranking=1",
#   headers={
#     "X-Mashape-Key": "kfaZKeKraymshCHZYuCVP1gVtwyJp1OZ8GTjsn1H2A4JP5FAYC",
#     "Accept": "application/json"
#   }
# )










if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    # app.debug = True

    connect_to_db(app)
    print "Connected to DB."