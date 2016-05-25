from jinja2 import StrictUndefined

from flask import Flask, render_template, request, redirect, session, jsonify, flash

from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db, Recipe, Ingredient, RecipeIngredient

import querydb  # Need to comment this line out if running querydb.py in interactive python.

import spoonacular

import re

import os



app = Flask(__name__)

app.secret_key = os.environ["APP_SECRET_KEY"]

app.jinja_env.undefined = StrictUndefined  # Raises an error if error made in Jinja2.

global shopping_dict  # Defined a global shopping_dict for /add-to-shopping-list because can't define a variable outside the function in an @app.route.
shopping_dict = {}




@app.route("/")
def index():
    """Return Homepage."""

    return render_template("homepagedb.html")


@app.route("/search-results")
def results():
    """Return search results for user's input ingredients."""


    ingredients = request.args.get("ingredient")
    ingredients = ingredients.split(' ')

    diet = request.args.get("diet")

    recipes = querydb.query_recipes_by_diet(diet, *ingredients)  # Query for recipes in the database that contain any of the input ingredients.
    

    # ######## Unneccessary code below ##############
    # # Each ingredient not found in the database will be used in the API call to get recipes containing that ingredient. Ingredient and recipe information will be added to the database.
    # ingred_not_found = querydb.query_ingredients(*ingredients)  # Get the user input ingredient(s) not found in the database, returned as a set.
    # if ingred_not_found:  # If there are missing ingredients, then call a function to make an API request.
    #     print "MISSING:", ingred_not_found
    #     for ingredient in ingred_not_found:
    #         print "DIET:", diet
    #         print "SEARCHING:", ingredient
    #         spoonacular.get_restricted_recipes(diet=diet, includeIngredients=ingredient)


    # print "Before: ", ingredients  # For debugging.
    # ingredients = ''.join(ingredients)
    # print "After first join: ", ingredients
    # print "DB: ", ingredients  # For debugging.
    # print "DIET: ", diet  # For debugging.

    return render_template("search_resultsdb.html", recipes=recipes, ingredients=ingredients)


@app.route("/recipe/<int:recipe_id>")
def show_recipe(recipe_id):
    """Return recipe that user clicks on from /search_results."""

    recipe = Recipe.query.filter_by(recipe_id=recipe_id).one()

    instructions = recipe.instructions
    instructions = re.sub('<[^>]*>', '', instructions)  # Source: http://stackoverflow.com/questions/3662142/how-to-remove-tags-from-a-string-in-python-using-regular-expressions-not-in-ht
    # Remove HTML tags from instructions with regex. Expression means to match strings that start with < that don't match characters in the following set [^>]. * means to match 0 or more of the preceding token. The last character of the string being >.

    measurements_ingredients = db.session.query(RecipeIngredient.measurement, Ingredient.ingredient_id, Ingredient.name).join(Recipe).join(Ingredient).filter(Recipe.recipe_id == recipe_id).all()

    # print "RECIPE:\n", recipe  # For debugging.
    # print "INGREDIENTS:\n", ingredients  # For debugging.
    # print "INSTRUCTIONS:\n", instructions  # For debugging.
    # print "DB: ", instructions  # For debugging.

    return render_template("recipe.html", recipe=recipe, instructions=instructions, measurements_ingredients=measurements_ingredients)


@app.route("/shopping-list")  # Route needs to be revised.
def show_shopping_list():
    """Show user's shopping list."""

    
    return "test"


@app.route("/add-to-shopping-list")  # This route will never be visited by user.
def add_to_shopping_list():
    
    ###### WORKING ON THIS FUNCTION. TRYING TO STORE DATA SENT FROM AJAX IN SHOPPING LIST. #####

    ingredient_name = request.args.get("ingredient_name")  # Get the ingredient_id of the ingredient clicked using AJAX. 
    print "DB: ", ingredient_name # For debugging.

    # import pdb; pdb.set_trace()

    # session.clear() 

    print "BEFORE:", shopping_dict

    if ingredient_name in shopping_dict:
        del shopping_dict[ingredient_name]
    else:
        shopping_dict.setdefault(ingredient_name, 0)

    # session.setdefault("shopping_list", shopping_dict)
    print "AFTER:", shopping_dict

    # print "SESSION:", session['shopping_list']


    return "hello"
    

 # shopping_list_ids = session.setdefault("shopping_list", []).append(ingredient_name)
    # Get the shopping_list or an empty list, if there's not shopping_list yet. 


    # print "SESSION KEYS: ", session.keys()
    # print "SESSION VALUES: ", session["shopping_list"]
    # # print "SHOPPING IDS: ", shopping_list_ids

    # # shopping_list = session.values()
    # # import pdb; pdb.set_trace()


    # # print "SHOPPING LIST:", shopping_list

    # shopping_list = session["shopping_list"]

    # Query the ingredient clicked to get the respective ingredient object. This will be used to get the ingredient name.


    # shopping_list = {}  # This dictionary will be used to keep track of ingredient names.

    # for ingredient_name in shopping_list_ids:  # change ingredient_object to ingredient_id

    #     if ingredient_name in shopping_list:
    #         shopping_list_info = shopping_list[ingredient_name]

    #     else:
    #         ingredient = ingredient_id
    #         shopping_list_info = shopping_list[ingredient_name] = {
    #             'ingredient_name': ingredient_name
    #         }

    # shopping_list = shopping_list_info.values()

    # return (ingredient_id)

    # return render_template ("shopping_list.html", shopping_list=shopping_list)



@app.route("/login")  # Route needs to be revised.
def show_profile():
    """Show user's profile that displays user's info, shopping lists, and bookmarks."""

    pass

@app.route("/logout")  # Route needs to be revised.
def show_logout():
    """Show user's profile that displays user's info, shopping lists, and bookmarks."""

    pass


@app.route("/profile")  # Route needs to be revised.
def show_user_profile():
    """Show user's profile that displays user's info, shopping lists, and bookmarks."""

    pass


@app.route("/bookmarks")  # Route needs to be revised.
def show_bookmarks():
    """Show user's bookmarked recipes."""

    pass




if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run()
