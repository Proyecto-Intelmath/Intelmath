var consulta = $("#searchTable").DataTable();

$("#InputBusqueda").keyup(function(){
    consulta.search($(this).val()).draw();
    
    $("#navegacion").css({
        "height" : "100vh", 
        "background": "rgba(0,0,0.0.5)" 
    })
    
    if ($("#InputBusqueda").val() == ""){
        
        $("#navegacion").css({
        "height" : "auto", 
        "background": "none" 
    })
        
        $("#search").hide();
        
    }else{
        $("#search").fadeIn("fast");
    }
})
