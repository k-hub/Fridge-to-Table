"use strict";

function alertMe(evt) {
  alert("Test");
}

// Get a better understanding of "this". Using ".recipe_image" gives the same ID of one image even though clicking on a different image. 
function get_recipe_id(evt) {
    console.log($(this).attr("id"));  
}


$(".recipe_image").on('click', get_recipe_id);


// $.post("/search-results", get_recipe_id, alertMe);

