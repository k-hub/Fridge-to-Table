"use strict";

function get_ingredient_id(evt) {

        // Create an object.
        var ingredientId = {
            "ingredient_id": $(this).attr("id")
        };

        // Change color of button when clicked.
        var changeColor = $(this).css('color', 'blue');

        // Send ingredient id that was clicked to server with AJAX.
        $.post("/shopping-list", ingredientId);
    };

$(".add-ingredient").on("click", get_ingredient_id);
