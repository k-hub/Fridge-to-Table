from flask_sqlalchemy import SQLAlchemy as SQA

db = SQA()  # Instantiating a db oject of the class SQLAlchemy.

class Recipe(db.Model):
    """Recipes"""

    __tablename__ = "recipes"

    recipe_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(100), nullable=False, unique=True)

class Ingredient(db.Model):
    pass

class RecipeIngredient(db.Model):
    pass

class Step(db.Model):
    pass

class Measurment(db.Model):
    pass

class IngredientType(db.Model):
    pass

class RecipeIngredientType(db.Model):
    pass

class Course(db.Model):
    pass

class RecipeCourse(db.Model):
    pass

class Diet(db.Model):
    pass

class Substitution(db.Model):
    pass


def connect_to_db(app):
    """Connect database to Flask app."""
    app.config['SQLAlchemy_DATABASE_URI'] = 'postgresql:///sampledb'
    app.config['SQLAlchemy_ECHO'] = True
    db.app = app
    db.init_app(app)

if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
