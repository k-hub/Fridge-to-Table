"""Models and database functions."""

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import func


db = SQLAlchemy()  # Instantiating a db oject of the class SQLAlchemy.


class Recipe(db.Model):
    """Recipes and recipe information."""

    __tablename__ = "recipes"

    recipe_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(100), unique=True, nullable=False)
    # description = db.Column(db.String(2000), nullable=False)  # Recipe description \
    prep_time = db.Column(db.String(100), nullable=True)  # Change back to nullable=False
    ready_in = db.Column(db.String(100), nullable=True)  # Change back to nullable=False
    yield_amt = db.Column(db.String(100), nullable=True)
    image = db.Column(db.String(500), nullable=True)
    instructions = db. Column(db.String(20000), nullable=True)  # Change back to nullable=False
    # diet = db.Column(db.Integer, db.ForeignKey("diets.diet_id"), nullable=False)

    ingredients = db.relationship("Ingredient", # Establish a relationship with ingredients.
                                    secondary="recipe_ingredients",  # The association table is the secondary argument.
                                    backref="recipes")  # Uses the secondary argument for the reverse relationship between recipes and ingredients.

    def __repr__(self):
        """Represent Recipe objects as recipe_id and recipe title."""

        return "<Recipe recipe_id={} title={}>".format(self.recipe_id, self.title)



# CHECK ALL BACKREFS
##########################################################################################
class Ingredient(db.Model):
    """Ingredients."""

    __tablename__ = "ingredients"

    ingredient_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ingredient_name = db.Column(db.String(100), unique=True, nullable=False)

    types = db.relationship("Type",
                            secondary="ingredient_types",
                            backref="ingredients")

    def __repr__(self):
        """Represent Ingredient objects as ingredient_id and ingredient_name."""

        return "<Ingredient ingredient_id={} name={}>".format(self.ingredient_id, self.ingredient_name)


class RecipeIngredient(db.Model):
    """"""

    __tablename__ = "recipe_ingredients"

    recipe_ingredient_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    recipe_id = db.Column(db.Integer, db.ForeignKey("recipes.recipe_id"), nullable=False)
    ingredient_id = db.Column(db.Integer, db.ForeignKey("ingredients.ingredient_id"), nullable=False)
    measurement = db.Column(db.String(50), nullable=True)  # Change back to nullable=False

    def __repr__(self):
        """Represent RecipeIngredient objects as recipe_ingredient_id, recipe_id, and ingredient_id."""

        return "<RecipeIngredient recipe_ingredient_id={} recipe_id={} ingredient_id={}>".format(self.recipe_ingredient_id, self.recipe_id, self.ingredient_id)


# class Measurment(db.Model):
#     """Measurements."""

#     __tablename__ = "measurements"


class Type(db.Model):  ### This table will be used to make custom recipes.
    """Type of ingredient ie. vegetable, fruit, grain, etc."""

    __tablename__ = "types"

    type_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    type_name = db.Column(db.String(100), unique=True, nullable=False)

    def __repr__(self):
        """Represent Type objects as type_id and type_name."""

        return "<Type type_id={} name={}>".format(type_id, type_name)


### Check tables below this line. ####
##########################################################################################
class IngredientType(db.Model):  ### Do I need this table? Ingredient can have many types. 
    """Association table for Ingredient and Type."""

    __tablename__ = "ingredient_types"

    ingredient_type_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    type_id = db.Column(db.Integer, db.ForeignKey("types.type_id"), nullable=False)
    ingredient_id = db.Column(db.Integer, db.ForeignKey("ingredients.ingredient_id"), nullable=False)

    def __repr__(self):
        """Represent IngredientType objects as ingredient_type_id, type_id, and ingredient_id."""

        return "<IngredientType ingredient_type_id:{}, type_id:{}, ingredient_id:{}>".format(ingredient_type_id, type_id, ingredient_id)


# class Diet(db.Model):
#     """Diets ie. vegetarian, vegan, etc."""

#     __tablename__ = "diets"

#     diet_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
#     diet_name = db.Column(db.String(100), unique=True, nullable=False)

#     def __repr__(self):
#         """Represent Diet objects as diet_id and diet_name."""

#         return "<Diet diet_id:{}, diet_name:{}>".format(diet_id, diet_name)


class Substitution(db.Model):
    """Ingredient substitutions."""

    __tablename__ = "substitutions"

    sub_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    sub_name = db.Column(db.String(100), unique=True, nullable=False)

    ingredients = db.relationship("Ingredient",
                                secondary="substitution_ingredients",
                                backref="substitutions")

    def __repr__(self):
        """Represent Substitution object as substitution_id and sub_name."""

        return "<Substitution sub_id:{}, sub_name:{}>".format(sub_id, sub_name)


class SubstitutionIngredient(db.Model):
    """"Association table for Substitution and Ingredient."""  # One substitution can be used for many ingredients and one ingredient can have many substitutions.

    __tablename__ = "substitution_ingredients"

    sub_ingredient_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    sub_id = db.Column(db.Integer, db.ForeignKey("substitutions.sub_id"), nullable=False)
    ingredient_id = db.Column(db.Integer, db.ForeignKey("ingredients.ingredient_id"), nullable=False)

    def __repr__(self):
        """Represent SubstitutionIngredient objects as sub_ingredient_id, sub_id, ingredient_id."""

        return "<SubstitutionIngredient sub_ingredient_id:{}, sub_id:{}, ingredient_id:{}>".format(sub_ingredient_id, sub_id, ingredient_id)

# class Course(db.Model):
#     pass

# class RecipeCourse(db.Model):
#     pass




def connect_to_db(app):
    """Connect database to Flask app."""

    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///recipes'
    # app.config['SQLAlchemy_ECHO'] = True
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.

    from server import app
    connect_to_db(app)
    db.create_all()
    print "Connected to DB."
