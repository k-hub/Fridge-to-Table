"use strict";
// User clicks add to favorites button
// send button id to server with ajax
// query Recipe for recipe id name
// add recipe id to favorites

$(".favorite-recipe").on("click", function(){
    var recipeId = {
        "recipe_id" : $(this).attr("id")
    };

    console.log(recipeId)

    $.post("/favorites", recipeId, function(){
                console.log("success");
            });
});