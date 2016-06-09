"use strict";


// On click, remove the recipe from the view and then send recipe id of removed item to the server.
$(".remove-item").on("click", function(){
    var recipeId = {
        "recipe_id": $(this).attr("id")
    };

    $.post("/remove-from-favorites", recipeId, function() {
         window.location.reload()});

    $(this).closest("a").remove();

});