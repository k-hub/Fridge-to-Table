"""Query db"""


from model import connect_to_db, db, Ingredient, Recipe, RecipeIngredient
from serverdb import app
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
            print "nothing found"  # For debugging.
            ingred_not_in_db.add(ingredient)
    # print "SET: ", ingred_set  # For debugging.
    # print "LIST: ", ingred_not_in_db  # For debugging.

    return ingred_set
    # return query_recipes_with_ingredients(ingred_set)
    # return ingred_set  # , ingred_not_in_db

    # ingreds = list(ingred_set)
    # print "DB: ", ingreds
    # Recipe.query.filter(Recipe.ingredients.any(Ingredient.ingredient_name.in_(ingreds))).all()



def query_recipes_with_ingredients(*ingredients):
    """Query for recipe titles that have any of the input ingredients and 
    return a unique set of recipe titles."""

    query_ingredients(*ingredients)

    unique_recipes = set()

    for ingred in query_ingredients(*ingredients):
        for recipe in ingred.recipes:
            # print "LOOK:", recipe.title
            unique_recipes.add(recipe.title)


    print "UNIQUE: ", unique_recipes  # For debugging.

    return query_recipes_for_info(unique_recipes)
    # return unique_recipes


def query_recipes_for_info(unique_recipes):
    """Get recipe objects from query_recipes_with_ingredients(*ingredients)"""

    recipes = []

    for recipe_title in unique_recipes:
        recipes.append(Recipe.query.filter_by(title=recipe_title).all())
    return recipes


# def query_recipes_with_ingredients(ingred_set):
#     """Query db for recipes that contain any of the input ingredients."""

#     recipes = []

#     for ingred in ingred_set:
#         recipes.extend(ingred.recipes)
#     # print "LOOK: ", recipes  # For debugging.

#     unique_recipes = set(recipes)  # A set of unique recipe objects that contain one or more of the input ingredients.

#     # print "UNIQUE: ", unique_recipes  # For debugging.

#     if len(unique_recipes) > 1:
#         return unique_recipes  # Returns ingredients that contain any of the input ingredients if the ingredients exist in the db.



# ## Below code works but not in server. 
# def query_recipes_with_all_ingredients(*ingredients):
#     """Query for recipes that contain input ingredients.

#     If more than one ingredient input, then the order of recipes found will be
#     in descending order of recipes with the largest amount of ingredients to
#     smallest amount of ingredients used.
#     """


#     ingred_set = set()  # Set of ingredient objects found db. Used set in case user enters duplicate ingredients.
#     ingred_not_in_db = set()  # Set of ingredient names not found in db.  Use this later to make calls to API.

#     for ingredient in ingredients:  # ingredients is a tuple.
#         # print "Check:", ingredient  # For debugging.
#         try:
#             ingred = Ingredient.query.filter_by(ingredient_name=ingredient).one()
#             ingred_set.add(ingred)
#         except:
#             # print "nothing found"  # For debugging.
#             ingred_not_in_db.add(ingredient)
#     # print "SET: ", ingred_set  # For debugging.
#     # print "LIST: ", ingred_not_in_db  # For debugging.



#     # Get ingredient ids (if they exist in db) and append to ingredient_ids list.
#     ingredient_ids = []

#     for ingredient in ingred_set:
#         ingredient_ids.append(ingredient.ingredient_id)

#     # print "I IDS: ", ingredient_ids  # For debugging.


#     # Pass ingredient_ids list into query to get recipe_ids that contain any of the
#     # ingredients found in the db. Returns a list of tuples containing
#     # recipe id and the number of input ingredients used in the recipe.
#     results = db.session.query(RecipeIngredient.recipe_id, func.count(RecipeIngredient.ingredient_id)).filter(RecipeIngredient.ingredient_id.in_(ingredient_ids)).group_by(RecipeIngredient.recipe_id).order_by(func.count(RecipeIngredient.ingredient_id).desc()).all()

#     # print "RESULTS: ", results # For debugging.


#     recipes = []  # Will store lists of recipe objects.

#     for recipe_id in results:
#         # print recipe_id[0]    # For debugging.
#         recipes.append(Recipe.query.filter(Recipe.recipe_id==recipe_id[0]).all())
#     return recipes


#     # For debugging.
#     # for recipe in recipes:
#     #     print recipe[0].title






######## This function only works for two ingredients. 
# def query_recipes_with_all_ingredients(*ingredients):  # Function can take more than one parameter with *. Since user can input n ingredients, * was used. A tuple. 
#     """Query recipes in the db that have all input ingredients."""

#     # all_ingredients = query_ingredients(*ingredients)
#     # print all_ingredients
 
#     # Iterate through input tuple of ingredients to append to a all_ingredients list.
#     all_ingredients = []

#     for ingredient in ingredients:
#         all_ingredients.append(ingredient)

#     # print "LIST: ", all_ingredients  # For debugging.

#     # Iterate through all_ingredients list to get all recipe objects for every input ingredient and append to all_recipes list.
#     all_recipes = list()

#     for ingredient in all_ingredients:
#         all_recipes.append(query_recipes_with_ingredient(ingredient))


#     print "ALL:\n", all_recipes  # For debugging.

    
#     # Iterate through all_recipes list and add/append to appropriate collection.
#     common_recipes = set()  # Recipes that contain all input ingredients.
#     not_in_common_recipes = list()

#     for recipes in all_recipes:
#         for recipe in recipes:
#             if recipe.title in not_in_common_recipes:
#                 common_recipes.add(recipe.title)
#             not_in_common_recipes.append(recipe.title)

#     # For debugging.
#     print
#     print "common_recipes:\n", common_recipes
#     print 
#     print "not_in_common_recipes:\n", not_in_common_recipes 


#     # Query for recipes found in common_recipes.
#     for recipe in common_recipes:
#         find = Recipe.query.filter_by(title=recipe).one()
#         print "find: ", find








# def query_ingredients(*ingredients):  # Function can take more than one parameter with *. Since user can input n ingredients, * was used.
#     """Query all ingredients in db. Checking if all ingredients exist in db and get their ingredient_ids."""

#     # ingredients = set(ingredients)  # In case user inputs duplicate ingredients.

#     # all_ingredients = Ingredient.query.filter(Ingredient.ingredient_name.in_((ingredients))).all()
#     # if len(ingredients) == len(all_ingredients):
#     #     # print "MATCH"  # For debugging
#     #     return all_ingredients
#     # return "Some or all of ingredients not found in db."

#     # ingredients = set(ingredients)  # In case user inputs duplicate ingredients.

#     # all_ingredients = Ingredient.query.filter(Ingredient.ingredient_name.in_((ingredients))).all()
#     # print all_ingredients

#     # for ingredients in all_ingredients:
#     #     print ingredients.ingredient_id

#     # # if len(ingredients) == len(all_ingredients):
#     # #     # print "MATCH"  # For debugging
#     # #     return all_ingredients
#     # # return "Some or all of ingredients not found in db."



#     ingred_set = set()  # Put in set in case user enters duplicate ingredient name

#     for ingredient in ingredients:
#         # print "LENGTH: ", len(ingredients)  # For debugging.
#         # print "TYPE: ", type(ingredients)  # tuple # For debugging.
#         try:
#             print "CHECKING: ", ingredient  # For debugging.
#             ingred = Ingredient.query.filter_by(ingredient_name=ingredient).one()
#             ingred_set.add(ingred)
#             print "FOUND: ", ingred  # For debugging.
#         except:
#             print "{} ingredient not found in db.".format(ingredient)

    # return ingred_set

        # >>> query_ingredients('duck', 'bacon', 'chicken')
        # CHECKING:  duck
        # duck ingredient not found in db.
        # CHECKING:  bacon
        # FOUND:  <Ingredient ingredient_id=3 name=bacon>
        # CHECKING:  chicken
        # FOUND:  <Ingredient ingredient_id=1 name=chicken>
        # set([<Ingredient ingredient_id=3 name=bacon>, <Ingredient ingredient_id=1 name=chicken>]




if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.
    app.debug = True

    connect_to_db(app)
    print "Connected to DB."
