from server import app
import server
import unittest
from model import connect_to_db, db, Diet, Ingredient, Recipe, RecipeIngredient, sample_data

# import doctest


class FlaskTestsRoutes(unittest.TestCase):
    """Flask tests for routes."""

    def setUp(self):
        """Do setUp before every test."""

        # Get Flask test client.
        self.client = app.test_client()

        # Show Flask errors that occur during tests.
        app.config["TESTING"] = True


    def test_index(self):
        """Test that index is rendering homepagedb.html."""

        result = self.client.get("/")
        self.assertIn("Enter ingredient(s):", result.data)
        self.assertEqual(result.status_code, 200)


    #### Need to fix the test below. 
    def test_shopping_list(self):
        """Test that shopping list is rendering shopping_list.html."""

        # def _mock_ingredient_ids():
        #     return "[1, 2]"

        def _mock_get_ingredient_info(ingredient_ids):
            return "[1, 2]"

        # server.ingredient_id = _mock_ingredient_ids
        server.get_ingredient_info = _mock_get_ingredient_info
        result = self.client.get("/shopping-list")
        self.assertIn("Ingredients to buy:", result.data)


class FlaskTestsDatabase(unittest.TestCase):
    """Flask tests that use the database."""

    def setUp(self):
        """Do setUp before every test."""

        # Get Flask test client.
        self.client = app.test_client()
        app.config["TESTING"] = True
        # app.config["APP_SECRET_KEY"] = "key"

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

        result = self.client.get("/search-results?ingredient=strawberry&diet=any")
        self.assertIn("Results", result.data)










if __name__ == "__main__":

    unittest.main()