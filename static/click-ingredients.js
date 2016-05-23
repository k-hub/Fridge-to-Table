"use strict";  // Raises errors for JS mistakes.

function alertMe(data) {
    // alert(data);
    console.log(data);
}


function get_ingredient_id(evt) {
    console.log($(this).attr("id"));

// Create an object.
        var ingredientId = {
            "ingredient_id": $(this).attr("id")
        };
    console.log(ingredientId);



// AJAX
$.get("/shopping-lists", ingredientId, alertMe);
}

$(".ingredient").on('click', get_ingredient_id);