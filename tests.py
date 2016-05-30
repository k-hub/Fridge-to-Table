from server import app
import server
import unittest
from model import connect_to_db, db, Diet, Ingredient, Recipe, RecipeIngredient

# import doctest

# class AppIntegrationTestCase(unittest.TestCase):
#     """"""

#     def setUp(self):
#         # print "(debug setUp)"
#         self.client = app.test_client()
#         app.config["TESTING"] = True
#         app.config["DEBUG"] = False

#     # def tearDown(self):
#     #     print "(debug tearDown)"

#     def test_homepage(self):
#         result = self.client.get("/")
#         self.assertIn("Enter ingredient(s):", result.data)



class FlaskTestsRoutes(unittest.TestCase):
    """Flask tests for routes."""

    def setUp(self):
        """Do setUp before every test."""
        # Get Flask test client.
        self.client = app.test_client()

        # Show Flask errors that occur during tests.
        app.config["TESTING"] = True

        # Connect to the test database that already contains data.
        connect_to_db(app, "postgresql:///test")

    def test_index(self):
        """Test that index is rendering homepagedb.html."""

        result = self.client.get("/")
        self.assertIn("Enter ingredient(s):", result.data)
        self.assertEqual(result.status_code, 200)


    def test_search_results(self):
        """Test that search results page is rendering search_resultsdb.html."""

        result = self.client.get("/search-results?ingredient=lamb&diet=any")
        self.assertIn("Results", result.data)



# class FlaskTestsDatabase(unittest.TestCase):
#     """Flask tests that use the database."""

#     def setUp(self):
#         """Do setUp before every test."""

#         # Get Flask test client.
#         self.client = app.test_client()
#         app.config["TESTING"] = True
#         # app.config["APP_SECRET_KEY"] = "key"

#         # Connect to the test database that already contains data.
#         connect_to_db(app, "postgresql:///test")

#     def tearDown(self):
#         """Do tearDown at the end of every test."""

#         db.session.close()

    # def test_search_results(self):
    #     """Test search results page."""

    #     result = self.client.get("/search-results",
    #                              data={"ingredient": "chicken", "diet": "any"})
    #     self.assertIn("Reults", result.data)

    # # def test_recipe(self):
    # #     """Test recipe page."""

























if __name__ == "__main__":

    unittest.main()