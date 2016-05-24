"use strict";  // Raises errors for JS mistakes.

function changeColor(data) {
    // alert(data);
    console.log(data);
    console.log("sent");
    $(this).css('color', 'blue');
};

// var shopping_list = [];

// function add_to_shopping_list(data) {
//     shopping_list.push(ingredientId);
//     console.log(data);
//     console.log("Look:", shopping_list)
// }



function get_ingredient_id(evt) {
    console.log($(this).attr("id"));

// Create an object.
        var ingredientId = {
            "ingredient_id": $(this).attr("id")
        };

        var ingredientName = {
            "ingredient_name": $(this).attr("name")
        };
    console.log(ingredientId);
    console.log(ingredientName);


    // AJAX
    $.get("/shopping-list", ingredientName);
};
    // $.get("/recipe/<int:recipe_id>", ingredientId, add_to_shopping_list);
    // }


$(".ingredient").on('click', get_ingredient_id);

$(".ingredient").on('click', changeColor);