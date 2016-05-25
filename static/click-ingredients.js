"use strict";  // Raises errors for JS mistakes.


function get_ingredient_id(evt) {
    console.log($(this).attr("id"));

// Create an object.
        var ingredientId = {
            "ingredient_id": $(this).attr("id")
        };

        var ingredientName = {
            "ingredient_name": $(this).attr("name")
        };

        var changeColor = $(this).toggleClass("blue");  // Change color of ingredient to blue and change color back to default color if user clicks again.

        console.log(changeColor)

        $.get("/add-to-shopping-list", ingredientName);  //AJAX

        console.log(ingredientId);  // For debugging
        console.log(ingredientName);  // For debugging

    };



$("span").on("click", get_ingredient_id);




// function changeColor(data) {
//     // alert(data);
//     console.log(data);
//     console.log("sent");
//     $(this).css('color', 'blue');
// };

// function get_ingredient_id(evt) {
//     console.log($(this).attr("id"));

// // Create an object.
//         var ingredientId = {
//             "ingredient_id": $(this).attr("id")
//         };

//         var ingredientName = {
//             "ingredient_name": $(this).attr("name")
//         };
//     console.log(ingredientId);
//     console.log(ingredientName);


//     // AJAX
//     $.get("/shopping-list", ingredientName);
// };
//     // $.get("/recipe/<int:recipe_id>", ingredientId, add_to_shopping_list);
//     // }


// $(".ingredient").on('click', get_ingredient_id);

// $(".ingredient").on('click', changeColor);
