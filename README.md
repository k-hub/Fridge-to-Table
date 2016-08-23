#Fridge-to-Table
-----

Fridge-to-Table is a web app, that finds recipes based on user input ingredients. Recipes can also be filtered by user indicated diet restriction. Other features include adding ingredients to a shopping list and ability to favorite recipes. 

###Table of Contents
-----
  - [Technologies Used](https://github.com/k-hub/Fridge-to-Table#technologies-used)
  - [How to Use Application](https://github.com/k-hub/Fridge-to-Table#how-to-use-application)
  - [Installation](https://github.com/k-hub/Fridge-to-Table#installation)
  - [Testing and Coverage](https://github.com/k-hub/Fridge-to-Table#testing-and-coverage)
  - [Future Feature Implementations](https://github.com/k-hub/Fridge-to-Table#future-feature-implementations)

### Techonologies Used
-----
- Python
- PostgreSQL
- SQLAlchemy
- Flask
- Jinja2
- JavaScript
- jQuery
- AJAX
- Bootstrap
- HTML
- CSS
- Spoonacular API

### How to Use Application
-----
#### Search for Recipes
Enter an ingredient or multiple ingredients into the search field. Select a diet from the dropdown menu to filter results. When the form is submitted, the ingredient name(s) and diet information are used as arguments for a function that performs a single query in the database powered by PostgreSQL. The database was seeded with recipes from Spoonacular.

![](https://cloud.githubusercontent.com/assets/18278342/17884719/a5935c8c-68ce-11e6-8897-4f7d226210f5.png)

![](https://cloud.githubusercontent.com/assets/18278342/17884737/bbaa0ff2-68ce-11e6-83b3-b795895077fa.png)

=====
#### Add Ingredients and Remove Ingredients from Shopping List
A user can add ingredients to a dynamically tracked shopping list without leaving the recipe page with jQuery and AJAX. 

![](https://cloud.githubusercontent.com/assets/18278342/17884824/24f71554-68cf-11e6-9f43-3c588b5fe8ea.png)

=====
A user can also remove ingredients from the shopping list endpoint. With an AJAX callback function, the endpoint automatically reloads the page when an ingredient has been deleted from the shopping list.

![](https://cloud.githubusercontent.com/assets/18278342/17884980/f2797eb8-68cf-11e6-9dee-c49d8c3ae889.png)

=====
### Installation
Clone or fork this repo:
```
https://github.com/k-hub/Fridge-to-Table
```
Create and activate a virtural environment inside your project directory:
```
virtualenv env
source env/bin/activate
```
Install the requirements:
```
pip install -r requirements.txt
```
Get a secret key to use [Spoonacular's API](https://spoonacular.com/food-api). Save it to a secrets.sh file. Your file will look something like this:
```
export X_MASHABLE_KEY="your_secret_key_here"
```
Create the database with PostgreSQL. In your terminal, type:
```
createdb recipes
```
Set up the database:
```
python -i model.py
```
Seed database:
```
spoonacular.py
```
Run the app:
```
python server.py
```
=====
### Testing and Coverage
Unit testing, integration testing, and end-to-end testing have been implemented.
Enter the following into the command line to run tests:
```
coverage run --source=. --omit="env/*,send_sms.py,spoonacular.py" tests.py
```
Enter the following to get coverage report:
```
coverage report -m
```
To perform end-to-end testing with Selenium Webdriver for Chrome, follow the [setup instructions](https://sites.google.com/a/chromium.org/chromedriver/getting-started).
Then execute the following command:
```
python seltest.py
```


=====
### Future Feature Implementations
Fridge-to-Table is the developer's first independent programming project. Future feature implementations include a food allergy filter, recommender system, ranked recipes, text shopping list, etc.
