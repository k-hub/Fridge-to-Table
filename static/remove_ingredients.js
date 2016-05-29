"use strict";

// On click, remove the ingredient from the view and then send ingredient id of removed item to the server.
$(".ingredient").on("click", ".remove-item", function(){
    var ingredientId = {
    "ingredient_id": $(this).attr("id")
    };
    
    $.post("/remove-from-shopping-list", ingredientId);

    $(this).closest("span").remove()
});