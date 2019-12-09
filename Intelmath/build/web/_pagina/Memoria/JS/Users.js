function Users(moves,action){
    this.action = action;
    this.moves = moves;
}
Users.prototype.addUser = function(){
    console.log(this.moves);
    $.ajax({
        type: "POST",
        url: this.action,
        data: {moves: this.moves},
        success: function (response){
        if(response == 1){
            alert ("funco");
        }
    }   
});
}
