from server import app
import server
import unittest
from model import connect_to_db, db, Diet, Ingredient, Recipe, RecipeIngredient, sample_data
# from flask_sqlalchemy import SQLAlchemy
import sqlalchemy
# import doctest


class FlaskTestsRoutes(unittest.TestCase):
    """Test that Flask Routes are rendering correct template."""

    def setUp(self):
        """Do setUp before every test."""

        # Show Flask errors that occur during tests.
        app.config["TESTING"] = True

        # Create a secret key to use Flask Session.
        app.config["SECRET_KEY"] = "key"

        # Get Flask test client.
        self.client = app.test_client()

        # Accessing Flask session.
        with self.client as c:
            with c.session_transaction() as sess:
                sess["shopping_list"] = [1]
                sess["favorites"] = [1]


    def test_index(self):
        """Test that index is rendering homepagedb.html."""

        result = self.client.get("/")
        self.assertIn("Enter ingredient(s):", result.data)
        self.assertEqual(result.status_code, 200)


    def test_search_results(self):
        """Test that search results is rendering search_resultsdb.html."""

        # Mock helper function called in /search-results.
        def _mock_query_recipes(diet, ingredients):
            # Instantiate a Recipe object.
            return [Recipe(recipe_id=1, title="test", image=u'https://spoonacular.com/recipeImages/tofu_caribbean_salad_with_watercress-13864.jpg')]

        server.query_recipes = _mock_query_recipes
        result = self.client.get("/search-results?ingredient=strawberry+banana&diet=any")
        self.assertIn("Results", result.data)

    # {% for measurement, ingredient_id, ingredient in measurements_ingredients %}  <!-- measurements_ingredients is a list of measurement, ingredient_id, ingredient tuples -->
    # ValueError: too many values to unpack
    # def test_recipe(self):
    #     """Test that recipe is rednering recipe.html."""

    #     def _mock_display_recipe(recipe_id):
    #         return [Recipe(recipe_id=1, title="test", image=u'https://spoonacular.com/recipeImages/tofu_caribbean_salad_with_watercress-13864.jpg'), u'http://www.wholefoodsmarket.com/recipes/650', (u'7.0 oz', 296, u'tofu')]

    #     server.display_recipe = _mock_display_recipe
    #     result = self.client.get("/recipe/13864")
    #     self.assertIn("/static/add_recipes.js", result.data)


    def test_shopping_list(self):
        """Test that shopping list is rendering shopping_list.html."""

        # Mock helper function called in /shopping_list.
        def _mock_get_ingredient_info(ingredient_ids):
            return [(136, u'buns')]

        server.get_ingredient_info = _mock_get_ingredient_info
        result = self.client.get("/shopping-list")
        self.assertIn("Ingredients to buy:", result.data)


    def test_favorites(self):
        """Test that favorites is rendering favorites.html."""

        # Mock helper function called in /favoriets.
        def _mock_get_recipe_info(recipe_ids):
            return [(172277, u'Chicken Pasta Salad with Grapes and Poppy Seed Dressing')]

        server.get_recipe_info = _mock_get_recipe_info
        result = self.client.get("/favorites")
        self.assertIn("Favorites:", result.data)


class FlaskTestsDatabase(unittest.TestCase):
    """Flask tests that use the database."""

    def setUp(self):
        """Do setUp before every test."""

        app.config["TESTING"] = True
        # Create a secret key to use Flask Session.
        app.config["SECRET_KEY"] = "key"

        # Get Flask test client.
        self.client = app.test_client()

        # Accessing Flask session.
        with self.client as c:
            with c.session_transaction() as sess:
                sess["shopping_list"] = [1]
                sess["favorites"] = [1]

        # Connect to the test database.
        connect_to_db(app, "postgresql:///test")

        # Create tables and add sample data.
        db.create_all()
        sample_data()


    def tearDown(self):
        """Do tearDown at the end of every test."""

        db.session.close()
        db.drop_all()


    def test_search_results(self):
        """Test database query for search results page."""

        result = self.client.get("/search-results?ingredient=strawberry&diet=any")
        self.assertIn("strawberry", result.data)


    def test_recipe(self):
        """Test database query for recipe page."""

        result = self.client.get("/recipe/1")
        self.assertIn("strawberry", result.data)


    def test_shopping_list(self):
        """Test database query for shopping list page."""

        result = self.client.get("/shopping-list")
        self.assertIn("strawberry", result.data)


    def test_favorites(self):
        """Test database query for favorites page."""

        result = self.client.get("/favorites")
        self.assertIn("strawberry banana smoothie", result.data)




if __name__ == "__main__":

    unittest.main()