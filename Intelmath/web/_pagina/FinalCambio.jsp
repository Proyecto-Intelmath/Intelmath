<%-- 
    Document   : FinalCambio
    Created on : 8/12/2019, 01:25:39 PM
    Author     : agxel
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
        <title>Intelmath-OlvidoContraseña</title>
    </head>
    <body>
        <div  id="inicio1">

            <form method="post" action="Perfil">

                <div id="text">
                    <div id="recuperar">
                        <h2>Cambio de contraseña</h2>
                        <div class="form-group">

                            <label for="codigo">Ingrese la nueva contraseña</label>
                            <input type="password" name="contra"  id="contra" placeholder="contraseña nueva"  class="form-control" >

                        </div>
                        <div class="form-group">

                            <label for="ccontra2">Digitela nuevamente</label>
                            <input type="password" name="contra2" id="contra2" placeholder="contraseña nueva"  class="form-control" >

                        </div>

                        <input type="hidden" name="opcion" value="5">
                        <input type="submit" name="registrar" value="Confirmar" class="btn  btn-info">
                        <a href="index.jsp<% miSession.invalidate();%>" class="btn btn-primary" role="button">Cancelar</a>
                    </div>

                </div>
            </form>
        </div>


    </body>
    <script>

        $(document).ready(function () {
            //variables


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

            //ejecuto la función al soltar la tecla

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
</body>
</html>
