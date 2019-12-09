<%-- 
    Document   : simon
    Created on : 8/12/2019, 03:36:06 PM
    Author     : agxel
--%>

<%@page import="com.intelmath.negocio.VO.InicioSesionVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    HttpSession miSession = (HttpSession) request.getSession();
    InicioSesionVO usuario = new InicioSesionVO();
    if (miSession.getAttribute("usuario") != null) {
        usuario = (InicioSesionVO) miSession.getAttribute("usuario");
    }


%>
<!DOCTYPE html>
<html>
    <head>
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
        <link href="_pagina/SIMON/CSS/simon.css" rel="stylesheet" />
        <title>Secuencia de colores</title>
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
        <h1>Simon dice</h1>
        <div class=".log"><h1></h1></div>
     


        <div class="Puntaje"></div>
        <div class='correct'>Nivel Completo!</div> 
        <div class='game-over'>Haz perdido!</div>
        <br>
        <br>
        <div id="simoncho">
            <div id="0" class="b0 b"><h2>Verde</h2></div>
            <div id="1" class="b1 b"><h2>Rojo</h2></div>
            <br>
            <div id="2" class="b2 b"><h2>Azul</h2></div>
            <div id="3" class="b3 b"><h2>Amarrillo</h2></div>
        </div>

        <br>
        <br>
        <div class="score"></div>
        <br>
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
                                    
                                    <h2> Puntaje : <div style="display:inline;" id="moves1"></div></h2>
                                    <h5 id="perdio"></h5>
                                    <input type="hidden" name="nombre" value="Simon">
                                    <input type="hidden" name="puntaje" id="puntaje" readonly="readonly" placeholder="Puntaje" >
                                    <input type="hidden" name="usuario" value="<%= usuario.getUsuarioId()%>">
                                    <input type="hidden" name="tipo" value="4">       
                                </div>
                                <div class="modal-footer">
                                    <button type="submit"  class="btn btn-success">Guardar y salir</button>

                                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="restard" data-dismiss="modal">Reiniciar el juego</button>
                                </div>
                            </div>
                        </div>
                    </div>



                </form>

        <script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js'></script>
        <script  src="_pagina/SIMON/JS/simonlogica.js"></script>
    </body>
</html>
