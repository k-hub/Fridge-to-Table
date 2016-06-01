"use strict";

// On click, remove the ingredient from the view and then send ingredient id of removed item to the server.
$(".ingredient").on("click", ".remove-item", function(){
    var ingredientId = {
    "ingredient_id": $(this).attr("id")
    };
    
    // The purpose of the AJAX callback function is to refresh the page if
    // the only ingredient in the list has been deleted. The page will reload
    // to indicate that there are "no ingredients found in the shopping list."
    $.post("/remove-from-shopping-list", ingredientId, function() {
         window.location.reload()});

    $(this).closest("span").remove()
});