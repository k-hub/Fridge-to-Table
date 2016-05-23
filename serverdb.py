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


@app.route("/shopping-lists")  # Route needs to be revised.
def show_shopping_lists():
    """Show user's shopping lists."""

    ###### WORKING ON THIS FUNCTION. TRYING TO STORE DATA SENT FROM AJAX IN SHOPPING LIST. #####

    if 'shopping_list' in session:
        shopping_list = session['shopping_list']

    else:
        shopping_list = session['shopping_list'] = []





    ingredient = request.args.get("ingredient_id")  # Get the ingredient_id of the ingredient clicked using AJAX. 
    print "DB: ", ingredient  # For debugging.

    # all_ingredients = []  # Create a list to store clicked ingredients.
    ingredient_object = Ingredient.query.filter(Ingredient.ingredient_id == ingredient).one()
    print "OBJECT: ", ingredient_object

    ingredient = ingredient_object.name
    print "INGREDIENT: ", ingredient
    print "JSONIFY:", jsonify({'name': ingredient})
    shopping_list.append(ingredient)

    print "SHOPPING: ", shopping_list
    # Query the ingredient clicked to get the respective ingredient object. This will be used to get the ingredient name.
    # all_ingredients.append(ingredient_objects)
    # print "ALL: ", all_ingredients  # For debugging.

    # shopping_list_ids = session.get("shopping_list", [])  # Get the shopping_list or an empty list, if there's not shopping_list yet. 

    # print "EMPTY: ", shopping_list_ids

    # shopping_list = {}  # This dictionary will be used to keep track of ingredient names.

    # for ingredient_id in shopping_list_ids:  # change ingredient_object to ingredient_id

    #     if ingredient_id in shopping_list:
    #         shopping_list_info = shopping_list[ingredient_id]

    #     else:
    #         ingredient = ingredient_object.name 
    #         shopping_list_info = shopping_list[ingredient_id] = {
    #             'ingredient_name': ingredient.name
    #         }

    # shopping_list = shopping_list.values()

    return render_template("shopping_list.html", ingredient=ingredient, shopping_list=shopping_list)


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
