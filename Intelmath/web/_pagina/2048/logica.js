var getData = function(){
    var puntos = document.getElementById("puntaje").value;
    if(puntaje == "") {
        document.getElementById("puntaje").focus();
    }
    else{
        if(puntaje == "") {
        document.getElementById("puntaje").focus();
        }
    else {
         if(!isNaN(puntaje)){
       // console.log (puntaje);
            var user = new Users (puntaje,"php/insert.php");
            user.addUser();
            document.getElementById("puntaje").value="";
            document.getElementById("puntaje").focus();
    }    
       
        
        }
    
    }
}