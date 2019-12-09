<%-- 
    Document   : Menu
    Created on : 27/08/2019, 02:28:10 PM
    Author     : agxel
--%>

<%@page import="com.intelmath.negocio.DAO.TriviaDAO"%>
<%@page import="com.intelmath.negocio.VO.TriviaVO"%>
<%@page import="com.intelmath.negocio.VO.InicioSesionVO"%>

<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>

<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    HttpSession miSession = (HttpSession) request.getSession();
    InicioSesionVO usuario = new InicioSesionVO();
    if (miSession.getAttribute("usuario") != null) {
        usuario = (InicioSesionVO) miSession.getAttribute("usuario");
    }

%>


<%@include file="WEB-INF/Sesiones/sesion.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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



        <title> intelmath-Menú </title>
    </head>
    <body>
        <script type="text/javascript">
            <% if (request.getAttribute("mensajeError") != null) { %>
            $(document).ready(function () {
                $('#Error').modal();
                $('#sesion').modal();
            });
            <% } else {%>
            $(document).ready(function () {
                $("#triviaModal").modal();
            });
            <% }%>
        </script>
        <div class="modal fade bd-example-modal-xl" id="triviaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">


                        <img src="_img/intelmath-eslogan.png" alt=""/>




                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <% TriviaVO triVO = new TriviaVO();
                            TriviaDAO triDAO = new TriviaDAO();

                            ArrayList<TriviaVO> trivia = triDAO.listar();
                            for (int i = 0; i < trivia.size(); i++) {
                                triVO = trivia.get(i);%>
                        <h1><%=triVO.getContenido()%></h1>
                        <% }%>

                    </div>

                </div>
            </div>
        </div>




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

                            <a class="nav-link" href="#" data-toggle="modal" data-target="#sesion">Iniciar Sesión</a>
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
                            <button  name='Cerrar' class="btn btn-info">Si</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        </div>

                    </div>
                </div>
            </div>

        </form> 
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
                        Quieres disfrutar de nuestros grandes datos o de nuestros divertidos juegos. Entonces Inicia Sesión, antes que nada.<br>
                        <button class="btn btn-info" type="button" data-toggle="modal" data-target="#sesion">Iniciar sesión</button>

                        <hr>
                        ¿No tienes cuenta?<br>No te preocupes, puedes registrarte gratuitamente<br>

                        <a class="btn btn-info" href="Redireccionar?registro=1">Registrarse</a>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                    </div>

                </div>
            </div>
        </div>
        <div class="modal fade " id="sesion" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog modal-dialog-centered " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class=" ml-auto col-sm-9">
                            &nbsp;&nbsp;<img src="_img/Logo-InicioSesion.png" alt=""/><br>
                        </div>
                    </div>
                    <div class="modal-body">
                        <form form method="post" action="Sesion">
                            <div class="row">
                                <div class=" ml-auto col-sm-9 "><h2>Inicio de sesión</h2></div>
                            </div>

                            <div class="row">
                                <div class="col-sm-2 ml-auto"></div>
                                <div class="col-sm-8 ml-auto">
                                    <input type="text" name="usuario" placeholder="Usuario" class="form-control" > 
                                </div>
                                <div class="col-sm-2 ml-auto"></div>
                            </div><br>
                            <div class="row">
                                <div class="col-sm-2 ml-auto"></div>
                                <div class="col-sm-8 ml-auto">
                                    <input type="password" name="contra" placeholder="Contraseña" class="form-control">
                                </div>
                                <div class="col-sm-2 ml-auto"></div>
                            </div><br>
                            <div class="row">
                                <div id="btnsesion">
                                    <button class="btn btn-info btn-lg">Ingresar</button>
                                    <button rol="button" class="btn btn-lg btn-danger"  data-dismiss="modal">Cancelar</button>
                                </div>
                            </div><br>
                            <input type="hidden" name="opcion" value="2" class="form-control">
                            <div class="row">
                                <a href="Redireccionar?recuperar=1">¿Olvidaste tu contraseña?</a>   
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="Error" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class=" ml-auto col-sm-9">
                            <img src="_img/x.png" width="230px">
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class=" ml-auto col-sm-9">
                            <h4><strong>¡Ha ocurrido un error!</strong></h4>
                            &nbsp;&nbsp;&nbsp;Usuario o contraseña incorrectos
                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class=" ml-auto col-sm-7 ">
                            <a href="" class="btn btn-danger" role="button" data-dismiss="modal">Cerrar</a><br><br>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div id="biblioDina">
            <div class="jumbotron">
                <form action="Redireccionar">
                    <section id="bliblio2">
                        <h1>Biblioteca</h1>
                        <hr class="my-4">
                        <h3>¿Tienes problemas con tu compresión lógico matemático?<br>
                            Nosotros te podemos ayudar.<br> 
                            Visita nuestra Biblioteca, la cual contiene diferentes libros con información valiosa referente a todo lo relacionado con lógica-matemática 
                        </h3>
                        <div>
                            <hr class="my-4">
                            <div class="row">

                                <%if (usuario.getUsuario() != null) {%>
                                <button name="biblioteca" class="btn btn-lg btn-info">Ir a biblioteca</button>
                                <%} else {%>
                                <button type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#iniciarSesion">Ir a biblioteca</button>
                                <%}%>

                            </div>
                        </div>
                    </section>
                    <section id="Dinamica">
                        <h1>Dinámica</h1>


                        <hr class="my-4">
                        <h3>¿Quieres divertirte mientras aprendes?<br>
                            Nuestras dinámicas son perfectas para la ocasión.<br> 
                            Visita nuestra sección de dinámicas, ellas contienen diversas actividades con la cual te puedes divertir bastante
                            <br><br>
                        </h3>
                        <div >
                            <hr class="my-4">
                            <div class="row">

                                <%if (usuario.getUsuario() != null) {%>
                                <button name="dinamicas" class="btn btn-lg btn-info">Ir a dinamicas</button>
                                <%} else {%>
                                <button type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#iniciarSesion">Ir a dinámicas</button>
                                <%}%>

                            </div>


                        </div>
                    </section>
                </form>

            </div>
        </div>
        <div id="biblio">
            <div class="jumbotron">
                <form action="Redireccionar">


                    <h1>Biblioteca</h1>


                    <hr class="my-4">
                    <h3>¿Tienes problemas con tu compresión lógico matemático?<br>
                        Nosotros te podemos ayudar.<br> 
                        Visita nuestra Biblioteca, la cual contiene diferentes libros con información valiosa referente a todo lo relacionado con lógica-matemática 
                    </h3>
                    <div >
                        <hr class="my-4">
                        <div class="row">

                            <%if (usuario.getUsuario() != null) {%>
                            <button name="biblioteca" class="btn btn-lg btn-info">Ir a biblioteca</button>
                            <%} else {%>
                            <button type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#iniciarSesion">Ir a biblioteca</button>
                            <%}%>

                        </div>


                    </div>
                </form>

            </div>
        </div>

        <div id="biblio">
            <div class="jumbotron">
                <form action="Redireccionar">


                    <h1>Dinamica</h1>


                    <hr class="my-4">
                    <h3>¿Quieres divertirte mientras aprendes?<br>
                        Nuestras dinámicas son perfectas para la ocasión.<br> 
                        Visita nuestra sección de dinámicas, ellas contienen diversas actividades con la cual te puedes divertir bastante
                    </h3>
                    <div >
                        <hr class="my-4">
                        <div class="row">

                            <%if (usuario.getUsuario() != null) {%>
                            <button name="dinamicas" class="btn btn-lg btn-info">Ir a dinámicas</button>
                            <%} else {%>
                            <button type="button" class="btn btn-lg btn-info" data-toggle="modal" data-target="#iniciarSesion">Ir a dinámicas</button>
                            <%}%>

                        </div>


                    </div>
                </form>


            </div>
        </div>





    </body>

</html>

