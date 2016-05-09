import unirest
from pprint import pprint
import os


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


def parse_ingredients(*ingredients):  # Function can take more than one parameter with *.
    """Parse ingredients and pass into get_recipe."""

    ingredients = list(ingredients)

    encode_ingredients = ("%2C").join(ingredients)  # Encode the list of ingredients to be passed into get_recipe.

    # print encode_ingredients

    return encode_ingredients

def get_recipe(*ingredients):
    """Get recipe for input ingredients."""

    response = unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients=" + parse_ingredients(*ingredients) + "&limitLicense=false&number=5&ranking=1",
      headers={
        "X-Mashape-Key": os.environ['X_MASHABLE_KEY'], # Hide secret key
        "Accept": "application/json"
      }
    )

    print "\nSTATUS:\n", response.code # The HTTP status code
    print "\nHEADERS:\n", response.headers # The HTTP headers
    print "\nPARSED:"
    pprint(response.body)
    print "\nUNPARSED:\n", response.raw_body # The unparsed response

