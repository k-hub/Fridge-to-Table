import os
import time
from selenium import webdriver
from selenium.webdriver.support.ui import Select

webdriver_path = os.environ["WEBDRIVER_PATH"]

# Instantiate an object.
driver = webdriver.Chrome(webdriver_path)
driver.get("http://localhost:5000")

# Let the user actually see something!
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

# recipe is a list.
recipe = driver.find_elements_by_xpath('//a[img/@src="https://spoonacular.com/recipeImages/Hot-Italian-Chicken-Sandwiches-273991.jpg"]')
recipe[0].click()

# Add a recipe to Favorites.
add_recipe = driver.find_element_by_css_selector("input.favorite-recipe")
add_recipe.click()
time.sleep(1)

# Go to /favorites route. 
favorites = driver.find_elements_by_xpath('//a[img/@class="saved-recipes"]')
favorites[0].click()
time.sleep(1)

# Click a recipe found in Favorites.
return_to_recipe = driver.find_element_by_link_text("Hot Italian Chicken Sandwiches")
return_to_recipe.click()

# driver.quit()
