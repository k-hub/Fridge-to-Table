from jinja2 import StrictUndefined

from flask import Flask, render_template, request, redirect, session
from flask_debugtoolbar import DebugToolbarExtension


app = Flask(__name__)

app.secret_key = "FOOD123"  # Required to use Flask sessions and the debug toolbar.

app.jinja_env.undefined = StrictUndefined  # Raises an error if error made in Jinja2.

@app.route("/")
def index():
    """Return Homepage."""

    return render_template("homepage.html")


@app.route("/search_results")  # Route needs to be revised.
def results():
    """Return search results for user's input ingredients."""

    pass


@app.route("/recipe")  # Route needs to be revised.
def view_recipe():
    """Return recipe that user clicks on from /search_results."""

    pass


@app.route("/shopping_lists")  # Route needs to be revised.
def show_shopping_lists():
    """Show user's shopping lists."""

    pass

@app.route("/bookmarks")  # Route needs to be revised.
def show_bookmarks():
    """Show user's bookmarked recipes."""

    pass

@app.route("/profile")  # Route needs to be revised.
def show_profile():
    """Show user's profile that displays user's info, shopping lists, and bookmarks."""

    pass








if __name__ == "__main__":
    app.run(debug = True)

    # connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    # app.run()
