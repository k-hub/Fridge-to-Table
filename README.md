Fridge-to-Table
=======

Fridge-to-Table is a web app, that finds recipes based on user input ingredients. Recipes can also be filtered by user indicated diet restriction.

###Table of Contents
  - [Technologies Used](https://github.com/k-hub/Fridge-to-Table#technologiesused)
  - [How to Use Application](https://github.com/k-hub/Fridge-to-Table#howtouseapplication)
  - [Installation](https://github.com/k-hub/Fridge-to-Table#installation)
  - [Future Feature Implementations](https://github.com/k-hub/Fridge-to-Table#futurefeatureimplementations)

### Techonologies Used
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
#### Search for Recipes
Enter an ingredient or multiple ingredients into the search field. Select a diet from the dropdown menu to filter results. When the form is submitted, the ingredient name(s) and diet information are used as arguments for a function that performs a single query in the database powered by PostgreSQL. The database was seeded with recipes from Spoonacular.

![](https://cloud.githubusercontent.com/assets/18278342/15878454/e9c92da4-2ccf-11e6-92e0-43909d0ed5d4.png)

![](https://cloud.githubusercontent.com/assets/18278342/15878459/f5fcd13e-2ccf-11e6-851c-852ad0a44b64.png)
#### Add Ingredients and Remove Ingredients from Shopping List
A user can add ingredients to a dynamically tracked shopping list without leaving the recipe page with jQuery and AJAX. 

![](https://cloud.githubusercontent.com/assets/18278342/15878491/32df3650-2cd0-11e6-8d70-119ad7efec69.png)

A user can also remove ingredients from the shopping list endpoint. With an AJAX callback function, the endpoint automatically reloads the page when an ingredient has been deleted from the shopping list.

![](https://cloud.githubusercontent.com/assets/18278342/15878574/d2edde76-2cd0-11e6-9b83-dadbca157659.png)

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

### Future Feature Implementations
Fridge-to-Table is the developer's first independent programming project. The developer had only a limited amount of time to complete this project. Future feature implementations include a food allergy filter, recommender system, ranked recipes, text shopping list, etc.
