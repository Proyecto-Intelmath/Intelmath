<%-- 
    Document   : index
    Created on : 06-nov-2019, 23:04:10
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
        <title> Javascript : 2048 puzzle</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

        <script type="text/javascript" src="_pagina/2048/logica.js"></script>
        <script type="text/javascript" src="_pagina/2048/JS/Users.js"></script>

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
    <center>
        <h1>2048</h1>
        <div id="canvas"></div>	
        <h2> Puntaje : <div style="display:inline;" id="puntaje"></div></h2>

    </center>
    <script type="text/javascript">

        //CREACION DEL TABLERP
        var size = 4;
        var min = 0;
        var max = size - 1;

        var isMoved = false;
        var puntaje = 0;

        //CREANDO LA CADRICULA
        var excludeIds = [];
        function load() {
            var html = '<table border="5">';
            for (var row = 0; row < size; row++) {
                html += '<tr>';
                for (var col = 0; col < size; col++) {
                    var id = row + "" + col;
                    html += '<td align="center" valign="center" height="40" width="40" id="' + id + '"></td>';
                }
                html += '</tr>';
            }
            //USAMOS EL CAVAS Y DECLARAMOS LAS VARIABLES
            html += '</table>';
            document.getElementById("canvas").innerHTML = html;
            var id1 = getId();
            var id2 = "";
            while (true) {
                id2 = getId();
                if (id1 != id2)
                    break;
            }
            //ESTABLECEMOS DOS VALORES PARA LAS FICHAS
            document.getElementById(id1).innerHTML = "2";
            document.getElementById(id2).innerHTML = "2";
            document.getElementById(id1).style.backgroundColor = getColor(2);
            document.getElementById(id2).style.backgroundColor = getColor(2);

            puntaje = 0;
            document.getElementById("puntaje").innerHTML = puntaje;
            return false;
        }
        //USAMOS EL GETTANDOM PARA TRAER UN NUMERO ALEATORIO
        function getRandom()
        {
            return Math.floor(Math.random() * (max - min + 1) + min);
        }
        function getId()
        {
            var i = getRandom();
            var j = getRandom();
            return i + "" + j;
        }
        //USAMOS DOS MATRICES UNA ES AUXILIAR ESTA NOS DARA UNA FICHA Y SE ENCARGARA DE HACER LA OPERACION DE JUNTAR LAS FICHAS
        function up() {
            isMoved = false;
            excludeIds = [];
            for (var j = min; j <= max; j++) {
                for (var i = min; i <= max; i++) {
                    var id = i + "" + j;
                    if (document.getElementById(id).innerHTML != "") {
                        moveUp(id);
                    }
                }
            }
            if (isMoved == true) {
                update();
            }
            return false;
        }
        //ESTA LA OPERACION PARA JUNTAR LAS FICHAS Y QUE DE UN NUEVO VALOR
        function moveUp(id) {
            if (!id.startsWith(min)) {
                var arr = id.split("");
                var i = parseInt(arr[0]);
                var j = parseInt(arr[1]);
                for (var k = (i - 1); k >= min; k--) {
                    var nId = k + "" + j;
                    if (document.getElementById(nId).innerHTML != "") {
                        var val = parseInt(document.getElementById((k + 1) + "" + j).innerHTML);
                        var nVal = parseInt(document.getElementById(nId).innerHTML);
                        if (val == nVal) {
                            if (excludeIds.indexOf(nId) == -1) {
                                excludeIds.push(nId);
                                document.getElementById(nId).innerHTML = (val + nVal);
                                document.getElementById(nId).style.backgroundColor = getColor((val + nVal));
                                document.getElementById((k + 1) + "" + j).innerHTML = "";
                                document.getElementById((k + 1) + "" + j).style.backgroundColor = "#ffffff";
                                isMoved = true;
                                puntaje += (val + nVal);
                            }
                            break;
                        }
                    }
                    //SI EL MOVIMIENTO NO ESTA PERMITIDO NO HARA LA OPERACION
                    else {
                        document.getElementById(nId).innerHTML = document.getElementById((k + 1) + "" + j).innerHTML;
                        document.getElementById(nId).style.backgroundColor = document.getElementById((k + 1) + "" + j).style.backgroundColor;
                        document.getElementById((k + 1) + "" + j).innerHTML = "";
                        document.getElementById((k + 1) + "" + j).style.backgroundColor = "#ffffff";
                        isMoved = true;
                    }
                }
            }
            return false;
        }
        function left() {
            isMoved = false;
            excludeIds = [];
            for (var i = min; i <= max; i++) {
                for (var j = min; j <= max; j++) {
                    var id = i + "" + j;
                    if (document.getElementById(id).innerHTML != "") {
                        moveLeft(id);
                    }
                }
            }
            if (isMoved == true) {
                update();
            }
            return false;
        }
        function moveLeft(id) {
            if (!id.endsWith(min)) {
                var arr = id.split("");
                var i = parseInt(arr[0]);
                var j = parseInt(arr[1]);
                for (var k = (j - 1); k >= min; k--) {
                    var nId = i + "" + k;
                    if (document.getElementById(nId).innerHTML != "") {
                        var val = parseInt(document.getElementById(i + "" + (k + 1)).innerHTML);
                        var nVal = parseInt(document.getElementById(nId).innerHTML);
                        if (val == nVal) {
                            if (excludeIds.indexOf(nId) == -1) {
                                excludeIds.push(nId);
                                document.getElementById(nId).innerHTML = (val + nVal);
                                document.getElementById(nId).style.backgroundColor = getColor((val + nVal));
                                document.getElementById(i + "" + (k + 1)).innerHTML = "";
                                document.getElementById(i + "" + (k + 1)).style.backgroundColor = "#ffffff";
                                isMoved = true;
                                puntaje += (val + nVal);
                            }
                            break;
                        }
                    } else {
                        document.getElementById(nId).innerHTML = document.getElementById(i + "" + (k + 1)).innerHTML;
                        document.getElementById(nId).style.backgroundColor = document.getElementById(i + "" + (k + 1)).style.backgroundColor;
                        document.getElementById(i + "" + (k + 1)).innerHTML = "";
                        document.getElementById(i + "" + (k + 1)).style.backgroundColor = "#ffffff";
                        isMoved = true;
                    }
                }
            }
            return false;
        }
        function down() {
            isMoved = false;
            excludeIds = [];
            for (var i = min; i <= max; i++) {
                for (var j = max; j >= min; j--) {
                    var id = j + "" + i;
                    if (document.getElementById(id).innerHTML != "") {
                        moveDown(id);
                    }
                }
            }
            if (isMoved == true) {
                update();
            }
            return false;
        }
        function moveDown(id) {
            if (!id.startsWith(max)) {
                var arr = id.split("");
                var i = parseInt(arr[0]);
                var j = parseInt(arr[1]);
                for (var k = (i + 1); k <= max; k++) {
                    var nId = k + "" + j;
                    if (document.getElementById(nId).innerHTML != "") {
                        var val = parseInt(document.getElementById((k - 1) + "" + j).innerHTML);
                        var nVal = parseInt(document.getElementById(nId).innerHTML);
                        if (val == nVal) {
                            if (excludeIds.indexOf(nId) == -1) {
                                excludeIds.push(nId);
                                document.getElementById(nId).innerHTML = (val + nVal);
                                document.getElementById(nId).style.backgroundColor = getColor((val + nVal));
                                document.getElementById((k - 1) + "" + j).innerHTML = "";
                                document.getElementById((k - 1) + "" + j).style.backgroundColor = "#ffffff";
                                isMoved = true;
                                puntaje += (val + nVal);
                            }
                            break;
                        }
                    } else {
                        document.getElementById(nId).innerHTML = document.getElementById((k - 1) + "" + j).innerHTML;
                        document.getElementById(nId).style.backgroundColor = document.getElementById((k - 1) + "" + j).style.backgroundColor;
                        document.getElementById((k - 1) + "" + j).innerHTML = "";
                        document.getElementById((k - 1) + "" + j).style.backgroundColor = "#ffffff";
                        isMoved = true;
                    }
                }
            }
            return false;
        }
        function right() {
            isMoved = false;
            excludeIds = [];
            for (var i = min; i <= max; i++) {
                for (var j = max; j >= min; j--) {
                    var id = i + "" + j;
                    if (document.getElementById(id).innerHTML != "") {
                        moveRight(id);
                    }
                }
            }
            if (isMoved == true) {
                update();
            }
            return false;
        }
        //ESTA LA OPERACION PARA JUNTAR LAS FICHAS Y QUE DE UN NUEVO VALOR
        function moveRight(id) {
            if (!id.endsWith(max)) {
                var arr = id.split("");
                var i = parseInt(arr[0]);
                var j = parseInt(arr[1]);
                for (var k = (j + 1); k <= max; k++) {
                    var nId = i + "" + k;
                    if (document.getElementById(nId).innerHTML != "") {
                        var val = parseInt(document.getElementById(i + "" + (k - 1)).innerHTML);
                        var nVal = parseInt(document.getElementById(nId).innerHTML);
                        if (val == nVal) {
                            if (excludeIds.indexOf(nId) == -1) {
                                excludeIds.push(nId);
                                document.getElementById(nId).innerHTML = (val + nVal);
                                document.getElementById(nId).style.backgroundColor = getColor((val + nVal));
                                document.getElementById(i + "" + (k - 1)).innerHTML = "";
                                document.getElementById(i + "" + (k - 1)).style.backgroundColor = "#ffffff";
                                isMoved = true;
                                puntaje += (val + nVal);
                            }
                            break;
                        }
                    } else {
                        document.getElementById(nId).innerHTML = document.getElementById(i + "" + (k - 1)).innerHTML;
                        document.getElementById(nId).style.backgroundColor = document.getElementById(i + "" + (k - 1)).style.backgroundColor;
                        document.getElementById(i + "" + (k - 1)).innerHTML = "";
                        document.getElementById(i + "" + (k - 1)).style.backgroundColor = "#ffffff";
                        isMoved = true;
                    }
                }
            }
            return false;
        }
        function update() {
            //SE AÑADE UNA NUEVA FICHA
            var ids = [];
            for (var i = min; i <= max; i++) {
                for (var j = min; j <= max; j++) {
                    var id = i + "" + j;
                    if (document.getElementById(id).innerHTML == "") {
                        ids.push(id);
                    }
                }
            }
            var id = ids[Math.floor(Math.random() * ids.length)];
            document.getElementById(id).innerHTML = "2";
            document.getElementById(id).style.backgroundColor = getColor(2);

            //AQUI SE HACE UNA VALIDACION PARA SABER SI HAY UN ESPACIO DISPONIBLE
            var allFilled = true;
            for (var i = min; i <= max; i++) {
                for (var j = min; j <= max; j++) {
                    var id = i + "" + j;
                    if (document.getElementById(id).innerHTML == "") {
                        allFilled = false;
                        break;
                    }
                }
            }
            //CADA VEZ QUE SE JUNTE UNA FICHA SE ACTUALIZA EL SCORE
            document.getElementById("puntaje").innerHTML = puntaje;
            document.getElementsByName("puntaje")[0].value = puntaje;
            document.getElementById("puntaje1").innerHTML = puntaje;

            if (allFilled) {
                checkGameOver();
            }
        }
        function checkGameOver() {
            var isOver = true;
            for (var j = min; j <= max; j++) {
                for (var i = min; i <= (max - 1); i++) {
                    var val = parseInt(document.getElementById(i + "" + j).innerHTML);
                    var nVal = parseInt(document.getElementById((i + 1) + "" + j).innerHTML);
                    if (val == nVal) {
                        isOver = false;
                        break;
                    }
                }
            }
            if (isOver == true) {
                for (var i = min; i <= max; i++) {
                    for (var j = min; j <= (max - 1); j++) {
                        var val = parseInt(document.getElementById(i + "" + j).innerHTML);
                        var nVal = parseInt(document.getElementById(i + "" + (j + 1)).innerHTML);
                        if (val == nVal) {

                            isOver = false;
                            break;
                        }
                    }
                }
            }
            if (isOver && puntaje > 1501) {

                $("#gameover").modal();
                document.getElementById("perdio").innerHTML = "¡Felicidades!<br>¡Has desmostrado un rendimiento fenomenal durante el desarrollo de la dinámica!<br>Tu rendimiento ha sido capaz de superar el juego con un puntaje satisfactorio.<br>Te recomendamos que eches un vistazo por las demás actividades que intelmath te llega a ofrecer";
            } else if (isOver && puntaje > 1001 && puntaje < 1500) {
                $("#gameover").modal();
                document.getElementById("perdio").innerHTML = "¡MEH!<br>¡A pesar del intento que has hecgo no has sido capaz de llegar a el nivel que esperábamos!<br>Tu rendimiento no fue el mejor, esperamos que repitas el nivel y trates de superarte<br>Si deseas intelmath te ofrece mas dinámicas y material de apoyo en la biblioteca échales un vistazo";
            } else if (isOver && puntaje > 501 && puntaje < 1000) {
                $("#gameover").modal();
                document.getElementById("perdio").innerHTML = "¡MEH!<br>¡A pesar del intento que has hecgo no has sido capaz de llegar a el nivel que esperábamos!<br>Tu rendimiento no fue el mejor, esperamos que repitas el nivel y trates de superarte<br>Si deseas intelmath te ofrece mas dinámicas y material de apoyo en la biblioteca échales un vistazo";
            } else if (isOver && puntaje > 100 && puntaje < 500) {
                $("#gameover").modal();
                document.getElementById("perdio").innerHTML = "¡Has  fracasado!<br>¡Nisiquiera lo has intentado!<br>Tu rendimiento fue desastroso, no superaste ninguna de nuestras expectativas que teníamos en ti te recomendamos que juegues de nuevo y trates de concentrarte mas en lo que estas haciendo<br>Tambien puede visitar las demás dinámicas que te ofrece intelmath anímate y descúbrelas todas";
            }

        }
        //ASIGNAREMOS LOS COLORES PARA LAS FICHAS O LOS NUMEROS DEL JUEGO
        function getColor(val)
        {
            var color = "#ffffff";
            switch (val) {
                case 2:
                    color = "#EB3F49";
                    break;
                case 4:
                    color = "#F6A612";
                    break;
                case 8:
                    color = "#F2008B";
                    break;
                case 16:
                    color = "#38FF3C";
                    break;
                case 32:
                    color = "#29FFA0";
                    break;
                case 64:
                    color = "#58D3F7";
                    break;
                case 128:
                    color = "#FA58F4";
                    break;
                case 256:
                    color = "#A901DB";
                    break;
                case 512:
                    color = "#01DF3A";
                    break;
                case 1024:
                    color = "#D7DF01";
                    break;
                case 2048:
                    color = "#D7DF01";
                    break;
                default:
                    color = "#ffffff";
            }
            return color;
        }
        if (typeof String.prototype.startsWith != 'function') {
            String.prototype.startsWith = function (str) {
                return this.substring(0, str.length) === str;
            }
        }
        ;
        if (typeof String.prototype.endsWith != 'function') {
            String.prototype.endsWith = function (str) {
                return this.substring(this.length - str.length, this.length) === str;
            }
        }
        ;
        //BLOQUEAMOS LA BARRA DE NAVEGACION DEL NAVEGADOR PARA EVITAR DESPLAZAMIENTOS
        document.onkeydown = function (e) {
            e.preventDefault();
            switch (e.keyCode) {
                case 37:
                    left();
                    break;
                case 38:
                    up();
                    break;
                case 39:
                    right();
                    break;
                case 40:
                    down();
                    break;
            }
        };
        //LLAMAMOS AL METODO DE load 
        load();

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
                            <h4 id="perdio"></h4>
                            <h2> Puntaje : <div style="display:inline;" id="puntaje1"></div></h2>
                            <input type="hidden" name="nombre" value="2048">
                            <input type="hidden" name="puntaje" id="puntaje" readonly="readonly" placeholder="Puntaje">
                            <input type="hidden" name="usuario" value="<%= usuario.getUsuarioId()%>">
                            <input type="hidden" name="tipo" value="3">       
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
