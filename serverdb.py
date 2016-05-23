from jinja2 import StrictUndefined

from flask import Flask, render_template, request, redirect, session, jsonify

from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db, Recipe, Ingredient, RecipeIngredient

import querydb  # Need to comment this line out if running querydb.py in interactive python.

import spoonacular

import re



app = Flask(__name__)

app.secret_key = "FOOD123"  # Required to use Flask sessions and the debug toolbar.

app.jinja_env.undefined = StrictUndefined  # Raises an error if error made in Jinja2.


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


@app.route("/recipe/<int:recipe_id>")  # Route needs to be revised.
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


@app.route("/shopping-lists")  # Route needs to be revised.
def show_shopping_lists():
    """Show user's shopping lists."""

    return render_template("shopping_list.html")


@app.route("/bookmarks")  # Route needs to be revised.
def show_bookmarks():
    """Show user's bookmarked recipes."""

    pass


@app.route("/profile")  # Route needs to be revised.
def show_profile():
    """Show user's profile that displays user's info, shopping lists, and bookmarks."""

    pass



# @app.route("/search-results")  # Route needs to be revised.
# def results():
#     """Return search results for user's input ingredients."""

#     search = request.args.get("search")
#     search_results = get_recipes(search)  # Returns a list of recipe dictionaries.

#     return render_template("search_results.html", search_results=search_results)



# @app.route("/recipe/<int:recipe_id>")  # Route needs to be revised.
# def show_recipe(recipe_id):
#     """Return recipe that user clicks on from /search_results."""

#     # recipe = request.args.get("recipe_id") ## To make alert pop up from AJAX.
#     # print "TEST: ", recipe
#     recipe = get_recipe_source(recipe_id)  # Get the recipe instructions.

#     return render_template("recipe.html", recipe=recipe)




if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run()
