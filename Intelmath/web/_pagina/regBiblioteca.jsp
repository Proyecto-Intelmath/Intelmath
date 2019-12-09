<%-- 
    Document   : regBiblioteca
    Created on : 14/08/2019, 09:10:44 AM
    Author     : USER
--%>


<%@page import="com.intelmath.util.conexion.ConexionBD"%>
<%@page import="com.intelmath.negocio.VO.InicioSesionVO"%>
<%@page import="com.sun.javafx.fxml.builder.URLBuilder"%>

<%@page import="java.sql.Statement"%>

<%@page import="java.sql.*"%>
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
        <title>Registrar Biblioteca</title>
        <script src="JS/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="_js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="_css/bootstrap-4.3.1-dist/js/popper.min.js" type="text/javascript"></script>
        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>

        <link href="_css/bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="_css/bootstrap-4.3.1-dist/Estilo.css" rel="stylesheet" type="text/css"/>
        <script src="_js/bootstrap.min.js" type="text/javascript"></script>
        <script src="_js/buscador.js"></script>

    </head>
    <body class="bk">
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
                        </li>iv>
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
                <button name="biblioteca"  class="btn btn-info btn-lg">Volver</button>
            </section>


        </form>
        <div id="perfil">
            <h1>Registrar Biblioteca</h1>

            <center>
                <div id="tabla">
                    <form method="post" action="bibliotecaCont">
                        <table class="table  table-bordered thead-dark">
                            <thead class="thead-dark" >
                                <tr>
                                    <th scope="col"><label class="col-sm-2 col-form-label col-form-label-lg" >Título: </label></th>
                                    <td><input type="text" name="txtTitulo" class="form-control" required placeholder="Ingrese el titulo del libro"> </td>

                                </tr>
                            </thead>
                            <tbody class="thead-dark">
                                <tr>
                                    <th scope="col"><label class="col-sm-2 col-form-label col-form-label-lg">Descripción: </label></th>
                                    <td>  <input type="text" name="txtDescripcion" class="form-control" required placeholder="Ingrese la descripción del libro"></td>

                                </tr>
                                <tr>
                                    <th scope="col"> <label class="col-sm-2 col-form-label col-form-label-lg">Tipo: </label></th>
                                    <td> <select name="txtTipo" required class="form-control" placeholder="Ingrese el tipo del libro"><%
                                        ConexionBD con = new ConexionBD();
                                        con.ObtenerConexion();
                                        String sql = "select * from tbl_tipo";
                                        Statement st = con.conexion.createStatement();
                                        ResultSet rs = st.executeQuery(sql);

                                        try {
                                            while (rs.next()) {
                                            %>    
                                            <option value="<%=rs.getString("id_tipo")%>">
                                                <%=rs.getString("nombre")%>
                                            </option>
                                            <%
                                                    }

                                                } catch (Exception e) {
                                                    out.print("Error enviando los datos" + e.toString());
                                                }
                                            %>
                                        </select></td>
                                </tr>


                            </tbody>
                        </table>
                        <input type="hidden" name="txtUsuario" value="<%=usuario.getUsuarioId()%>"> 
                        <a class="btn btn-lg btn-light" target="_blank" href="https://drive.google.com/drive/folders/1Qjt0mpgqDEodCb0L1LPQHvWTBrJfD1PS?usp=sharing" role="button">Ingresar Libro</a>
                        <button class="btn btn-info btn-lg">Registrar</button>
                        <input type="hidden" name="opcion" value="1">

                        <div style="color: red ">
                            <% if (request.getAttribute("mensajeError") != null) { %>
                            ${mensajeError}
                            <% } else {%>
                        </div>
                        <div style="color:darkgreen">
                            ${mensajeExitoso}
                            <% }%>

                        </div>
                    </form>
                </div>
            </center>
        </div>

    </body>
</html>
