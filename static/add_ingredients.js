"use strict";

function get_ingredient_id(evt) {

        // Create an object.
        var ingredientId = {
            "ingredient_id": $(this).attr("id")
        };

        // Change color of button when clicked.
        var changeColor = $(this).css('color', 'blue');
        console.log(changeColor)

        // Send ingredient id that was clicked to server with AJAX.
        $.post("/shopping-list", ingredientId);

        console.log(ingredientId);  // For debugging

    };

$("button").on("click", get_ingredient_id);