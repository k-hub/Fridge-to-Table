from jinja2 import StrictUndefined

from flask import Flask, render_template, request, redirect, session, jsonify, flash

from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db, Diet, Ingredient, Recipe, RecipeIngredient

from helperfuncserver import query_recipes, display_recipe, get_ingredient_info, get_recipe_info

import os

import json

# from send_sms import send_sms
# import re



app = Flask(__name__)

app.secret_key = os.environ["APP_SECRET_KEY"]

# Raises an error if error made in Jinja2.
app.jinja_env.undefined = StrictUndefined


@app.route("/")
def index():
    """Return Homepage."""

    return render_template("homepagedb.html")


@app.route("/search-results")
def results():
    """Return search results for user's input ingredients."""

    # Get the ingredient(s) inputted by the user and pass as one
    # of the arguments in the query_recipes_by_diet.
    ingredients = request.args.get("ingredient")

    # Split the input ingredient(s) into a list.
    ingredients = ingredients.split(' ')

    # Get the user indicated diet to pass as an argument into query_recipes_by_diet.
    diet = request.args.get("diet")

    # Get recipes that meet user indicated diet and any of the input ingredients.
    recipes = query_recipes(diet, ingredients)

    return render_template("search_resultsdb.html", recipes=recipes)


@app.route("/recipe/<int:recipe_id>")
def show_recipe(recipe_id):
    """Return recipe that user clicks on from /search_results."""

    # Unpack returned values from display_recipe to be passed to template.
    recipe, instructions, measurements_ingredients = display_recipe(recipe_id)

    shopping_list = session["shopping_list"]

    return render_template("recipe.html", recipe=recipe, instructions=instructions,
                            measurements_ingredients=measurements_ingredients,
                            shopping_list=json.dumps(shopping_list))  # Use shopping_list as an object in html and js.


@app.route("/shopping-list")
def show_shopping_list():
    """Show user's shopping list."""

    # List of ingredient ids in shopping list.
    ingredient_ids = session["shopping_list"]

    # get_ingredient_info returns a list of ingredient id and ingredient name tuples.
    ingredients = get_ingredient_info(ingredient_ids)

    return render_template("shopping_list.html", shopping_list=ingredients)


@app.route("/shopping-list", methods=["POST"])
def add_to_shopping_list():
    """Add ingredients to shopping_list session."""

    # Get the ingredient_id clicked by the user sent by AJAX.
    ingredient_id = request.form.get("ingredient_id")

    # Convert unicode to int.
    ingredient_id = int(ingredient_id)

    # Check if "shopping_list" is in the session
    # if it's not, then add it as a key to session
    # with an empty list as a value to store ingredients
    # that user adds to the shopping list.
    if "shopping_list" in session:
        shopping_list = session["shopping_list"]
    else:
        shopping_list = session["shopping_list"] = []

    # Only append ingredients not currently in the shopping_list.
    if ingredient_id not in shopping_list:
        shopping_list.append(ingredient_id)

    # Render a template that will never display.
    return render_template("temp.html")


@app.route("/remove-from-shopping-list", methods=["POST"])
def remove_ingredient():
    """Remove ingredients from shopping list session.

    User will never visit this route.
    """

    ingredient = request.form.get("ingredient_id")

    # Convert unicode to int.
    ingredient = int(ingredient)

    # Remove the ingredient deleted from the shopping list view from the session.
    session["shopping_list"].remove(ingredient)

    # Render a template that will never display.
    return render_template("temp.html")


@app.route("/favorites")
def show_saved_recipes():
    """Show user's bookmarked recipes."""

    # List of recipe ids in favorites.
    recipe_ids = session["favorites"]

    # get_recipe_info returns a list of recipe id and recipe title tuples.
    recipes = get_recipe_info(recipe_ids)

    return render_template("favorites.html", recipes=recipes)


@app.route("/favorites", methods=["POST"])  # Route needs to be revised.
def add_recipes():
    """Save recipe to favorites."""

    recipe_id = request.form.get("recipe_id")
    recipe_id = int(recipe_id)

    # Check if "favorites" is in session
    # if it's not, add it as a key to session
    # with a empty list as a value to store
    # recipes that user favorites.
    if "favorites" in session:
        favorites = session["favorites"]
    else:
        favorites = session["favorites"] = []

    if recipe_id not in favorites:
        favorites.append(recipe_id)

    # Render a template that will never display.
    return render_template("temp.html")



########## Routes that need to be worked on are below this line #################################

# ### This route needs to be fixed. 
# @app.route("/send-sms")
# def send_sms_shopping_list():

#     shopping_list = session["shopping_list"]

#     ingredients = []

#     # Get the ingredient names for the ingredients in the shopping_list.
#     for ingredient_id in shopping_list:
#         ingredient = db.session.query(Ingredient.name ).filter_by(ingredient_id=ingredient_id).one()
#         ingredients.append(str(ingredient[0]))  # ingredient is a tuple so get the first index and convert unicode to string.

#     # import pdb; pdb.set_trace()
#     if len(ingredients) > 1:
#         ingredients = ", ".join(ingredients)
#         # print "MORE THAN ONE: ", ingredients
#     else:
#         ingredients = "".join(ingredients)
#         # print "LESS THAN ONE: ", ingredients

#     # print ingredients

#     sender = request.args.get("sender_number")
#     print "SENDER:", sender
#     recipient = request.args.get("recipient_number")
#     print "RECIPIENT:", recipient

#     #### If user hits submit, then call send_sms.
#     # send_sms(ingredients)  # Will send a text message with the shopping list.


#     return render_template("send_sms.html")


# @app.route("/login")  # Route needs to be revised.
# def show_profile():
#     """Show user's profile that displays user's info, shopping lists, and bookmarks."""

#     pass

# @app.route("/logout")  # Route needs to be revised.
# def show_logout():
#     """Show user's profile that displays user's info, shopping lists, and bookmarks."""

#     pass


# @app.route("/profile")  # Route needs to be revised.
# def show_user_profile():
#     """Show user's profile that displays user's info, shopping lists, and bookmarks."""

#     pass











if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run()
