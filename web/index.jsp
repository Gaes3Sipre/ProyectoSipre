<%-- 
    Document   : index
    Created on : 3/12/2016, 04:28:02 PM
    Author     : alejozepol
--%>

<%@page import="edu.sipre.modoles.generales.GnUsuario"%>
<%@page import="java.util.List"%>
<%@page import="edu.sipre.modoles.generales.dao.UsuarioDAO_SQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Sistema para al Administracion de Recusos Empresariales - SIPRE">
        <title>Autenticacion - SIPRE</title>
        <link rel="shortcut icon" href="favico.png" type="image/x-icon">

        <!-- Bootstrap Core CSS - Include with every page -->
        <link href="css/estilos.css" rel="stylesheet" id="theme-switcher">		
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Bemat Admin CSS - Include with every page -->
        <link href="css/Loguin.css" rel="stylesheet" id="theme-switcher">
        <!-- Core Scripts - Include with every page -->
        <script src="js/jquery-1.12.2.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.custom.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!---<script>
            function validacion() {
                var nomUsu = document.getElementById("inputNomUsu").value;
                var clave = document.getElementById("inputPassword").value;
                if (nomUsu !== "" || clave !== "") {
                    $('#noValido').modal('show');
                    return false;
                };
            };
        </script>-->
    </head>
    <body>
         <table>
    <tbody>
        <%
            UsuarioDAO_SQL uDao = new UsuarioDAO_SQL();
            List<GnUsuario> usuarios = uDao.buscarTodos();
            for (int i = 0; i < usuarios.size(); i++) {
        %>
        <tr>
            <td><%= usuarios.get(i).getCodUsuario()%></td>
            <td><%= usuarios.get(i).getCodTercero()%></td>
            <td><%= usuarios.get(i).getClave()%></td>
        </tr>
         <%
                            }
                        %>
    </tbody>
     </table>
    
        <div class="row">
            <div class="col-md-12" style="margin: 10px;" >
                <div  id="authentication-box" class="col-md-4 col-sm-12">
                    <div  class="panel">
                        <div class="panel-body no-padding">
                            <div class="authentication-header">
                                <div class="logo-box logo-box-primary-light padding-top-4">
                                    <div class="logo">
                                        <img src="favico.jpg" style="width: 100px; height: 100px"/>
                                    </div>
                                </div>
                                <span>Inicio de Sección</span>
                            </div>
                            <div class="authentication-body">
                                <form class="form" role="form" action="index.html" onsubmit="return  validacion()">
                                    <div class="form-group floating-label">
                                        <br>
                                        <input type="text" class="form-control" id="inputNomUsu" name="inputNomUsu" required/>
                                        <label for="inputNomUsu">Usuario</label>
                                        <p id="m1" style="color: red"></p>

                                    </div>
                                    <div class="form-group floating-label">
                                        <br>
                                        <input type="password" class="form-control" id="inputPassword" name="inputPassword"  required/>
                                        <label for="inputPassword">Contraseña</label>
                                        <p id="m2" style="color: red"></p>
                                    </div>
                                    <button href="inicio.html" type="submit"  class="btn btn-info btn-raised btn-block" name="loguin">Ingresar</button>
                                    <div class="authentication-body-footer margin-top-5">
                                        <div class="text-right">
                                            <a href="page-autenticación-olvido-contraseña.html">¿Recordar Contraseña?</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- inicio carusel imagenes movibles -->
                <div  class="col-md-8 col-sm-12 loguin">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <!-- estos on botones con forma de circulos son opcionales si se borran no pasa nada :) deben ser la misma cantidad de botones por cantidad de items (imagenes con texto ) -->
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img id="imagen_l"src="img/educación.jpg" alt="educación"/>
                                <div class="carousel-caption">
                                    <h3><font face="verdana" color="white" size="5">Ayudamos a Lograr Tus Metas</font></h3>
                                </div>
                            </div>
                            <div class="item">
                                <img id="imagen_l"src="img/familia.jpg" alt="familia"/>
                                <div class="carousel-caption">
                                    <h3><font face="verdana" color="green" size="5">Ayudamos a conseguir tus sueños</font></h3>
                                </div>
                            </div>
                            <div class="item">
                                <img id="imagen_l"src="img/tratamiento.jpg" alt="tratamineto">
                                <div class="carousel-caption">
                                    <h3><font face="verdana" color="green" size="5">Ayudamos a conseguir tus sueños</font></h3>
                                </div>
                            </div>
                            <div class="item">
                                <img id="imagen_l"src="img/vaacaciones.jpg" alt="vacaciones">
                                <div class="carousel-caption">
                                    <h3><font face="verdana" color="white" size="5"> Ayudamos a conseguir tus sueños</font></h3>
                                </div>
                            </div>

                        </div>
                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Anterior</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Siguiente</span>
                        </a>
                    </div>

                </div>
            </div>	
        </div>
        <div id="noValido" class="modal fade" style="display: none;">
            <div class="modal-dialog" style="transform: scale(1) translate(-50%, -50%); opacity: 1; top: 50%; left: 50%;">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><font><font>Usuario o contraseña invalida</font></font></h4>
                    </div>
                    <div class="modal-body">
                        <p><font><font>Por favor ingresa numente su usuario y contraseña.</font></font></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn-flat btn-ripple" data-dismiss="modal">¡Lo intentare!</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>