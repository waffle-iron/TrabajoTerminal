<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contexto" value="${pageContext.request.contextPath}" />


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

    <jsp:include page="../recursos/estilos.jsp"></jsp:include>

</head>


<body class="page-header-fixed page-sidebar-closed-hide-logo">
<!-- BEGIN HEADER -->
<jsp:include page="../recursos/header.jsp"></jsp:include>
<!-- END HEADER -->
<div class="clearfix"></div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <jsp:include page="../recursos/side-bar.jsp"></jsp:include>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">

            <!-- BEGIN PAGE HEADER-->
            <jsp:include page="../recursos/breadcrumbs.jsp"></jsp:include>
            <!-- END PAGE HEADER-->

            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN VALIDATION STATES-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>Tareas de <b>${miProyecto.nombre}</b>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>
                                            #
                                        </th>
                                        <th>
                                            Nombre de Usuario
                                        </th>
                                        <th>
                                            Nombre (s)
                                        </th>
                                        <th>
                                            Apellido Paterno
                                        </th>
                                        <th>
                                            Apellido Materno
                                        </th>
                                        <th>
                                            Correo electrónico
                                        </th>
                                        <th>
                                            Teléfono
                                        </th>
                                        <th>
                                            Asignar Tarea
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${miProyecto.colaboradorProyectos}" var="colaborador" varStatus="loop">
                                        <tr>
                                            <td>
                                                ${loop.index + 1}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.nombreUsuario}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.nombres}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.nombres}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.nombres}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.email}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.telefono}
                                            </td>
                                            <td>
                                                <a href="${contexto}/proyecto/${miProyecto.idProyecto}/asignar-tarea/${colaborador.usuario.idUsuarios}" class="btn default btn-xs purple">
                                                    <i class="fa fa-edit"></i> Asignar </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!-- END VALIDATION STATES-->
                </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
    </div>
    <!-- END CONTENT -->
</div>
<!-- END CONTAINER -->

<!-- BEGIN FOOTER -->
<jsp:include page="../recursos/footer.jsp"></jsp:include>
<!-- END FOOTER -->

<!-- BEGIN JS -->
<jsp:include page="../recursos/recursos-js.jsp"></jsp:include>
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