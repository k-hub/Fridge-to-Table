"""Query db"""


from model import connect_to_db, db, Ingredient
from serverdb import app



def query_ingredients(ingredient):
    """Query ingredient in db. Only works for one ingredient."""

    ingred = Ingredient.query.filter_by(ingredient_name=ingredient).one()
    # print 'PRINT: ', ingred  # For debugging.

    return ingred


def query_recipes_with_ingredients(ingredient):
    """Query recipes in the db that have the input ingredient. Only works for one ingredient."""

    ingred = query_ingredients(ingredient)  # Call query_ingredients and pass in input ingredient to get ingredient object.
    recipes = ingred.recipes  # Query db using .recipes attr to get recipes containing ingredient.
    # print "PRINTING RECIPES: ", recipes  # For debugging

    # if len(recipes) > 1:
        


    return recipes













if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    app.debug = True

    connect_to_db(app)
    print "Connected to DB."