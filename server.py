from jinja2 import StrictUndefined

from flask import Flask, render_template, request, redirect, session, jsonify
# import psycopg2
from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db

from spoonacular import get_recipes, get_recipe_source, get_restricted_recipes

# from urllib import quote



app = Flask(__name__)

app.secret_key = "FOOD123"  # Required to use Flask sessions and the debug toolbar.

app.jinja_env.undefined = StrictUndefined  # Raises an error if error made in Jinja2.


@app.route("/")
def index():
    """Return Homepage."""

    return render_template("homepage.html")


# @app.route("/search-results")  # Route needs to be revised.
# def results():
#     """Return search results for user's input ingredients."""

#     search = request.args.get("search")
#     search_results = get_recipes(search)  # Returns a list of recipe dictionaries.

#     return render_template("search_results.html", search_results=search_results)

@app.route("/search-results")  # Route needs to be revised.
def results():
    """Return search results for user's input ingredients."""

    diet = request.args.get("diet")  # Get diet selected.
    intolerances = request.args.getlist("intolerance")  # Get list of all intolerances checked off.
    intolerances = ','.join(intolerances)
    # intolerances = quote(intolerances)   # Encode intolerances to be passed into get_restricted_recipes.
    # print "INTOLERANCES: ", intolerances
    # print "DIET: ", diet

    query = request.args.get("query")  # Get ingredients that user put into text-field.

    results = get_restricted_recipes(query=query, intolerances=intolerances, diet=diet)

    return render_template("search_results.html", search_results=results, intolerances=intolerances, diet=diet)


@app.route("/recipe/<int:recipe_id>")  # Route needs to be revised.
def show_recipe(recipe_id):
    """Return recipe that user clicks on from /search_results."""

    # recipe = request.args.get("recipe_id") ## To make alert pop up from AJAX.
    # print "TEST: ", recipe
    recipe = get_recipe_source(recipe_id)  # Get the recipe instructions.

    return render_template("recipe.html", recipe=recipe)


@app.route("/shopping-lists")  # Route needs to be revised.
def show_shopping_lists():
    """Show user's shopping lists."""

    pass


@app.route("/bookmarks")  # Route needs to be revised.
def show_bookmarks():
    """Show user's bookmarked recipes."""

    pass


@app.route("/profile")  # Route needs to be revised.
def show_profile():
    """Show user's profile that displays user's info, shopping lists, and bookmarks."""

    pass








if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run()
