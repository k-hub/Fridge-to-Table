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

    # print "RECIPE:\n", recipe  # For debugging.
    # print "INGREDIENTS:\n", ingredients  # For debugging.
    # print "INSTRUCTIONS:\n", instructions  # For debugging.
    # print "DB: ", instructions  # For debugging.

    return render_template("recipe.html", recipe=recipe, instructions=instructions, measurements_ingredients=measurements_ingredients)


@app.route("/shopping-list")
def show_shopping_list():
    """Show user's shopping list."""

    shopping_list = session.keys()  # The session keys are the ingredients the user added to the shopping list.

    return render_template("shopping_list.html", shopping_list=shopping_list)


@app.route("/add-to-shopping-list")  # This route will never be visited by user.
def add_to_shopping_list():
    """Add ingredients to shopping_list session.

    This route will never be visited by the user. Get the ingredient name
    clicked by the user on the recipe route and add to the session. 
    """

    ingredient_name = request.args.get("ingredient_name")  # Get the ingredient clicked by the user, from the server. 
    # print "DB: ", ingredient_name # For debugging.

    # print "BEFORE: ", session  # For debugging.
    if ingredient_name in session:  # When user clicks on the ingredient again, this will remove it from the shopping list.
        del session[ingredient_name]
    else:
        session.setdefault(ingredient_name, 0)  # If the user wants to add ingredient to the shopping list, user can click the ingredient.

    # import pdb; pdb.set_trace()
    # print "AFTER: ", session  # For debugging.

    # session.clear() 

    return "Success"
    

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
