
function log(s) {
  $('.log').append(s + '<br/>');
}
var movimientos;
var inputTimeout;
var duracion;
var moveNum; 
var btntiempo;
var playbackTimerId;
var volver = false;

/*en esta parte esta la secuencia de colores, y luego una vez completa se agrega una nueva secuencia*/
function playNextMove(i, showSelect) { 
  console.log('playNextMove(' + i + ') - movimientos[i] = ' + movimientos[i]);
  if (i >= movimientos.length) {
    volver = false;
    $('.correct').hide();
    getInput(0);
  } else {
    if (showSelect) {
      $('.b' + movimientos[i]).addClass('selected');
      playbackTimerId = setTimeout(function() {
        playNextMove(i, false);
      }, duracion * 3 / 4);
    } else {
      $('.b').removeClass('selected');
      playbackTimerId = setTimeout(function() {
        playNextMove(i + 1, true);
      }, duracion / 4);
    }
  }
}
/*aqui hacemos que atravez de math random la secuencia sea diferente*/
function addMove() {  
  $('.b').removeClass('selected');
  movimientos.push(Math.floor(Math.random() * 4));
  $('.score').text('Puntaje actual: ' + (movimientos.length - 1));
  setTimeout(function() {
    playNextMove(0, true);
  }, duracion);
  if (movimientos.length % 4 == 0) {
    duracion *= 0.7;
  }
}
/*esta funcion acaba el juego y compara los puntajes mas altos para actualizar el marcador*/
function gameOver() { 
  clearTimeout(btntiempo);
  if (!localStorage.simonRecord || movimientos.length - 1 > localStorage.simonRecord) {
    localStorage.simonRecord = movimientos.length - 1;
    $('.Puntaje').text('Nuevo record: ' + (movimientos.length - 1));
  }
  $('.game-over').show();
  movimientos = [];
  volver = true;
}
/*el juego espera que el usuario lo intente de nuevo*/
function getInput() { 
  volver = false;
  moveNum = 0;
  btntiempo = setTimeout(inputTimeout);
}
/*determina si el usuario gano o perdio el juego, si no ejecutara game over*/
function buttonPress() { 
  if (volver) return;
  clearTimeout(btntiempo);
  var num = parseInt(this.id);
  $('.b').removeClass('selected');
  $('.b' + num).addClass('selected');
  if (moveNum < movimientos.length && num == movimientos[moveNum]) {
    moveNum++;
    if (moveNum == movimientos.length) {
      volver = true;
      setTimeout(addMove, 500);
      $('.correct').show();
    } else {
      btntiempo = setTimeout(gameOver, inputTimeout);
    }
  } else
    gameOver();
}
/*reinicia el juego, borrando los mensajes de game over y reiniciando la secuencia de play*/
function restart() { 
  clearTimeout(playbackTimerId);
  clearTimeout(btntiempo);
  moveNum = 0;
  movimientos = [];
  inputTimeout = 2000;
  duracion = 1000;
  $('.b').removeClass('selected');
  $('.game-over').hide();
  $('.Puntaje').text('Record: ' + localStorage.simonRecord);

  volver = true;
  addMove();
}
/*vuelve a los valores predeterminados y se poneel puntaja mas alto*/
$('.start-btn').button(); 
$('.start-btn').click(restart);
$('.b').click(buttonPress);
if (localStorage.simonRecord)
$('.Puntaje').text('Record: ' + localStorage.simonRecord);
restart();
