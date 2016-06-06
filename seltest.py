"""Test application with Selenium Webdriver."""

import os
import time
from selenium import webdriver
from selenium.webdriver.support.ui import Select

WEBDRIVER_PATH = os.environ["WEBDRIVER_PATH"]

# Instantiate an object.
driver = webdriver.Chrome(WEBDRIVER_PATH)
driver.get("http://localhost:5000")

def search():
    """Enter ingredient into search field and select diet from dropdown menu."""
    
    # # Let the user actually see something!
    time.sleep(1)
    
    search_box = driver.find_element_by_name("ingredient")
    # Enter ingredient into search field.
    search_box.send_keys("chicken")

    # Select a diet name.
    drop_down = Select(driver.find_element_by_name("diet"))
    drop_down.select_by_visible_text("Any")
    drop_down.select_by_value("any")
    time.sleep(1)

    search_box.submit()

def click_recipe():
    """Click a recipe image on /search-results."""

    # recipe is a list.
    recipe = driver.find_elements_by_xpath('//a[img/@src="https://spoonacular.com/recipeImages/Hot-Italian-Chicken-Sandwiches-273991.jpg"]')
    recipe[0].click()

def add_to_favorites():
    """Add a recipe to Favorites."""

    add_recipe = driver.find_element_by_css_selector("input.favorite-recipe")
    add_recipe.click()
    time.sleep(1)

def check_favorites():
    """Go to /favorites."""

    favorites = driver.find_elements_by_xpath('//a[img/@class="favorites"]')
    favorites[0].click()
    time.sleep(1)

def route_to_recipe():
    """Check that a recipe in Favorites routes back to recipe page."""

    return_to_recipe = driver.find_element_by_link_text("Hot Italian Chicken Sandwiches")
    return_to_recipe.click()

def add_to_shopping_list():
    """Add all ingrediets in a recipe to Shopping List."""

    add_ingredients = driver.find_elements_by_css_selector("button")
    for ingredient in add_ingredients:
        ingredient.click()
    time.sleep(1)

def route_to_shopping_list():
    """Go to /shopping-list."""

    shopping_list = driver.find_elements_by_xpath('//a[img/@class="shopping-list"]')
    shopping_list[0].click()

def remove():
    """Remove an ingredient from Shopping List."""

    remove_ingredients = driver.find_elements_by_css_selector("button")
    remove_ingredients.click()




search()
click_recipe()
add_to_favorites()
check_favorites()
route_to_recipe()
add_to_shopping_list()
route_to_shopping_list()
remove()
# driver.quit()
