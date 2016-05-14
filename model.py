"""Models and database functions."""

from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()  # Instantiating a db oject of the class SQLAlchemy.


class Recipe(db.Model):
    """Recipes"""

    __tablename__ = "recipes"

    recipe_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String(100), unique=True, nullable=False)
    description = db.Column(db.String(2000), nullable=True)
    prep_time = db.Column(db.String(100), nullable=True)
    ready_in = db.Column(db.String(100), nullable=True)
    yield_amt = db.Column(db.String(100), nullable=True)
    image = db.Column(db.String(500), nullable=True)

    ingredients = db.relationship("Ingredient", # Establish a relationship with ingredients.
                                    secondary="recipes_ingredients",  # The association table is the secondary argument.
                                    backref="recipes")  # Uses the secondary argument for the reverse relationship between recipes and ingredients.

    def __repr__(self):
        """Represent Recipe objects as recipe_id and recipe title."""

        return "<Recipe recipe_id={} title={}>".format(self.recipe_id, self.title)


class Ingredient(db.Model):
    """Ingredients"""

    __tablename__ = "ingredients"

    ingredient_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), unique=True, nullable=False)

    def __repr__(self):
        """Represent Ingredient objects as ingredient_id and ingredient name."""

        return "<Ingredient ingredient_id={} name={}>".format(self.ingredient_id, self.name)


class RecipeIngredient(db.Model):
    """Associative table for Recipe and Ingredient."""

    __tablename__ = "recipes_ingredients"

    recipe_ingredient_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    recipe_id = db.Column(db.Integer, db.ForeignKey('recipes.recipe_id'), nullable=False)
    ingredient_id = db.Column(db.Integer, db.ForeignKey('ingredients.ingredient_id'), nullable=False)

    def __repr__(self):
        """Represent RecipeIngredient objects as recipe_ingredient_id, recipe_id, and ingredient_id."""

        return "<RecipeIngredient recipe_ingredient_id={} recipe_id={} ingredient_id={}>".format(self.recipe_ingredient_id, self.recipe_id, self.ingredient_id)


# class IngredientType(db.Model):
#     pass

# class Substitution(db.Model):
#     pass

# class Step(db.Model):
#     pass

# class Measurment(db.Model):
#     pass

# class Course(db.Model):
#     pass

# class RecipeCourse(db.Model):
#     pass

# class Diet(db.Model):
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
