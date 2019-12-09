<%-- 
    Document   : CambiarRol
    Created on : 13-oct-2019, 19:31:04
    Author     : John
--%>

<%@page import="com.intelmath.negocio.DAO.InicioSesionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.intelmath.negocio.VO.InicioSesionVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession miSession = (HttpSession) request.getSession();

    InicioSesionVO usuario = (InicioSesionVO) miSession.getAttribute("usuario");


%>
<!DOCTYPE html>
<html>
    <head>
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
        <title>Intelmath-CambiarRol</title>
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
        <div class="modal fade" id="correcto" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <img src="_img/chulo.png" alt=""/>
                    </div>
                    <div class="modal-body">
                        ${mensajeExito}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info" data-dismiss="modal">Aceptar</button>
                        
                    </div>
                </div>
            </div>
        </div>
        <h1>Cambiar Rol</h1>


        <form action="Redireccionar">
            <section id="volver">
                <button name="Perfil"  class="btn btn-info btn-lg">Volver</button>
            </section>

        </form> 

        <div class="row">
            <div class="col-sm-8"></div>
            <div  class="col-sm-4">
                <form class="form-inline" action="Perfil" method="POST" >
                    <input class="form-control mr-sm-2" type="search" id="usuario" name="usuario" placeholder="Usuario" aria-label="Search">
                    <button class="btn btn-info my-2 my-sm-0" type="submit">Cambiar Rol</button>
                    <input type="hidden" name="opcion" value="3">
                </form>
            </div> 
        </div>
        <% if (request.getAttribute("mensajeExito") != null) { %>
        <script>
            $("#correcto").modal();
        </script>
        <% }%>
        <% if (request.getAttribute("mensajeError") != null) { %>
        <div class="alert alert-danger ">
            ${mensajeError}
        </div>
        <% }%>
        <div class="row">
            <div class="col-sm-7 ml-auto">
                <h2>Aprendices</h2>
            </div>
        </div>

        <div class="row" id="tabla">
            <div class="col-md-12">
                <table  class="table  table-bordered thead-dark">
                    <thead>
                        <tr class="thead-dark">
                            <th>Usuario</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Correo electrónico</th>
                            <th>Teléfono</th>
                            <th>Rol</th>
                        </tr>
                    </thead>
                    <tbody class="thead-dark">
                        <%
                            InicioSesionVO isVO = new InicioSesionVO();
                            InicioSesionDAO isDAO = new InicioSesionDAO();
                            ArrayList<InicioSesionVO> listar = isDAO.listar();
                            for (int i = 0; i < listar.size(); i++) {
                                isVO = listar.get(i);%>
                        <tr>
                            <td><%= isVO.getUsuario()%></td>
                            <td><%= isVO.getNombre()%></td>
                            <td><%= isVO.getApellido()%></td>
                            <td><%= isVO.getCorreo()%></td>
                            <td><%= isVO.getTelefono()%></td>
                            <td><%= isVO.getId_rol()%></td>
                        </tr>  
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
