<%-- 
    Document   : cambioContrasena
    Created on : 14-oct-2019, 18:49:34
    Author     : John
--%>

<%@page import="com.intelmath.negocio.VO.InicioSesionVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession miSession = (HttpSession) request.getSession();

    InicioSesionVO usuario = (InicioSesionVO) miSession.getAttribute("usuario");
    String rol = usuario.getId_rol();

%>
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
        <title>IntelMath-Perfil</title>
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
                            <a class="btn btn-info" data-target="#sesion">Iniciar Sesión</a>
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
        <form action="Redireccionar">
            <section id="volver">
                 <button name="Perfil"  class="btn btn-info btn-lg">Volver</button>
             </section>
            
        </form> 
        <div id="perfil">
            <h1>Perfil</h1>

            <form action="Perfil" method="post">
                <center>
                    <div id="tabla">
                        <table class="table  table-bordered thead-dark">
                            <thead class="thead-dark" >
                                <tr>
                                    <th scope="col">Ingrese su actual contraseña</th>
                                    <td ><input type="password" name="pass" id="pass" class="form-control" ></td>
                            <input type="hidden" name="pass0" id="pass0" value="<%= usuario.getContrasena()%>">



                            </tr>
                            </thead>
                            <tbody class="thead-dark">
                                <tr>
                                    <th scope="col">Ingrese la nueva contraseña que desea</th>
                                    <td> <input type="password" name="contra" id="contra" class="form-control"></td>


                                </tr>
                                <tr>
                                    <th scope="col">Digítela nuevamente</th>
                                    <td><input type="password" name="contra2" id="contra2" class="form-control" ></td>



                            </tbody>
                        </table>
                    </div>

                    <div class="alert alert-success" role="alert" id="alerta3">

                    </div>
                    <div class="alert alert-danger" role="alert" id="alerta4">


                    </div>


                    <div class="alert alert-success" role="alert" id="alerta1">

                    </div>
                    <div class="alert alert-danger" role="alert" id="alerta2">


                    </div>
                    <input type="hidden" name="opcion" value="2">
                    <input type="submit" name="registrar" value="Guardar cambios" class="btn btn btn-info btn-lg">
                </center>
            </form>

    </body>
    <script>

        $(document).ready(function () {
            //variables

            var pass0 = $('[name=pass0]');
            var pass = $('[name=pass]');
            var pass1 = $('[name=contra]');
            var pass2 = $('[name=contra2]');
            var confirmacion = "Las contraseñas si coinciden";
            var longitud = "La contraseña debe estar formada entre 6-10 carácteres (ambos inclusive)";
            var negacion = "No coinciden las contraseñas";
            var vacio = "La contraseña no puede estar vacía";
            //oculto por defecto el elemento span
            var span = $('<span></span>').insertAfter(pass2);
            span.hide();
            //función que comprueba las dos contraseñas
            function coincidePassword() {
                var valor1 = pass1.val();
                var valor2 = pass2.val();
                //muestro el span
                span.show().removeClass();
                //condiciones dentro de la función
                if (valor1 != valor2) {
                    span.text(negacion).add(document.getElementById("alerta2")).addClass('alert alert-danger');
                }
                if (valor1.length == 0 || valor1 == "") {
                    span.text(vacio).add(document.getElementById("alerta2")).addClass('alert alert-danger');
                }
                if (valor1.length < 6 || valor1.length > 10) {
                    span.text(longitud).add(document.getElementById("alerta2")).addClass('alert alert-danger');
                }
                if (valor1.length != 0 && valor1 == valor2) {
                    span.text(confirmacion).add(document.getElementById("alerta1")).removeClass("alert alert-danger").addClass('alert alert-success');
                }
            }
            function primeraPassword() {
                var valor1 = pass.val();
                var valor2 = pass0.val();
                span.show().removeClass();
                if (valor1 != valor2) {
                    span.text(negacion).add(document.getElementById("alerta4")).addClass('alert alert-danger');
                }
                if (valor1.length == 0 || valor1 == "") {
                    span.text(vacio).add(document.getElementById("alerta4")).addClass('alert alert-danger');
                }
                if (valor1.length < 6 || valor1.length > 10) {
                    span.text(longitud).add(document.getElementById("alerta4")).addClass('alert alert-danger');
                }
                if (valor1.length != 0 && valor1 == valor2) {
                    span.text(confirmacion).removeClass("alert alert-danger").add(document.getElementById("alerta3")).addClass('alert alert-success');
                }

            }
            //ejecuto la función al soltar la tecla
            pass.keyup(function () {
                primeraPassword();
            });
            pass2.keyup(function () {
                coincidePassword();
            });
        });



        $(document).ready(function () {
            $('#pass0').hide(0);
            $("#alerta1").hide(0);
            $("#alerta2").hide(0);
            $("#alerta3").hide(0);
            $("#alerta4").hide(0);
            $('[data-toggle="popover"]').popover();
        });

        $('.dropdown-toggle').dropdown();
    </script>
</html>
