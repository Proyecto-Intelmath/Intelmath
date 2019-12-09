<%-- 
    Document   : olidarContraseña
    Created on : 8/12/2019, 12:18:24 PM
    Author     : agxel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>intelmath-OlvidoContraseña</title>

    </head>
    <body>
        <% if (request.getAttribute("MensajeError") != null) { %>
        <script>
            $(document).ready(function () {
                $('#Error').modal();

            });
        </script>
        <% } %>
        <div  id="inicio1">

            <form method="post" action="Sesion" >
                <div id="text">
                    <div id="recuperar">
                        <h2>Recuperar Contraseña</h2>
                        <p>Para recuperar su contraseña, digite el correo con el cual se registro</p>
                        <div class="form-group" >
                            <label for="correo">Correo electronico</label>
                            <input type="email" name="correo" placeholder="Correo electronico" class="form-control" required="">
                        </div>

                        <input type="hidden" name="opcion" value="3">
                        <input type="submit" name="registrar" value="Confirmar" class="btn btn-info">
                        <a href="index.jsp" class="btn btn-primary" role="button">Cancelar</a>
                    </div>
                </div>
        </div>
        <%
            int codigo = (int) Math.floor(Math.random() * (1111 - 9999) + 9999);
        %>
        <input class="input100" type="hidden" name="de" value="intelmath212131@gmail.com">
        <input class="input100" type="hidden" name="clave" value="sixpack666">
        <input class="input100" type="hidden" name="Asunto" value="Codigo de recuperacion">
        <input class="input100" type="hidden" name="mensaje" value="Tu codigo de recuperacion es: <%=  codigo%>">
        <input type="hidden" name="codigo" value="<%=codigo%>">
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
                            &nbsp;&nbsp;&nbsp;${MensajeError}
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


    </form>
</body>
</html>
