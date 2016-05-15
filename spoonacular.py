"""Use Spooncular API to send get request of input ingredients and returns recipes as a response."""

import unirest
from pprint import pprint
import os
from urllib import quote


### Make a function for these when I refactor code: ###
# start_unirest = unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/"

def prefix_url():
    """Return beginning of URL for API calls."""
    prefix = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/"
    return prefix


def header():
    """Return header information for API calls."""

    header = {"X-Mashape-Key": os.environ['X_MASHABLE_KEY'], "Accept": "application/json"}
    return header


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

    response = unirest.get(prefix_url() + "findByIngredients?fillIngredients=false&ingredients=" + parse_ingredients(*ingredients) + "&limitLicense=false&number=5&ranking=1",
        headers=header()
    )

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
    response = unirest.get(prefix_url() + recipe_id + "/information?includeNutrition=false",
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

    response = unirest.get(prefix_url() + "extract?forceExtraction=false&url=" + encode_source,
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


def get_restricted_recipes(diet="Any", excludeIngredients=None, includeIngredients=None, intolerances=None, query=None):
    """Get recipes based on user input ingredients and any diet or intolerances they select."""

    intolerances = ','.join(intolerances)  # WHY CAN I NOT PASS INTOLERANCES AS A LIST BUT INCLUDE_INGREDIENTS CAN
    print "INTOLERANCES: ", intolerances

    payload = {
            "diet" : diet,
            "excludeIngredients" : excludeIngredients,
            "fillIngredients" : "true",
            "includeIngredients" : includeIngredients,
            "intolerances" : intolerances,
            "limitLicense" : "false",
            "number" : 5, # Change back to 100
            "offset" : 6, # Change back to 101
            "query" : query,
            "ranking" : 1
            }


    response = unirest.get(prefix_url() + "searchComplex", params=payload,
            headers=header()
    )

    print "\nSTATUS:\n", response.code  # The HTTP status code.

    print "\nHEADERS:\n", response.headers  # The HTTP headers.

    print "\nPARSED:"  # The parsed response, returns a dictionary.
    # pprint(response.body)

    # pprint(response.body["results"])

    # if results




    return response.body["results"] # Return the recipe results as a list of dictionaries.

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











    # text = response.body['text']

    # print "\nTEXT HERE:\n", text

    # # # if text is None:
    # # #     return source_url
    # return text

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
