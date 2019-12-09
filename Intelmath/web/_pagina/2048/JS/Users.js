function Users(puntaje,action){
    this.action = action;
    this.puntaje = puntaje;
}
Users.prototype.addUser = function(){
    console.log(this.puntaje);
    $.ajax({
        type: "POST",
        url: this.action,
        data: {puntaje: this.puntaje},
        success: function (response){
        if(response == 1){
            alert ("funco");
        }
    }   
    });
}
