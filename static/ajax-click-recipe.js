"use strict";

function alertMe(data) {
  alert(data);
  // console.log("Successful AJAX call");
}

// Get a better understanding of "this". Using ".recipe_image" gives the same ID of one image even though clicking on a different image. 
function get_recipe_id(evt) {
    console.log($(this).attr("id"));

// Create an object.
        var formInputs = {
            "recipe_id": $(this).attr("id")
        };
    console.log(formInputs);

// AJAX
    $.get("/recipe", formInputs, alertMe);
}


$(".recipe_image").on('click', get_recipe_id);


