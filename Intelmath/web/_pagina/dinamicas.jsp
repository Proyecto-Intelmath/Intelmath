<%-- 
    Document   : dinamicas
    Created on : 24/10/2019, 11:04:51 AM
    Author     : APRENDIZ
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.intelmath.util.conexion.ConexionBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.intelmath.negocio.DAO.DinamicaDAO"%>
<%@page import="com.intelmath.negocio.VO.DinamicasVO"%>
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
        <title>Intelmath-Dinamicas</title>
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
    <center><h1>Dinámicas</h1></center><br><br>
    <div class="row">
      
        <div id="verpuntaje" style="margin-bottom: 50px;">
            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h2 class="mb-0">
                            <center>
                                <button class="btn btn-lg btn-info" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    Ver puntaje
                                </button>
                            </center>

                        </h2>
                    </div>

                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-bordered thead-dark">
                                <thead>
                                    <tr class="thead-dark">
                                        <th>Nombre del juego</th>
                                        <th>Tipo de juego</th>
                                        <th>Puntaje</th>
                                        <th>Calificacion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        DinamicasVO diVO = new DinamicasVO();
                                        DinamicaDAO diDAO = new DinamicaDAO(diVO);
                                        ConexionBD con = new ConexionBD();
                                        Statement st = con.conexion.createStatement();
                                        ResultSet rs = st.executeQuery("select d.nombre , puntaje,t.nombre  from tbl_dinamicas d, tbl_usuario u, tbl_tipo t where d.id_usuario=u.id_usuario and d.id_tipo=t.id_tipo and d.id_usuario='" + usuario.getUsuarioId() + "';");

                                        while (rs.next()) {%>
                                    <tr>
                                        <th><%= rs.getString("d.nombre")%> </th> 
                                        <th><%= rs.getString("t.nombre")%></th>
                                        <th><%= rs.getInt("puntaje")%></th>
                                        <%if(rs.getString("d.nombre").equals("2048")){%>
                                        <th>
                                            <% if (rs.getInt("puntaje") <= 500) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">25%</div>
                                            </div>
                                            <%
                                                }else if (rs.getInt("puntaje") >=501 && rs.getInt("puntaje") <=1000) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 50%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">50%</div>
                                            </div>
                                            <%} else if (rs.getInt("puntaje") >=1001 && rs.getInt("puntaje") <=1500) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">75%</div>
                                            </div>
                                            <%}else if (rs.getInt("puntaje") >1500) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 1000%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
                                            </div>
                                            <%}%>
                                        </th>
                                        <%}else if(rs.getString("d.nombre").equals("Puzzle")){%>
                                        <th>
                                            <% if (rs.getInt("puntaje") >=201 ) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">25%</div>
                                            </div>
                                            <%
                                                }else if (rs.getInt("puntaje") >=101 && rs.getInt("puntaje") <=200) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 50%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">50%</div>
                                            </div>
                                            <%} else if (rs.getInt("puntaje") >=31 && rs.getInt("puntaje") <=100) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">75%</div>
                                            </div>
                                            <%}else if (rs.getInt("puntaje") <30) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 1000%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
                                            </div>
                                            <%}%>
                                        </th>
                                        <%} else if(rs.getString("d.nombre").equals("Simon")){%>
                                        <th>
                                            <% if (rs.getInt("puntaje") <=5 ) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-danger" role="progressbar" style="width: 25%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">25%</div>
                                            </div>
                                            <%
                                                }else if (rs.getInt("puntaje") >=6 && rs.getInt("puntaje") <=10) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 50%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">50%</div>
                                            </div>
                                            <%} else if (rs.getInt("puntaje") >=15 && rs.getInt("puntaje") <=20) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">75%</div>
                                            </div>
                                            <%}else if (rs.getInt("puntaje") >25) {
                                            %>
                                            <div class="progress">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 1000%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
                                            </div>
                                            <%}%>
                                        </th>
                                        <%} %>
                                        
                                    </tr>

                                    <% }

                                    %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>


    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <div class="bd-example">
                <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                     

                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="_img/3.jpg" class="d-block w-100" alt="..."  height="500px">
                            <div class="carousel-caption d-none d-md-block">
                               
                                <a href="Redireccionar?2048=1" class="btn btn-info">Ir a jugar</a>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="_img/2.jpg" class="d-block w-100" alt="..." height="500px">
                            
                            <div class="carousel-caption d-none d-md-block">
                                
                                <a href="Redireccionar?puzzle=1" class="btn btn-info">Ir a jugar</a>
                                
                            </div>
                        </div>
                        
                        <div class="carousel-item">
                            <img src="_img/1.jpg" class="d-block w-100" alt="..." height="500px">
                            
                            <div class="carousel-caption d-none d-md-block">
                                
                                <a href="Redireccionar?simon=1" class="btn btn-info">Ir a jugar</a>
                                
                            </div>
                        </div>

                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-sm-4"></div>
    </div>


</body>
</html>
