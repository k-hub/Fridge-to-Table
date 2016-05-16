"""Seed data once."""

from server import app
from model import connect_to_db, db, Recipe, Ingredient, RecipeIngredient, Type, IngredientType, Substitution, SubstitutionIngredient




def insert_recipes():
    """Insert recipes from sampledata.sql into database."""

    print "Recipes"

    recipes = open("seed_data/sample_recipes.sql")

    for line in recipes:
        print recipes

    # db.session.add(recipes)

    # db.session.commit()



















if __name__ == "__main__":
    connect_to_db(app)
    db.create_all()
    # CALL FUNCTIONS HERE

    insert_recipes()