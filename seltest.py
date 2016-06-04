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
time.sleep(3) # Let the user actually see something!


# recipe = driver.find_element_by_css_selector("recipe_image")
# recipe = driver.find_element_by_id("273991")
recipe = driver.find_element_by_link_text("/recipe/273991")
# recipe = driver.find_elements_by_xpath("//a[contains(")
# recipe = driver.find_element_by_tag_name("img")
print "DEBUG:", recipe.text
recipe.click()
time.sleep(1)

driver.quit()
