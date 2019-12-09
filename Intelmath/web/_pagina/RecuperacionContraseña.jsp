<%-- 
    Document   : RecuperacionContraseña
    Created on : 8/12/2019, 12:59:00 PM
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
        <script src="_js/jquery.numeric.js" type="text/javascript"></script>
        <script src="_js/jquery.numeric.min.js" type="text/javascript"></script>
        <title>intelmath-OlvidoContraseña</title>

    </head>
    <body>

        <% if (request.getAttribute("MensajeError") != null) { %>
        <script>
            $(document).ready(function () {
                $('#Error').modal();

            });
        </script>
        <% }%>
        <script>
            $(document).ready(function () {
                $('#codigo').numeric();

            });
        </script>
        <div  id="inicio1">
            <form method="post" action="Sesion">

                <div id="text">
                    <div id="recuperar" >
                        <h2>Codigo de confirmacion</h2>
                        <div class="form-group" >
                            <label for="codigo">Codigo de confirmacion</label>
                            <input type="text" id="codigo" name="codigo" placeholder="------"  class="form-control">
                        </div>

                        <input type="hidden" name="opcion" value="4">
                        <input type="hidden" name="correo" value="${correo}">

                        <input type="submit" name="registrar" value="Confirmar" class="btn  btn-info">
                        <a href="index.jsp" class="btn btn-primary" role="button">Cancelar</a>
                    </div>
                </div>
            </form>
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
    </body>
</html>
