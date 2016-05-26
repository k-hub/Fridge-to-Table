from jinja2 import StrictUndefined

from flask import Flask, render_template, request, redirect, session, jsonify, flash

from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db, Recipe, Ingredient, RecipeIngredient

import querydb  # Need to comment this line out if running querydb.py in interactive python.

# import spoonacular

import re

import os

import json



app = Flask(__name__)

app.secret_key = os.environ["APP_SECRET_KEY"]

app.jinja_env.undefined = StrictUndefined  # Raises an error if error made in Jinja2.





@app.route("/")
def index():
    """Return Homepage."""

    return render_template("homepagedb.html")


@app.route("/search-results")
def results():
    """Return search results for user's input ingredients."""


    ingredients = request.args.get("ingredient")  # Get the ingredient(s) inputted by the user and pass as one
    # of the arguments in the query_recipes_by_diet.
    ingredients = ingredients.split(' ')  # Split the ingredient(s) into a list.

    diet = request.args.get("diet")  # Get the user indicated diet to pass as an argument into query_recipes_by_diet.

    recipes = querydb.query_recipes_by_diet(diet, *ingredients)  # Query for recipes in the database that contain any of the input ingredients.
    
    return render_template("search_resultsdb.html", recipes=recipes, ingredients=ingredients)


@app.route("/recipe/<int:recipe_id>")
def show_recipe(recipe_id):
    """Return recipe that user clicks on from /search_results."""

    recipe = Recipe.query.filter_by(recipe_id=recipe_id).one()

    instructions = recipe.instructions

    # Remove HTML tags from instructions with regex. Expression means to match strings that start with < that don't match characters in the following set [^>]. * means to match 0 or more of the preceding token. The last character of the string being >.
    instructions = re.sub('<[^>]*>', '', instructions)  # Source: http://stackoverflow.com/questions/3662142/how-to-remove-tags-from-a-string-in-python-using-regular-expressions-not-in-ht

    # Perform this query to get the measurements, ingredients, and ingredient ids. Display measurements and ingredients to user.
    measurements_ingredients = db.session.query(RecipeIngredient.measurement, Ingredient.ingredient_id, Ingredient.name).join(Recipe).join(Ingredient).filter(Recipe.recipe_id == recipe_id).all()

    # print measurements_ingredients

    # print "RECIPE:\n", recipe  # For debugging.
    # print "INGREDIENTS:\n", ingredients  # For debugging.
    # print "INSTRUCTIONS:\n", instructions  # For debugging.
    # print "DB: ", instructions  # For debugging.
    shopping_list = session.keys()

    return render_template("recipe.html", recipe=recipe, instructions=instructions, measurements_ingredients=measurements_ingredients, shopping_list=json.dumps(shopping_list))  # Use shopping_list as an object in html and js.


@app.route("/shopping-list")
def show_shopping_list():
    """Show user's shopping list."""

    ingredient_ids = session["shopping_list"]  # List of ingredient ids.
    # print "DEBUGGING:", get_shopping_list

    # import pdb; pdb.set_trace()

    ingredient_names = []

    # Get the ingredient names for the ingredients in the shopping_list.
    for ingredient_id in ingredient_ids:
        ingredient = Ingredient.query.filter_by(ingredient_id=ingredient_id).one()  # Did query this way because db.session.query gave the ingredients in unicode.
        ingredient_name = ingredient.name
        ingredient_names.append(ingredient_name)

    # print "DEBUGGING: ", ingredient_names


    return render_template("shopping_list.html", shopping_list=ingredient_names)


@app.route("/shopping-list", methods=['POST'])
def add_to_shopping_list():
    """Add ingredients to shopping_list session."""

    # session.clear()

    ingredient_id = request.form.get("ingredient_id")  # Get the ingredient_id clicked by the user sent by AJAX.// change to ingredient id and then query ingredient id for ingredient name to pass into html.

    if "shopping_list" in session:
        shopping_list = session["shopping_list"]
    else:
        shopping_list = session["shopping_list"] = []


    if ingredient_id not in shopping_list:  # Only append ingredients not currently in the shopping_list.
        shopping_list.append(ingredient_id)
    else:
        flash("Ingredient already in list!")
    
    print "DEBUG:", session["shopping_list"]







    # print "BEFORE: ", session  # For debugging.
    # if ingredient_name in session:  # When user clicks on the ingredient again, this will remove it from the shopping list.
    #     del session[ingredient_name]
    # else:
    # session.setdefault(ingredient_name, 0)  # If the user wants to add ingredient to the shopping list, user can click the ingredient. Will not add duplicate ingredient.


    # session.setdefault("shopping_list", {})

    # main_session = session["shopping_list"]
    # print "OUTER: ", main_session
    # # if session["shopping_list"]:
    # # print "CHECK:", main_session.get(ingredient_name)  # For Debugging.

    # if main_session.get(ingredient_name):  # If user tries to add an ingredient that exists in the shopping_list dictionary, user will be notified that ingredient is in already there.
    #     print "ALREADY ADDED.\n"  ##### Need to flash a message here to let user know ingredient already in shopping list.

    # main_session.setdefault(ingredient_name, 0) 


    # import pdb; pdb.set_trace()

    # session.clear() 

    return "Success"
    








# # @app.route("/favorites")  # Route needs to be revised.
# # def show_saved_recipes():
# #     """Show user's bookmarked recipes."""

# #     saved_recipes = session["save_recipe"]
# #     print "DEBUG:", saved_recipes

# #     return render_template("savedrecipes.html", saved_recipe=saved_recipe)



# @app.route("/favorites", methods=["POST"])  # Route needs to be revised.
# def add_recipes():
#     """Save recipe to favorites."""

#     recipe_title = request.form.get("save_recipe")

#     print session

#     # print "DEBUG", recipe_title



#     session.setdefault("save_recipe", []).append(recipe_title)
#     # import pdb; pdb.set_trace()


#     saved = session["save_recipe"]

#     print "FAVORITES: ", saved  # For debugging.

#     session.clear()

#     print session
#     return "Sucess"


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











if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run()
