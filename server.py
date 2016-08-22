from jinja2 import StrictUndefined

from flask import Flask, render_template, request, redirect, session, jsonify, flash, g

from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db, Diet, Ingredient, Recipe, RecipeIngredient, ShoppingList, User, Role

from helperfuncserver import query_recipes, display_recipe, get_ingredient_info, get_recipe_info, shopping_list_session, favorites_session

import os

from sqlalchemy.orm.exc import NoResultFound

from flask.ext.security import login_required
from flask.ext.login import LoginManager, logout_user, current_user, login_user

# from send_sms import send_sms


app = Flask(__name__)

app.secret_key = os.environ["APP_SECRET_KEY"]

# Raises an error if error made in Jinja2.
app.jinja_env.undefined = StrictUndefined

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login_form'

@login_manager.user_loader
def load_user(id):
    return User.query.get(int(id))


@app.route("/")
def index():
    """Return Homepage."""

    print "INDEX SESSION", session #for debugging
    return render_template("homepagedb.html")


@app.route("/search-results")
def results():
    """Return search results for user's input ingredients.

    There are two ways to search for recipes. The search bar on the homepage
    or the search bar in the nav bar.
    """

    # If user uses the search field in the nav bar, get the input ingredient(s).
    if request.args.get("ingredient-nav-search"):
        ingredients = request.args.get("ingredient-nav-search")

    # Get the ingredient(s) inputted by the user from the homepage.
    else:
        ingredients = request.args.get("ingredient")

    ingredients = ingredients.split(' ')

    if request.args.get("diet"):
        diet = request.args.get("diet")

    # Default diet for navbar search.
    else:
        diet = "any"

    # Get recipes that meet user indicated diet and any of the input ingredients.
    recipes = query_recipes(diet, ingredients)

    return render_template("search_resultsdb.html", recipes=recipes)


@app.route("/recipe/<int:recipe_id>")
def show_recipe(recipe_id):
    """Return recipe that user clicks on from /search_results."""

    recipe, instructions, measurements_ingredients = display_recipe(recipe_id)

    print "RECIPE SESSION", session # for debugging

    return render_template("recipe.html", recipe=recipe, instructions=instructions,
                            measurements_ingredients=measurements_ingredients)


@app.route("/shopping-list")
def show_shopping_list():
    """Show user's shopping list."""

    shopping_list = shopping_list_session()

    # get_ingredient_info returns a list of ingredient id and ingredient
    # name tuples if called.
    if shopping_list:
        ingredients = get_ingredient_info(shopping_list)
    else:
        ingredients = shopping_list

    print 'SESSION SHOPPING', session  # for debugging

    return render_template("shopping_list.html", shopping_list=ingredients)


@app.route("/shopping-list", methods=["POST"])
def add_to_shopping_list():
    """Add ingredients to shopping_list session.

    The id(s) of the ingredient(s) clicked by the user will be added to the shopping_list.
    """

    ingredient_id = request.form.get("ingredient_id")

    ingredient_id = int(ingredient_id)

    shopping_list = shopping_list_session()

    if ingredient_id not in shopping_list:
        shopping_list.append(ingredient_id)
        print "post ingredient to list", shopping_list # for debugging

    # if 
    #     ShoppingList.query.filter_by(id=user.id).one().shoppinglist_id    


    # Render a template that will never display.
    return render_template("temp.html")


@app.route("/remove-from-shopping-list", methods=["POST"])
def remove_ingredient():
    """Remove ingredients from shopping list session.

    User will never visit this route.
    """

    ingredient = request.form.get("ingredient_id")

    ingredient = int(ingredient)

    session["shopping_list"].remove(ingredient)

    # Render a template that will never display.
    return render_template("temp.html")


@app.route("/favorites")
@login_required
def show_saved_recipes():
    """Show user's bookmarked recipes."""

    # Call function to check or create favorites in the flask session.
    # favorites will contain recipe ids if not empty.
    favorites = favorites_session()

    # get_recipe_info returns a list of recipe id and recipe title tuples if called.
    if favorites:
        recipes = get_recipe_info(favorites)
    else:
        recipes = favorites

    return render_template("favorites.html", recipes=recipes)


@app.route("/favorites", methods=["POST"])
def add_recipes():
    """Save recipe to favorites."""

    try:
        if session["user_id"]:
            pass
    except:
        flash("Please login to save recipe.")

    recipe_id = request.form.get("recipe_id")
    recipe_id = int(recipe_id)

    favorites = favorites_session()

    if recipe_id not in favorites:
        favorites.append(recipe_id)
        print "adding recipe", favorites # for debugging
        print "FAVE SESSION", session # for debugging

    # Render a template that will never display.
    return render_template("temp.html")


@app.route("/remove-from-favorites", methods=["POST"])
def remove_recipe():
    """Remove recipes from favorites session.

    User will never visit this route.
    """

    recipe = request.form.get("recipe_id")

    recipe = int(recipe)

    session["favorites"].remove(recipe)

    # Render a template that will never display.
    return render_template("temp.html")


@app.route("/register", methods=["GET"])
def show_registration_form():
    """Show registration form."""

    return render_template("register.html")


@app.route("/register", methods=["POST"])
def register_process():
    """Process registration form."""

    first_name = request.form.get("first_name")
    last_name = request.form.get("last_name")
    email = request.form.get("email")
    password = request.form.get("password")

    try:
        user = User.query.filter_by(email=email).one()
        flash("Email has already been registered. Please login.")
        return redirect("/register")

    except NoResultFound:
        new_user = User(fname=first_name, lname=last_name, email=email, password=password, active=True)
        db.session.add(new_user)
        db.session.commit()

        user = User.query.filter_by(email=email).one()

        shopping_list = ShoppingList(id=user.id)
        db.session.add(shopping_list)
        db.session.commit()

        flash("User successfully registered.")

        return redirect("/login")


@app.route("/login", methods=["GET"])
def login_form():
    """Show login form."""

    return render_template("login.html")


@app.route("/login", methods=["POST"])
def login_process():
    """Process login."""

    email = request.form.get("email")
    password = request.form.get("password")

    remember = False
    if 'remember' in request.form:
        remember = True

    try:
        user = User.query.filter_by(email=email, password=password).one()
    except NoResultFound:
        flash("The email address or password you entered is incorrect.")
        return redirect("/login")

    login_user(user, remember=remember)

    session["current_session"] = {"user": user.id,
                                  "shoppinglist_id": ShoppingList.query.filter_by(id=user.id).one().shoppinglist_id}

    flash("Successfully logged in.")

    return redirect("/")


@app.route("/logout")
def logout():
    """Logout user."""

    logout_user()
    try:
        if session["current_session"]:
            del session["current_session"]
    except:
        pass

    try:
        if session["shopping_list"]:
            del session["shopping_list"]
    except:
        pass

    try:
        if session["favorites"]:
            del session["favorites"]
    except:
        pass

    return redirect("/")


@app.before_request
def before_request():
    g.user = current_user
    print "CURRENT", g.user  # for debugging









if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run()
