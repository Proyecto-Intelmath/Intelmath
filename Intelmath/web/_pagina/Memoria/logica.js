var getData = function(){
    var puntos = document.getElementById("moves").value;
    if(moves == "") {
        document.getElementById("moves").focus();
    }
    else{
        if(moves == "") {
        document.getElementById("moves").focus();
        }
    else {
         if(!isNaN(moves)){
       // console.log (moves);
            var user = new Users (moves,"php/insert.php");
            user.addUser();
            document.getElementById("moves").value="";
            document.getElementById("moves").focus();
    }    
       
        
        }
    
    }
}