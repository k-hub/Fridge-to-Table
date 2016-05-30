"""Helper functions for server.py."""

from model import connect_to_db, db, Diet, Ingredient, Recipe, RecipeIngredient
import re


def query_recipes(diet, ingredients):
    """Query for recipes by diet and ingredients."""

    # Query for recipes in the database that meet user indicated diet and any of the input ingredients.
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

    # Perform this query to get the measurements, ingredients, and ingredient ids.
    # Display measurements and ingredients to user.
    measurements_ingredients = db.session.query(RecipeIngredient.measurement,
                                                Ingredient.ingredient_id,
                                                Ingredient.name).join(Recipe).join(Ingredient).filter(
                                                Recipe.recipe_id == recipe_id).all()

    return (recipe, instructions, measurements_ingredients)


def get_ingredient_info(ingredient_ids):
    """Store ingredient ids and respective names in a list."""
    
    ingredients = []

    # Get the ingredient names for the ingredients in the shopping_list.
    for ingredient_id in ingredient_ids:
        ingredient = db.session.query(Ingredient.ingredient_id,
                                        Ingredient.name).filter_by(
                                        ingredient_id=ingredient_id).one()
        ingredients.append(ingredient)

    return ingredients


def get_recipe_info(recipe_ids):
    """Store recipe ids and respective names in a list."""

    recipes = []

    # Query database for recipe titles by recipe_id.
    for recipe_id in recipe_ids:
        recipe = db.session.query(Recipe.recipe_id,
                                        Recipe.title).filter_by(
                                        recipe_id=recipe_id).one()
        recipes.append(recipe)

    return recipes