"use strict";

function get_ingredient_id(evt) {
    console.log($(this).attr("id"));

// Create an object.
        var ingredientId = {
            "ingredient_id": $(this).attr("id")
        };

        var ingredientName = {
            "ingredient_name": $(this).attr("name")
        };

        // var changeColor = $(this).toggleClass("blue");  // Change color of ingredient to blue and change color back to default color if user clicks again.
        var changeColor = $(this).css('color', 'blue');
        console.log(changeColor)

        // $.post("/shopping-list", ingredientName);  //AJAX  // add success function to display added ingredients/updated shopping list

        $.post("/shopping-list", ingredientId);

        console.log(ingredientId);  // For debugging
        console.log(ingredientName);  // For debugging

    };

$("span").on("click", get_ingredient_id);
