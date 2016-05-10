"""Use Spooncular API to send get request of input ingredients and returns recipes as a response."""

import unirest
from pprint import pprint
import os
from urllib import quote


def parse_ingredients(*ingredients):  # Function can take more than one parameter with *.
    """Parse ingredients."""


    ingredients = list(ingredients)

    encode_ingredients = ("%2C").join(ingredients)  # Encode the list of ingredients to be passed into get_recipe.

    return encode_ingredients


def get_recipes(*ingredients):
    """Get recipes for input ingredients."""

    response = unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients=" + parse_ingredients(*ingredients) + "&limitLicense=false&number=5&ranking=1",
        headers={
            "X-Mashape-Key": os.environ['X_MASHABLE_KEY'],  # Hide secret key.
            "Accept": "application/json"
        }
    )

    print "\nSTATUS:\n", response.code  # The HTTP status code.

    print "\nHEADERS:\n", response.headers  # The HTTP headers.

    print "\nPARSED:"  # The parsed response, a list of dictionaries.

    pprint(response.body)

    return response.body
    # print "\nUNPARSED:\n", response.raw_body  # The unparsed response, a json string.
    # return response.raw_body


def get_recipe_source(recipe_id):
    """Get the source URL of a recipe."""

    recipe_id = str(recipe_id)
    response = unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/" + recipe_id + "/information?includeNutrition=false",
        headers={
            "X-Mashape-Key": os.environ['X_MASHABLE_KEY'],  # Hide secret key.
            "Accept": "application/json"
        }
    )

    print "\nSTATUS:\n", response.code  # The HTTP status code.

    print "\nHEADERS:\n", response.headers  # The HTTP headers.

    print "\nPARSED:"  # The parsed response, returns a dictionary.
    pprint(response.body)

    # print "\nSOURCE URL:\n", response.body['sourceUrl']  # Get the source URL of the original recipe.

    source = response.body['sourceUrl'] # Get the source URL of the original recipe.

    get_recipe_instructions(source)


def get_recipe_instructions(source_url):
    """Get recipe instructions from the source URL."""

    encode_source = quote(source_url, safe='')  # Encode source URL to be concatentated with get request.

    response = unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/extract?forceExtraction=false&url=" + encode_source,
        headers={
            "X-Mashape-Key": os.environ['X_MASHABLE_KEY'],  # Hide secret key.
            "Accept": "application/json"

        }
    )

    print "\nNEW PARSED:\n"  # The parsed response, returns a dictionary.
    pprint(response.body)

    instructions = response.body['instructions']

    # print "\nINSTRUCTIONS:\n", instructions

    return instructions








# Code below is the original code I created that takes no parameters.

# def get_recipe():
#     """Get recipe for input ingredients."""

#     response = unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients=chicken%2Conions%2Csalt&limitLicense=false&number=5&ranking=1",
#       headers={
#         "X-Mashape-Key": os.environ['X_MASHABLE_KEY'], # Hide secret key
#         "Accept": "application/json"
#       }
#     )

#     print "\nSTATUS:\n", response.code # The HTTP status code
#     print "\nHEADERS:\n", response.headers # The HTTP headers
#     # print "\nPARSED:\n", response.body # The parsed response
#     print "\nPARSED:"
#     pprint(response.body)
#     print "\nUNPARSED:\n", response.raw_body # The unparsed response
#     # print "\nUNPARSED:\n"
#     # pprint(response.raw_body)


# get_recipe()
