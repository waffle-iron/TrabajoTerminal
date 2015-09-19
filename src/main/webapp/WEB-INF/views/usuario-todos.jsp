<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="contexto"/>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

    <title>Trabajor terminal | archivo base</title>
    <meta content="" name="description"/>
    <meta content="" name="author"/>

    <jsp:include page="recursos/estilos.jsp"></jsp:include>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
<!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
<!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
<!-- DOC: Apply "page-sidebar-closed-hide-logo" class to the body element to make the logo hidden on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
<!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
<!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
<!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->

<body class="page-header-fixed page-sidebar-closed-hide-logo">
<!-- BEGIN HEADER -->
<jsp:include page="recursos/header.jsp"></jsp:include>
<!-- END HEADER -->
<div class="clearfix"></div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <jsp:include page="recursos/side-bar.jsp"></jsp:include>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">

            <!-- BEGIN PAGE HEADER-->
            <jsp:include page="recursos/breadcrumbs.jsp"></jsp:include>
            <!-- END PAGE HEADER-->

            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <div class="col-md-12">
                    <h2><b class="text-success">
                        <c:if test="${eliminado}">
                            El usuario ha sido eliminado
                        </c:if>
                        <c:if test="${!eliminado}">
                            No existe usuario
                        </c:if>
                    </b></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-shopping-cart"></i>Usuarios
                            </div>

                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-striped table-bordered table-advance table-hover">
                                    <thead>
                                    <tr>
                                        <th>
                                            <i class="fa fa-briefcase"></i> id
                                        </th>
                                        <th class="hidden-xs">
                                            <i class="fa fa-question"></i> nombre
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> contraseña
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> Nombres
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> aPaterno
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> aMaterno
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> email
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> fechaNacimiento
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> estadoCivil
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> telefono
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> sexo
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> fechaIngresoIPN
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> calificacion
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> escuela
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> grado
                                        </th>
                                        <th>
                                            <i class="fa fa-bookmark"></i> direccion
                                        </th>
                                        
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${usuarioList}" var="usuario">
                                        <tr>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.idUsuarios}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.nombreUsuario}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.contraseña}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.nombres}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.aPaterno}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.aMaterno}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.email}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.fechaNacimiento}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.estadoCivil}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.telefono}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.sexo}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.fechaIngresoIPN}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                    ${usuario.evaluacion}
                                                </a>
                                            </td>

                                            <td>
                                                <a href="${contexto}grado/ver/${usuario.grado.idGrado}">
                                                    ${usuario.grado.nombre}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="${contexto}escuela/ver/${usuario.escuela.id}">
                                                    ${usuario.escuela.nombre}
                                                </a>
                                            </td>
                                            
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- END SAMPLE TABLE PORTLET-->

                </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
    </div>
    <!-- END CONTENT -->
</div>
<!-- END CONTAINER -->

<!-- BEGIN FOOTER -->
<jsp:include page="recursos/footer.jsp"></jsp:include>
<!-- END FOOTER -->

<!-- BEGIN JS -->
<jsp:include page="recursos/recursos-js.jsp"></jsp:include>
<!-- END JS -->
<script>
    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
    });
</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>