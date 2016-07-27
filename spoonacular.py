"""Use Spooncular API to send get requests and to add recipe information to database.
This file should be executed only once.
"""

import unirest
from pprint import pprint
import os
from urllib import quote
from model import connect_to_db, db, Recipe, Ingredient, RecipeIngredient, RecipeDiet, Diet, User, ShoppingList
from server import app



PREFIX = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/"


def header():
    """Return header information for API calls."""

    HEADER = {"X-Mashape-Key": os.environ['X_MASHABLE_KEY'], "Accept": "application/json"}
    return HEADER


def get_recipe_instructions(source_url):
    """Get recipe instructions from the source URL."""

    encode_source = quote(source_url, safe='')

    response = unirest.get(PREFIX + "extract?forceExtraction=false&url=" + encode_source,
                            headers=header()
                            )

    instructions = response.body["instructions"]

    # Some recipes have None values for their instructions from Spoonacular.
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
            "number" : 15,
            "offset" : 16,
            "query" : query,
            "ranking" : 1
            # "excludeIngredients" : excludeIngredients,  # To be used for future implementation.
            # "intolerances" : intolerances,  # To be used for future implementation.
            }


    response = unirest.get(PREFIX + "searchComplex", params=payload,
                            headers=header()
                            )

    print "\nSTATUS:\n", response.code

    print "\nHEADERS:\n", response.headers

    pprint(response.body["results"])

    add_to_db(response.body["results"])



def get_recipe_info(recipe_id):
    """Get information for a specific recipe and store it in a dictionary to be used
    to instantiate objects in add_to_db.

    Returns the recipe id, title, image, whether it is vegan and/or vegetarian,
    all ingredients and respective measurements in the recipe, and the instructions.
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
        measurement = (ingred["amount"], ingred["unit"])
        ingredients.setdefault(ingred["name"], measurement)

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

    Only add recipes that do not exist in the database.
    """

    # response is a list of recipe dictionaries
    response = api_response

    for recipe_dict in response:

        if not db.session.query(Recipe.title).filter_by(title=recipe_dict["title"]).all():

            recipe_id = recipe_dict["id"]

            # Returns a dictionary with recipe id, title, image,
            # vegan/vegeatarian info, ingredients, instructions.
            recipe_info = get_recipe_info(recipe_id)

            recipe = Recipe(recipe_id=recipe_info["id"],
                            title=recipe_info["title"],
                            image=recipe_info["image"],
                            instructions=recipe_info["instructions"])

            db.session.add(recipe)

            # Need to commit here because recipe_id is a foreign key in the RecipeDiet table.
            db.session.commit()

            # Instantiate RecipeDiet objects for each recipe. Each recipe can have more than one diet_code.
            if recipe_info["vegan"]:
                diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="vg")
                db.session.add(diet)

            if recipe_info["vegetarian"]:
                diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="v")
                db.session.add(diet)

            # Add a diet_code of "a", which indicates no dietary restriction to all recipes.
            diet = RecipeDiet(recipe_id=recipe_info["id"], diet_code="a")
            db.session.add(diet)

            for name, measurement in recipe_info["ingredients"].items():
                if not db.session.query(Ingredient.name).filter_by(name=name).all():
                    ingredient = Ingredient(name=name)
                    db.session.add(ingredient)


                # Need the ingredient_id to instantiate a RecipeIngredient object.
                ingredient_id = db.session.query(Ingredient.ingredient_id).filter_by(name=name).one()
                recipe_ingredient = RecipeIngredient(recipe_id=recipe_id,
                                                    ingredient_id=ingredient_id,
                                                    measurement_amount=measurement[0],
                                                    measurement_unit=measurement[1])

                db.session.add(recipe_ingredient)

    db.session.commit()











if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.

    connect_to_db(app)
    print "Connected to DB."


    # # Instantiate Diet objects.
    # vegan = Diet(diet_code="vg", name="vegan")
    # vegetarian = Diet(diet_code="v", name="vegetarian")
    # pescetarian = Diet(diet_code="pes", name="pescetarian")
    # any_diet = Diet(diet_code="a", name="any")
    # paleo = Diet(diet_code="pal", name="paleo")

    # db.session.add_all([vegan, vegetarian, pescetarian, any_diet, paleo])
    # db.session.commit()

    # # Call function to seed database. Can add more recipes to database by calling
    # # function in terminal or calling function in this file. Will need to drop database
    # # and create it again if doing the latter.
    # get_restricted_recipes(includeIngredients="chicken")
    # get_restricted_recipes(includeIngredients="pork")
    # get_restricted_recipes(includeIngredients="beef")