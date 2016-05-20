"""Functions to query db."""


from model import connect_to_db, db, Ingredient, Recipe, RecipeIngredient, Diet, RecipeDiet
from serverdb import app  # NEED TO UNCOMMENT
# from sqlalchemy.sql import text
from sqlalchemy import func



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

##########################################################################
def query_ingredients(*ingredients):  # Function can take more than one parameter with *. Since user can input n ingredients, * was used.
    """Query input ingredients in db to check if they exist."""

    ingred_set = set()  # Set of ingredient objects found db. Used set in case user enters duplicate ingredients.
    ingred_not_in_db = set()  # Set of ingredient names not found in db.  Use this later to make calls to API.

    for ingredient in ingredients:  # ingredients is a tuple.
    # print "Check:", ingredient  # For debugging.
        try:
            ingred = Ingredient.query.filter_by(ingredient_name=ingredient).one()
            ingred_set.add(ingred)
        except:
            # print "nothing found"  # For debugging.
            ingred_not_in_db.add(ingredient)
    # print "SET: ", ingred_set  # For debugging.
    print "INGREDIENTS NOT FOUND: ", ingred_not_in_db  # For debugging.

    return ingred_not_in_db

#### Delete?
# def query_recipes_with_ingredients(*ingredients):
#     """Query for recipe titles that have any of the input ingredients and
#     return a unique set of recipe titles."""

#     query_ingredients(*ingredients)

#     unique_recipes = set()

#     for ingred in query_ingredients(*ingredients):   # This function doesn't take into account if one ingredient is entered and ingredient not in db. 
#         for recipe in ingred.recipes:
#             # print "LOOK:", recipe.title
#             unique_recipes.add(recipe.title)


#     print "UNIQUE: ", unique_recipes  # For debugging.

#     return query_recipes_for_info(unique_recipes)
#     # return unique_recipes


def query_recipes_for_info(unique_recipes):
    """Get recipe objects for the returned recipe titles from query_recipes_with_ingredients(*ingredients)."""

    recipes = []

    for recipe_title in unique_recipes:
        recipes.append(Recipe.query.filter_by(title=recipe_title).all())

    return recipes


def query_recipes_by_diet(diet="any"):  # (ingredient, diet="any")
    """Filter recipes based on user's indicated diet."""

    recipes = Recipe.query.filter(Recipe.diets.any(Diet.diet_name == diet)).all()
    return recipes


##### MAIN FUNCTION ###########
def query_recipes_by_diet(diet='any', *ingredients):  #Works for: ingredient, diet='any'
    """Query recipes for user input of any ingredients and any diet restrictions."""

    recipes = Recipe.query.filter(Recipe.diets.any(Diet.diet_name == diet)).filter(Recipe.ingredients.any(Ingredient.ingredient_name.in_(ingredients))).all()
    return recipes





# def find_missing_ingred(recipes):
#     """Find ingredients not in a db."""

#     # Store all ingredients and ingredient count to a dictionary.
#     all_ingred = dict()
#     ingred_not_in_db = []

#     for ingredient in ingredients:
#         all_ingred.setdefault(ingredient, 0) + 1
#         # print "ING: ", ingredient  # # For debugging.

#     # print "DICT BEFORE:\n", all_ingred  # For debugging.

#     # Iterate through a list of recipe objects to get ingredients used. Match this list of ingredients used to input ingredients to find out which ingredients were not found in the db.
#     for recipe in recipes:
#         for ingredient in recipe.ingredients:
#             name = ingredient.ingredient_name
#             all_ingred[name] = all_ingred.get(name, 0) + 1

#     # print "DICT AFTER:\n", all_ingred  # For debugging.

#     # Ingredients not found in the db are the ones that have a count of 0.
#     # for count, ingredient in all_ingred.items():
#     for key, value in all_ingred.items():
#         if value == 0:
#             ingred_not_in_db.append(key)
#     # print ingred_not_in_db

#     return ingred_not_in_db







if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    app.debug = True

    connect_to_db(app)
    print "Connected to DB."
