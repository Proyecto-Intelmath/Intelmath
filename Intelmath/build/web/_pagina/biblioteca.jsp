<%-- 
    Document   : biblioteca
    Created on : 16-oct-2019, 15:29:55
    Author     : John
--%>

<%@page import="com.intelmath.negocio.DAO.bibliotecaDAO"%>
<%@page import="com.intelmath.negocio.VO.bibliotecaVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.intelmath.util.conexion.ConexionBD"%>
<%@page import="com.intelmath.negocio.VO.InicioSesionVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    HttpSession miSession = (HttpSession) request.getSession();
    InicioSesionVO usuario = new InicioSesionVO();
    if (miSession.getAttribute("usuario") != null) {
        usuario = (InicioSesionVO) miSession.getAttribute("usuario");
    }


%>
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
        <script src="_js/buscador.js"></script>
        <title>Intelmath-Biblioteca</title>
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
        <div id="biblioteca">
            <center>
                <h1>  Biblioteca</h1>
            </center>
        </div>


        <%            bibliotecaVO bibVO = new bibliotecaVO();
            bibliotecaDAO bibDAO = new bibliotecaDAO(bibVO);
            ConexionBD con = new ConexionBD();
            con.ObtenerConexion();
            Statement st = con.conexion.createStatement();
            ResultSet rs = st.executeQuery("select b.id_biblioteca, b.titulo, b.descripcion, t.nombre "
                    + "from tbl_biblioteca as b, tbl_tipo as t where t.id_tipo=b.tipo");
        %>
        <form class="buscar" method="post" action="Redireccionar">
            <div class="form-row align-items-center">
                <div class="col-auto">

                    <input type="search" name="txtBusca" class="form-control" id="search">
                </div>


                <div class="col-auto">
                    <button type="submit" name="biblioteca" class="btn btn-info mb-2" style="margin-top: 10px;">Buscar</button>
                </div>
            </div>
        </form>

        <%
            String nombuscar = request.getParameter("txtBusca");
            if (nombuscar != null) {
                st = con.conexion.createStatement();
                rs = st.executeQuery("select b.id_biblioteca, b.titulo, b.descripcion, t.nombre "
                        + "from tbl_biblioteca as b, tbl_tipo as t where t.id_tipo=b.tipo and titulo LIKE" + "'%" + nombuscar + "%'");
            } else if (nombuscar == null) {
                System.out.println("No hay datos");
            }
        %>



        <div  id="tabla">

            <h2>Resultados</h2>




            <table  class="table  table-bordered thead-dark">
                <thead>
                    <tr class="thead-dark">
                        <th>#</th>
                        <th>Título</th>
                        <th>Descripción</th>
                        <th>Género</th>
                        <th>PDF</th>
                            <% if (usuario.getId_rol().equals("Administrador")) {%>
                        <th>Acción</th>
                            <%}%>
                    </tr>
                </thead>

                <% while (rs.next()) {
                %>
                <tbody class="thead-dark">
                    <tr>
                        <td><%=rs.getInt("id_biblioteca")%></td>
                        <td><%=rs.getString("titulo")%></td>
                        <td><%=rs.getString("descripcion")%></td>
                        <td><%=rs.getString("t.nombre")%></td>
                        <td>
                            <a href="https://drive.google.com/drive/folders/1Qjt0mpgqDEodCb0L1LPQHvWTBrJfD1PS?usp=sharing" target="_blank"><img src="_img/icons8-pdf-50.png" width="30" ></a></td>
                                <% if (usuario.getId_rol().equals("Administrador")) {%>
                        <td><a href="Redireccionar?id=<%=rs.getInt("id_biblioteca")%>" title="Actualizar"> <img src="_img/icons8-actualizar-512_1.png" width="30" >&nbsp;&nbsp;&nbsp; </a>
                            <a href="Redireccionar?titulo=<%=rs.getString("titulo")%>" title="Eliminar"> <img src="_img/icons8-eliminar-100.png" width="30" > </a>    
                        </td>
                        <%}%>
                    </tr>



                </tbody>

                <%}%>

            </table>


        </div>
        <div id="mushor" >
            <% if (usuario.getId_rol().equals("Administrador")) {%>
            <label for="ingresar">Ingrese un libro!!!</label>
            <a href="Redireccionar?libro=1"><img id="ingresar" src="_img/icons8-registrarse-en-el-calendario-100.png" width="50" ></a>
            <%}%>
        </div>

        <br>


    </body>
</html>
