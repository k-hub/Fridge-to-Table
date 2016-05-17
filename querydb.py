"""Query db"""


from model import connect_to_db, db, Ingredient, Recipe
from serverdb import app



def query_ingredient(ingredient):
    """Query ingredient in db. Only works for one ingredient."""

    # If ingredient found in db, then return ingredient object.
    # If ingredient is not in db, raise exception.
    try:
        ingred = Ingredient.query.filter_by(ingredient_name=ingredient).one()
        # print 'PRINT: ', ingred  # For debugging.
        return ingred
    except:
        # print "No recipes found."
        return None

def query_recipes_with_ingredient(ingredient):
    """Query recipes in the db that have the input ingredient. Only works for one ingredient."""

    ingred = query_ingredient(ingredient)  # Call query_ingredients and pass in input ingredient to get ingredient object.

    # If there is an ingredient object matching the input ingredient,
    # then get list of recipe objects that contain ingredient.
    if ingred:
        recipes = ingred.recipes  # Query db using .recipes attr to get list of recipe objects containing ingredient.
    # print "PRINTING RECIPES: ", recipes  # For debugging
        return recipes


def query_ingredients(*ingredients):  # Function can take more than one parameter with *. Since user can input n ingredients, * was used.
    """Query all ingredients in db.

    If all ingredients are found in the db, then the length of the input ingredients will
    be equal to the length of the list of recipe objects returned.
    """

    ingredients = set(ingredients)  # In case user inputs duplicate ingredients.

    all_ingredients = Ingredient.query.filter(Ingredient.ingredient_name.in_((ingredients))).all()
    if len(ingredients) == len(all_ingredients):
        # print "MATCH"  # For debugging
        return all_ingredients
    return "Some or all of ingredients not found in db."



    # ingred_list = []

    # for ingredient in ingredients:
    #     print "LENGTH: ", len(ingredients)  # For debugging.
    #     print "TYPE: ", type(ingredients)  # tuple # For debugging.
    #     try:
    #         print "CHECKING: ", ingredient  # For debugging.
    #         ingred = Ingredient.query.filter_by(ingredient_name=ingredient).one()
    #         ingred_list.append(ingred)
    #         print "FOUND: ", ingred  # For debugging.
    #     except:
    #         print "{} ingredient not found in db.".format(ingredient)
    #         break

    # if len(ingredients) == len(ingred_list):  # If True, then all input ingredients were found in the db. 
    #     print "MATCH"



# def query_recipes_with_all_ingredients(*ingredients):  # Function can take more than one parameter with *. Since user can input n ingredients, * was used.
#     """Query recipes in the db that have all input ingredients."""

#     all_ingredients = [ingredients]

#     ingreds 













if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    app.debug = True

    connect_to_db(app)
    print "Connected to DB."
