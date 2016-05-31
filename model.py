"""Creating models in my db."""

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import func


db = SQLAlchemy()  # Instantiating a db oject of the class SQLAlchemy.


class Recipe(db.Model):
    """Recipes and recipe information."""

    __tablename__ = "recipes"

    recipe_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(1000), unique=True, nullable=False)
    prep_time = db.Column(db.String(100), nullable=True)
    ready_in = db.Column(db.String(100), nullable=True)
    yield_amt = db.Column(db.String(100), nullable=True)
    image = db.Column(db.String(1000), nullable=True)
    instructions = db. Column(db.String(20000), nullable=True)


    ingredients = db.relationship("Ingredient", # Establish a relationship with ingredients.
                                    secondary="recipe_ingredients",  # The association table is the secondary argument.
                                    backref="recipes")  # Uses the secondary argument for the reverse relationship between recipes and ingredients.


    diets = db.relationship("Diet",  # Establish a relationship with diets.
                                secondary="recipe_diets",
                                backref="recipes")

    def __repr__(self):
        """Represent Recipe objects as recipe_id and recipe title."""

        return "<Recipe recipe_id={} title={}>".format(self.recipe_id, self.title)


class Ingredient(db.Model):
    """Ingredient ids and names."""

    __tablename__ = "ingredients"

    ingredient_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), unique=True, nullable=False)

    types = db.relationship("Type",
                            secondary="ingredient_types",
                            backref="ingredients")

    def __repr__(self):
        """Represent Ingredient objects as ingredient_id and name."""

        return "<Ingredient ingredient_id={} name={}>".format(self.ingredient_id, self.name)


class RecipeIngredient(db.Model):
    """Ingredients and respective measurements for recipes."""

    __tablename__ = "recipe_ingredients"

    recipe_ingredient_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    recipe_id = db.Column(db.Integer, db.ForeignKey("recipes.recipe_id"), nullable=False)
    ingredient_id = db.Column(db.Integer, db.ForeignKey("ingredients.ingredient_id"), nullable=False)
    measurement = db.Column(db.String(50), nullable=True)  # Change back to nullable=False

    def __repr__(self):
        """Represent RecipeIngredient objects as recipe_ingredient_id, recipe_id, and ingredient_id."""

        return "<RecipeIngredient recipe_ingredient_id={} recipe_id={} ingredient_id={}>".format(
            self.recipe_ingredient_id, self.recipe_id, self.ingredient_id)


class Diet(db.Model):
    """Diets ie. vegetarian, vegan, etc."""

    __tablename__ = "diets"

    diet_code = db.Column(db.String(100), primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)

    def __repr__(self):
        """Represent Diet objects as diet_id and name."""

        return "<Diet diet_code:{}, name:{}>".format(self.diet_code, self.name)


class RecipeDiet(db.Model):
    """Association table for Recipe and Diet."""

    __tablename__ = 'recipe_diets'

    recipe_diet_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    recipe_id = db.Column(db.Integer, db.ForeignKey("recipes.recipe_id"), nullable=False)
    diet_code = db.Column(db.String(100), db.ForeignKey("diets.diet_code"), nullable=False)


    def __repr__(self):
        """Represent RecipeDiet objects as recipe_id and diet_code."""

        return "<RecipeDiet recipe_id:{}, diet_code:{}>".format(self.recipe_id, self.diet_code)


class Type(db.Model):  # This table will be used to make custom recipes.
    """Type of ingredient ie. vegetable, fruit, grain, etc. Will be used for intolerances."""

    __tablename__ = "types"

    type_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), unique=True, nullable=False)

    def __repr__(self):
        """Represent Type objects as type_id and name."""

        return "<Type type_id={} name={}>".format(self.type_id, self.name)


class IngredientType(db.Model):
    """Association table for Ingredient and Type."""

    __tablename__ = "ingredient_types"

    ingredient_type_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    type_id = db.Column(db.Integer, db.ForeignKey("types.type_id"), nullable=False)
    ingredient_id = db.Column(db.Integer, db.ForeignKey("ingredients.ingredient_id"), nullable=False)

    def __repr__(self):
        """Represent IngredientType objects as ingredient_type_id, type_id, and ingredient_id."""

        return "<IngredientType ingredient_type_id:{}, type_id:{}, ingredient_id:{}>".format(
            self.ingredient_type_id, self.type_id, self.ingredient_id)


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

        return "<Substitution sub_id:{}, sub_name:{}>".format(self.sub_id, self.sub_name)


class SubstitutionIngredient(db.Model):
    """"Association table for Substitution and Ingredient."""  # One substitution can be used for many ingredients and one ingredient can have many substitutions.

    __tablename__ = "substitution_ingredients"

    sub_ingredient_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    sub_id = db.Column(db.Integer, db.ForeignKey("substitutions.sub_id"), nullable=False)
    ingredient_id = db.Column(db.Integer, db.ForeignKey("ingredients.ingredient_id"), nullable=False)

    def __repr__(self):
        """Represent SubstitutionIngredient objects as sub_ingredient_id, sub_id, ingredient_id."""

        return "<SubstitutionIngredient sub_ingredient_id:{}, sub_id:{}, ingredient_id:{}>".format(
            self.sub_ingredient_id, self.sub_id, self.ingredient_id)

# For future implementation.
# class Course(db.Model):
#     pass

# class RecipeCourse(db.Model):
#     pass


def sample_data():
    """Create sample data for testing."""

    # In case this is run more than once, empty out existing data.
    Recipe.query.delete()
    Ingredient.query.delete()
    RecipeIngredient.query.delete()
    Diet.query.delete()
    RecipeDiet.query.delete()

    # Add sample recipe, ingredient, and diet.
    rsb = Recipe(recipe_id=1,
                 title="strawberry banana smoothie",
                 image="test.jpg",
                 instructions="test instructions")

    db.session.add(rsb)
    db.session.commit()

    ist = Ingredient(ingredient_id=1, name="strawberry")
    ib = Ingredient(ingredient_id=2, name="banana")

    db.session.add_all([ist, ib])
    db.session.commit()

    rist = RecipeIngredient(recipe_ingredient_id=1, recipe_id=1, ingredient_id=1, measurement="2 c")
    rib = RecipeIngredient(recipe_ingredient_id=2, recipe_id=1, ingredient_id=2, measurement="1 c")

    db.session.add_all([rist, rib])

    da = Diet(diet_code="a", name="any")
    dv = Diet(diet_code="v", name="vegetarian")

    db.session.add_all([da, dv])
    db.session.commit()

    rdsba = RecipeDiet(recipe_diet_id=1, recipe_id=1, diet_code="a")
    rdsbv = RecipeDiet(recipe_diet_id=2, recipe_id=1, diet_code="v")

    db.session.add_all([rdsba, rdsbv])
    db.session.commit()



def connect_to_db(app, db_uri="postgresql:///recipes"):
    """Connect database to Flask app."""

    app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":  # Makes sure the server only runs if the script is executed directly from the Python interpreter and not used as an imported module.

    from server import app
    connect_to_db(app)
    db.create_all()
    print "Connected to DB."
