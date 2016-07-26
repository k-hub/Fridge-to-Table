"""Helper functions for server.py."""

from model import db, Diet, Ingredient, Recipe, RecipeIngredient
from flask import session
import re


def query_recipes(diet, ingredients):
    """Query for recipes by diet and ingredients."""

    recipes = Recipe.query.filter(Recipe.diets.any(
                                  Diet.name == diet)).filter(
                                  Recipe.ingredients.any(
                                  Ingredient.name.in_(ingredients))).all()

    return recipes


def display_recipe(recipe_id):
    """Display recipe information."""

    recipe = Recipe.query.filter_by(recipe_id=recipe_id).one()

    instructions = recipe.instructions

    # Remove HTML tags from instructions with regex. Expression means to match strings
    # that start with < that don't match characters in the following set [^>].
    # * means to match 0 or more of the preceding token. The last character of the string being >.
    # Source: http://stackoverflow.com/questions/3662142/how-to-remove-tags-from-a-string-in-python-using-regular-expressions-not-in-ht
    instructions = re.sub('<[^>]*>', '', instructions)

    measurements_ingredients = db.session.query(RecipeIngredient.measurement_amount,
                                                RecipeIngredient.measurement_unit,
                                                Ingredient.ingredient_id,
                                                Ingredient.name).join(Recipe).join(Ingredient).filter(
                                                Recipe.recipe_id == recipe_id).all()

    return (recipe, instructions, measurements_ingredients)


def get_ingredient_info(ingredient_ids):
    """Store ingredient ids and respective names in a list."""

    ingredients = []

    for ingredient_id in ingredient_ids:
        ingredient = db.session.query(Ingredient.ingredient_id,
                                      Ingredient.name).filter_by(
                                      ingredient_id=ingredient_id).one()
        ingredients.append(ingredient)

    return ingredients


def get_recipe_info(recipe_ids):
    """Store recipe ids and respective names in a list."""

    recipes = []

    for recipe_id in recipe_ids:
        recipe = db.session.query(Recipe.recipe_id,
                                  Recipe.title).filter_by(
                                  recipe_id=recipe_id).one()
        recipes.append(recipe)

    return recipes


def shopping_list_session():
    """Check if shopping_list is in the flask session.

    If it is not, then add it as a key to the session
    with an empy list as a value to store ingredients
    that the user adds to the shopping list.
    """

    if "shopping_list" in session:
        shopping_list = session["shopping_list"]
    else:
        shopping_list = session["shopping_list"] = []
    return shopping_list


def favorites_session():
    """Check if favorites is in the flask session.

    If it is not, then add it as a key to session
    with a empty list as a value to store recipes
    that the user favorites."""

    if "favorites" in session:
        favorites = session["favorites"]
    else:
        favorites = session["favorites"] = []

    return favorites
