from server import app
import unittest
# import doctest

class AppIntegrationTestCase(unittest.TestCase):
    """"""

    def setUp(self):
        # print "(debug setUp)"
        self.client = app.test_client()
        app.config['TESTING'] = True

    # def tearDown(self):
    #     print "(debug tearDown)"

    def test_homepage(self):
        result = self.client.get("/")
        self.assertIn("Enter ingredient(s):", result.data)

    # def test_search_results(self):
    #     result = self.client.get("/search-results")
    #     self.assertIn("Results", results.data)



































if __name__ == "__main__":

    unittest.main()