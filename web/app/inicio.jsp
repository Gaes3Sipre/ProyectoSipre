<%-- 
    Document   : inicio
    Created on : 04-dic-2016, 13:00:19
    Author     : ERICK AYALA
--%>

<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="edu.sipre.modoles.generales.GnRol"%>
<%@page import="edu.sipre.modoles.generales.GnDetalleRol"%>
<%@page import="edu.sipre.modoles.generales.GnUsuario"%>
<%@page import="java.util.List"%>
<%@page import="edu.sipre.modoles.generales.dao.DetalleRolDAO_SQL"%>
<%@page import="edu.sipre.modoles.generales.dao.DetalleRolDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page='../WEB-INF/Head.jsp' flush="true"/>     
    <body class="container-fluid">
        <jsp:include page='../WEB-INF/Translado.jsp' flush="true"/>     
        <jsp:include page='../WEB-INF/ListadoOpciones.jsp' flush="true"/>     
        <div id="page-wrapper">
            <aside id="left-content" data-toggle="open" data-default="open" data-size="">
                <header class="header-container">
                    <div class="header-wrapper">
                        <div id="header-brand">
                            <div class="logo padding-left-2">
                                <span><img src="../img/favico.png" style="width: 32px; height: 32px;"></span>
                                <span class="logo-text" style="color:#42a5f5;">SIPRE</span>
                            </div>
                        </div>
                    </div>
                </header>
                <div id="sidebar-wrapper">
                    <div id="userbox">
                        <div id="useravatar">
                            <div class="avatar-thumbnail">
                                <img src="../img/avatar/avatar_square_blue.png" class="img-circle">
                            </div>
                        </div>
                        <div id="userinfo">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default-bright btn-flat dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Santiago Bernal<i class="material-icons">arrow_drop_down</i>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="perfil.html"><i class="material-icons">person</i> <span data-i18n="userinfo.profile">Perfil</span></a></li>
                                    <li><a href="configuracion.html"><i class="material-icons">settings</i> <span data-i18n="userinfo.settings">Configuración</span></a></li>
                                    <li class="divider-horizontal"></li>
                                    <li><a href="Loguin.html"><i class="material-icons">exit_to_app</i> <span data-i18n="userinfo.logout">Salir</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div> <!-- END: #userbox -->
                    <nav id="sidebar">

                        <li>
                            <a href="Paginas/Em_datosBasicos.html">
                                <span class="menu-item-ico"><i class="material-icons">&#xE87C</i></span>
                                <span class="menu-item-name" data-i18n="nav.components.components">Biodata</span>
                            </a>
                            <ul>
                                <li><a href="Paginas/Em_datosBasicos.html"><span data-i18n="nav.components.accordions">Mis datos Personales</span></a></li>
                                <li><a href="Paginas/em_datosBenefiiario.html"><span data-i18n="nav.components.alerts">Mis Beneficiarios</span></a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">
                                <span class="menu-item-ico"><i class="material-icons">local_hospital</i></span>
                                <span class="menu-item-name" data-i18n="nav.components.components">Beneficios</span>
                            </a>
                            <ul>
                                <li><a href="Paginas/em_solicitud.html"><span data-i18n="nav.components.accordions">Mis solicitudes</span></a></li>
                                <li><a href="Paginas/em_citas.html"><span data-i18n="nav.components.alerts">Mis citas medicas</span></a>
                                </li>
                            </ul>
                        </li>
                    </nav><!-- END: nav#sidebar -->	
                </div>
            </aside>

            <section id="right-content">
                <header class="header-container">
                    <div class="header-wrapper">
                        <div id="header-toolbar">
                            <ul class="toolbar toolbar-right">
                                <li>
                                    <a id="sidebar-toggle" data-state="open" href="javascript:void(0);"><i class="material-icons">menu</i></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" id="fullscreen-toggle" data-toggle="tooltip" data-placement="bottom" title="Pantalla Completa" data-i18n="[title]headerToolbar.fullscreenToggle"><i class="material-icons">fullscreen</i></a>
                                </li>
                            </ul>
                        </div>
                        <div id="header-toolbar">
                            <ul class=" dropdown toolbar toolbar-left">
                                <a id="sidebar-toggle" href="javascript:void(0);" role="button" data-toggle="dropdown" data-container="body" data-placement="bottom" title="Seleccione Perfil"><i class="material-icons">directions_walk</i> <span class="caret"></span></a>
                                <table>
                                    <tbody>
                                        <%
                                            HttpSession objSesion = request.getSession(true);
                                            String usuario = (String) objSesion.getAttribute("sipreUS");
                                            DetalleRolDAO_SQL dr = new DetalleRolDAO_SQL();
                                            List<GnDetalleRol> Roles = dr.buscarRolesUsuario(usuario);
                                            EntityManager em = Persistence.createEntityManagerFactory("SiprePU").createEntityManager();
                                            for (int i = 0; i < Roles.size(); i++) {
                                        %>
                                        <tr>
                                            <td><%Roles.get(i).getCodRol().toString();%></td>
                                        </tr>
                                        <%};%>
                                    </tbody>
                                </table>
                            </ul>
                        </div>
                    </div><!-- /#header-toolbar -->
                </header>       
                <jsp:include page='../WEB-INF/footer.jsp' flush="true"/> 
            </section><!-- /#right-content -->

        </div>

    </body>
</html>
