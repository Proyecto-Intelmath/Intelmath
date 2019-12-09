<%-- 
    Document   : RegistrarUsuario
    Created on : 30/08/2019, 06:50:21 PM
    Author     : agxel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <title>intelmath-registrar usuario</title>

    </head>
    <body>
        <div  id="inicio1">

            <form method="post" action="Sesion" >
                <h2>¿No tienes cuenta?<br> Registrate</h2>
                <div id="text">
                   
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="usuario">Usuario</label>
                            <input type="text" name="usuario" placeholder="Usuario"  class="form-control" required="" title="¡Advertencia!"  data-toggle="popover" data-trigger="focus" data-content="El usuario debe ser unico y original">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="contra">Contraseña</label>
                            <input type="password" name="contra" placeholder="Contraseña" class="form-control" required="">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="nombre">Nombre</label>
                            <input type="text" name="nombre" placeholder="Nombre" class="form-control" required="">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="apellido">Apeliido</label>
                            <input type="text" name="apellido" placeholder="Apellido" class="form-control" required="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo electronico</label>
                        <input type="email" name="correo" placeholder="Correo electronico" class="form-control" required="">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="telefono">Telefono</label>
                            <input type="tel" name="telefono" placeholder="Telefono" class="form-control" required="">
                        </div>
                        
                    </div>
                    <div id="nt">
                    <input type="hidden" name="opcion" value="1">
                    <input type="submit" name="registrar" value="Registrar" class="btn btn-lg btn-info">
                    <a href="index.jsp" class="btn btn-lg btn-primary" role="button">Cancelar</a>
                    </div>
                </div>

                <input class="input100" type="hidden" name="de" value="intelmath212131@gmail.com">
                <input class="input100" type="hidden" name="clave" value="sixpack666">
                <input class="input100" type="hidden" name="Asunto" value="Intelmath-Registro de usuario">
                <input class="input100" type="hidden" name="mensaje" value="¡En hora buena!<br> Te has unido a la familia de intelmath.<br>Desde ahora puedes disfrutar de nuestras diferentes opciones que te ofrecemos">



            </form><br>



            <% if (request.getAttribute("mensajeError") != null) { %>
            <div class="alert alert-danger ">
                ${mensajeError}
            </div>
            <% } else if ((request.getAttribute("mensajeExito") != null)) {%>


            <div class="alert alert-success ">
                ${mensajeExitoso}
            </div>

            <% }%>
            
        </div>
    </body>
    <script>
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
    </script>

</html>
