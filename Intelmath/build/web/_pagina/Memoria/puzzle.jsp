<%-- 
    Document   : puzzle
    Created on : 12-nov-2019, 19:00:09
    Author     : John
--%>
<%@page import="com.intelmath.negocio.VO.InicioSesionVO"%>
<%

    HttpSession miSession = (HttpSession) request.getSession();
    InicioSesionVO usuario = new InicioSesionVO();
    if (miSession.getAttribute("usuario") != null) {
        usuario = (InicioSesionVO) miSession.getAttribute("usuario");
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="_css/bootstrap-4.3.1-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="_js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="_css/bootstrap-4.3.1-dist/js/popper.min.js" type="text/javascript"></script>
        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="_css/bootstrap-4.3.1-dist/Estilo.css" rel="stylesheet" type="text/css"/>
        <script src="_js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="logica.js"></script>
        <script type="text/javascript" src="JS/Users.js"></script>

        <title>PUZZLE</title>
        <style>
            canvas {
                width:450px;
                height:450px;
                border: 5px solid black;
                margin:auto
            }
        </style>
    </head>
    <body>
        <form method="post" action="Redireccionar">
            <nav class="navbar navbar-expand-lg navbar-light bg-light" id="nav">
                <a class="navbar-brand" href="index.jsp"><img src="_img/intelmath.png" alt="" width="150px" /></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Biblioteca 
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <%if (usuario.getUsuario() != null) {%>
                                <button class="dropdown-item" name="biblioteca">Menú-Biblioteca</button>

                                <%} else {%>

                                <a class="dropdown-item" href="#" role="button" data-toggle="modal" data-target="#iniciarSesion">Menú-Blioteca</a>



                                <%} %>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="Dinamicas.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dinámicas
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <%if (usuario.getUsuario() != null) {%>
                                <button class="dropdown-item" name="dinamicas"> Menú–Dinámicas </button>

                                <%} else {%>

                                <a class="dropdown-item" href="#" role="button" data-toggle="modal" data-target="#iniciarSesion">Menú–Dinámicas</a>



                                <%} %>

                            </div>
                        </li>
                        <% if (usuario.getUsuario() != null) {%>
                        <% if (usuario.getId_rol().equals("Administrador")) {%>
                        <li class="nav-item">
                            <a class="nav-link" href="Redireccionar?trivia=1" role="button">Trivia</a>
                        </li>
                        <%}%>
                        <%}%>
                    </ul>
                    <ul class="navbar-nav nav justify-content-end">

                        <%
                            if (usuario.getUsuario() == null) {
                        %>

                        <li class="nav-item" >

                            <a class="nav-link" href="Redireccionar?inicio=1">Iniciar Sesión</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="Redireccionar?registro=1">Registrarse</a>
                        </li>
                        <% } else {%>

                        <li>
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%= usuario.getUsuario()%>-<%=usuario.getId_rol()%></a>
                        </li>
                        <li class="nav-item dropdown " >
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Configuración</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                                <button class="dropdown-item btn btn-light" name="Perfil" role="button">Perfil</button>

                                <a class="dropdown-item  btn btn-light" href="#" role="button" data-toggle="modal" data-target="#myModal">Cerrar Sesión</a>
                            </div>
                        </li>
                        <%}%>
                    </ul>

                </div>
            </nav>
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Cerrar sesión</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            ¿Estás seguro que quieres cerrar sesión?
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button  name='Cerrar' class="btn btn-outline-success">Si</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal fade" id="iniciarSesion">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Antes de comenzar</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            Quires disfrutar de nuestros grandes datos o de nuestros divertidos juegos. Entonces Inicia Sesion antes que nada.<br>
                            <a class="btn btn-info" href="Redireccionar?inicio=1">Iniciar Sesión</a>
                            <hr>
                            ¿No tienes cuenta?<br>No te preocupes, puedes registrarte gratituamente<br>

                            <a class="btn btn-info" href="Redireccionar?registro=1">Registrarse</a>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        </div>

                    </div>
                </div>
            </div>
        </form> 
        <div id="top" style="width:100%; margin:auto; margin-top:10px; text-align:center">
            <header style="width:99%; height:100px;">
                <h1 style="font-size:70px;">Puzzle</h1>
            </header>

            <div style="margin-top:10px; height:1000px;">
                <div>
                    <div style="position: relative; width:50%; float:left; display:inline">
                        <div style="text-align:center; height:30px">
                            <h2 id="message"></h2>
                        </div>
                        <h2 id="moves">Vamos a jugar</h2>
                        <div style="text-align:center; height:5px">
                        </div>

                        <div >
                            <canvas id="canvas" height="450px" width="450px" ></canvas>
                        </div>
                    </div>
                    <div style=" padding-top:2px; text-align:center; padding-top:10px">
                        <h1 style="font-size:40px;">Imagen Completa</h1>
                        <div style="margin:auto">
                            <img src="_pagina/Memoria/images/puzz1.jpg" id="puzz1" width="150px" height="150px">
                            <img src="_pagina/Memoria/images/puzz2.jpg" id="puzz2" width="150px" height="150px">
                            <img src="_pagina/Memoria/images/puzz3.jpg" id="puzz3" width="150px" height="150px">
                        </div>
                        <div style="margin:auto">
                            <img src="_pagina/Memoria/images/puzz4.jpg" id="puzz4" width="150px" height="150px">
                            <img src="_pagina/Memoria/images/puzz5.jpg" id="puzz5" width="150px" height="150px">
                            <img src="_pagina/Memoria/images/puzz6.jpg" id="puzz6" width="150px" height="150px">
                        </div>
                        <div style="margin:auto">
                            <img src="_pagina/Memoria/images/puzz7.jpg" id="puzz7" width="150px" height="150px">
                            <img src="_pagina/Memoria/images/puzz8.jpg" id="puzz8" width="150px" height="150px">
                            <img src="_pagina/Memoria/images/puzz9.jpg" id="puzz9" width="150px" height="150px">
                        </div>

                    </div>
                </div>
            </div>

            <script>
                var canvas = document.getElementById("canvas");
                var ctx = canvas.getContext("2d");
                var empty = 9;
                var moves = -1;
                function shuffle(array) {
                    var currentIndex = array.length, temporaryValue, randomIndex;

                    /*aqui se mezclan las fichas*/
                    while (0 !== currentIndex) {

                        /*elije una ficha actual para remplazarla*/
                        randomIndex = Math.floor(Math.random() * currentIndex);
                        currentIndex -= 1;
                        temporaryValue = array[currentIndex];
                        array[currentIndex] = array[randomIndex];
                        array[randomIndex] = temporaryValue;
                    }


                    return array;
                }/*declaramos la matriz*/
                var ar = [1, 2, 3, 4, 5, 6, 7, 8, 0];
                im = shuffle([1, 2, 3, 4, 5, 6, 7, 8, 0]);

                for (var i = 0; i <= 8; i++) {
                    if (im[i] == 0)
                        empty = i + 1;
                }

                var restart = 0;
                function ganar() {
                    ctx.clearRect(300, 300, 150, 150);
                    var img = document.getElementById("puzz9");
                    var pat = ctx.createPattern(img, "repeat");
                    ctx.fillStyle = pat;
                    ctx.fillRect(300, 300, 150, 150);
                    m = document.getElementById("message");
                    m.innerHTML = "Ganaste el juego en " + moves.toString() + " Movimientos";
                    if (moves < 30) {


                        document.querySelector("#perdio").innerHTML = ("¡Felicidades!<br>¡Has desmostrado un rendimiento fenomenal durante el desarrollo de la dinámica!<br>Tu rendimiento ha sido capaz de superar el juego con un puntaje satisfactorio.<br>Te recomendamos que eches un vistazo por las demás actividades que intelmath te llega a ofrecer");
                    } else if (moves >=31 && moves <=100 ) {

                        document.querySelector("#perdio").innerHTML = ("¡MEH!<br>¡A pesar del intento que has hecho no has sido capaz de llegar a el nivel que esperábamos!<br>Tu rendimiento no fue el mejor, esperamos que repitas el nivel y trates de superarte<br>Si deseas intelmath te ofrece mas dinámicas y material de apoyo en la biblioteca échales un vistazo");
                    } else if (moves >= 101 && moves <= 200) {

                        document.querySelector("#perdio").innerHTML = ("¡MEH!<br>¡A pesar del intento que has hecho no has sido capaz de llegar a el nivel que esperábamos!<br>Tu rendimiento no fue el mejor, esperamos que repitas el nivel y trates de superarte<br>Si deseas intelmath te ofrece mas dinámicas y material de apoyo en la biblioteca échales un vistazo");
                    } else if (moves >= 201) {

                        document.querySelector("#perdio").innerHTML = ("¡Has  fracasado!<br>¡Nisiquiera lo has intentado!<br>Tu rendimiento fue desastroso, no superaste ninguna de nuestras expectativas que teníamos en ti te recomendamos que juegues de nuevo y trates de concentrarte mas en lo que estas haciendo<br>Tambien puede visitar las demás dinámicas que te ofrece intelmath anímate y descúbrelas todas");
                    }
                    $("#gameover").modal();
                    restart = 1;
                    moves = -1;
                }

                function draw() {
                    moves++;
                    mov = document.getElementById("moves");
                    mov.innerHTML = "MOVIMIENTOS REALIZADOS:  " + moves.toString();
                    document.getElementById("moves1").innerHTML = moves.toString();
                    $("#puntaje").val(moves);
                    $(".puntaje").val(moves);
                    m = document.getElementById("message");
                    m.innerHTML = "";

                    var t;
                    t = 0;
                    if (restart == 1) {

                        im = shuffle([1, 2, 3, 4, 5, 6, 7, 8, 0]);
                        for (var i = 0; i <= 8; i++) {
                            if (im[i] == 0)
                                empty = i + 1;


                        }

                        console.log(empty);

                        ctx.clearRect(0, 0, 450, 450);
                        restart = 0;
                    }
                    for (var i = 0; i < 9; i++) {
                        if (im[i] != ar[i])
                            t = 1;
                    }
                    console.log(im);
                    console.log(ar);

                    for (var i = 0; i < 3; i++) {
                        for (var j = 0; j < 3; j++) {
                            component(i, j);
                        }
                    }

                    console.log(t);

                    if (t == 0) {
                        console.log("funca");
                        ganar();
                    }

                }

                function component(x, y) {

                    var text = "puzz";
                    z = x + 3 * y;
                    z = im[z];
                    text = text + z.toString();
                    if (z != 0)
                    {
                        var img = document.getElementById(text);
                        var pat = ctx.createPattern(img, "repeat");
                        ctx.fillStyle = pat;
                    } else
                    {
                        ctx.fillStyle = "white";
                    }

                    ctx.fillRect(150 * x, 150 * y, 150, 150);
                }

                function moveup() {
                    ctx.clearRect(0, 0, 450, 450);
                    if (restart == 1)
                    {
                        draw();
                        return;
                    }
                    if (empty == 9 || empty == 7 || empty == 8) {
                        moves--;
                        draw();
                    } else {
                        text = "puzz";
                        var curr = empty;
                        empty = empty + 3;
                        var next = empty;
                        im[curr - 1] = im[next - 1];
                        im[next - 1] = 0;
                        draw();

                    }
                    console.log(empty);
                }

                function movedown() {
                    ctx.clearRect(0, 0, 450, 450);
                    if (restart == 1)
                    {

                        draw();
                        return;
                    }
                    if (empty == 1 || empty == 2 || empty == 3) {
                        moves--;
                        draw();
                    } else {
                        text = "puzz";
                        var curr = empty;
                        empty = empty - 3;
                        var next = empty;
                        im[curr - 1] = im[next - 1];
                        im[next - 1] = 0;
                        draw();

                    }

                    console.log(empty);

                }

                function moveleft() {
                    ctx.clearRect(0, 0, 450, 450);

                    if (restart == 1)
                    {

                        draw();
                        return;
                    }

                    if (empty == 6 || empty == 9 || empty == 3) {
                        moves--;
                        draw();
                    } else {
                        text = "puzz";
                        var curr = empty;
                        empty = empty + 1;
                        var next = empty;
                        im[curr - 1] = im[next - 1];
                        im[next - 1] = 0;
                        draw();


                    }
                    console.log(empty);
                }

                function moveright() {
                    ctx.clearRect(0, 0, 450, 450);
                    if (restart == 1)
                    {
                        moves--;
                        draw();
                        return;
                    }
                    if (empty == 1 || empty == 4 || empty == 7) {
                        moves--;
                        draw();
                    } else {
                        text = "puzz";
                        var curr = empty;
                        empty = empty - 1;
                        var next = empty;
                        im[curr - 1] = im[next - 1];
                        im[next - 1] = 0;
                        draw();
                    }
                    console.log(empty);

                }
                /*asignamiento de teclas*/
                window.addEventListener('keydown', function (e) {
                    key = e.keyCode;
                    if (key == 37) {
                        e.preventDefault();
                        moveleft();
                    }
                    if (key == 38) {
                        e.preventDefault();
                        moveup();
                    }
                    if (key == 39) {
                        e.preventDefault();
                        moveright();
                    }
                    if (key == 40) {
                        e.preventDefault();
                        movedown();
                    }
                    if (key == 13) {
                        e.preventDefault();
                        start();
                    }

                    /*play*/
                });






                function start() {
                    draw();
                }
                ctx.font = "30px Arial";
                ctx.fillText("PRESIONA ENTER", 110, 210);

            </script>

            <center>
                <form action="dinamicas" id="form" method="post">
                    <div class="modal fade" id="gameover" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Game Over</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <h5 id="perdio"></h5>
                                    <h2> Movimientos : <div style="display:inline;" id="moves1"></div></h2>
                                    <input type="hidden" name="nombre" value="Puzzle">
                                    <input type="hidden" name="puntaje" id="puntaje" readonly="readonly" placeholder="Puntaje" >
                                    <input type="hidden" name="usuario" value="<%= usuario.getUsuarioId()%>">
                                    <input type="hidden" name="tipo" value="4">       
                                </div>
                                <div class="modal-footer">
                                    <button type="submit"  class="btn btn-success">Guardar y salir</button>

                                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="return load();" data-dismiss="modal">Reiniciar el juego</button>
                                </div>
                            </div>
                        </div>
                    </div>



                </form>



            </center>
    </body>
</html>
