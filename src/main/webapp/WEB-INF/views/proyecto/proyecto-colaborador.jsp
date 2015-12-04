<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contexto" value="${pageContext.request.contextPath}"/>
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
            <!-- END PAGE HEADER-->

            <!-- BEGIN PAGE CONTENT-->


            <div class="portlet light portlet-fit bordered">
                <div class="portlet-title">
                    <div class="caption">

                        <i class="icon-share font-dark"></i>
                        <font size="5px">
                            <span class="caption-subject font-red bold uppercase ">Proyecto Colaborador</span><br/></font>


                    </div>

                </div>
            </div>


            <div class="row">


                <c:if test="${actualizado}">
                    <h1 class="text-success"><strong>Datos actualizados</strong></h1>
                </c:if>
                <c:if test="${creado}">
                    <h1 class="text-success"><strong>Se ha creado un nuevo proyecto</strong></h1>
                </c:if>

                <div class="col-md-12">


                    <!-- 					******** -->
                    <!-- BEGIN PROFILE SIDEBAR -->
                    <div class="profile-sidebar" style="width: 250px;">
                        <!-- PORTLET MAIN -->
                        <div class="portlet light profile-sidebar-portlet">
                            <!-- SIDEBAR USERPIC -->

                            <!-- END SIDEBAR USERPIC -->
                            <!-- SIDEBAR USER TITLE -->
                            <div class="profile-usertitle">
                                <div class="profile-usertitle-name">
                                    ${proyecto.nombre}</div>

                                <div class="profile-usertitle-job">
                                    <a href="${contexto}/proyecto/reporte/${proyecto.idProyecto}">
                                        <i class="fa fa-external-link"></i> Reporte de proyecto</a>&nbsp;<i
                                        class="fa fa-share"></i>
                                </div>


                            </div>
                            <!-- END SIDEBAR USER TITLE -->
                            <!-- SIDEBAR BUTTONS -->

                            <!-- END SIDEBAR BUTTONS -->
                            <!-- SIDEBAR MENU -->
                            <div class="profile-usermenu">
                                <ul class="nav">
                                    <li class="active">

                                        <p class="text-muted">Descripción:</p>

                                        <p class="text-primary">${proyecto.descripcion}</p>
                                    </li>
                                    <li>

                                        <p class="text-muted">Fecha de inicio:</p>

                                        <p class="text-primary">${proyecto.fechaInicio}</p>
                                    </li>
                                    <li>
                                        <p class="text-muted">Avance:</p>

                                        <p class="text-primary">${proyecto.avance}</p>
                                    </li>

                                    <li>

                                        <p class="text-muted">Tipo de proyecto:</p>

                                        <p class="text-primary">${proyecto.tipoProyecto.nombre}</p>
                                    </li>
                                    <li>

                                        <p class="text-muted">Estado:</p>

                                        <p class="text-primary">${proyecto.estado.nombre}</p>
                                    </li>
                                    <li>

                                        <p class="text-muted">Coordinador:</p>

                                        <p class="text-primary"> ${proyecto.coordinador.nombres}</p>
                                    </li>


                                </ul>
                            </div>
                            <!-- END MENU -->


                        </div>
                        <!-- END BEGIN PROFILE SIDEBAR -->
                    </div>


                    <div class="col-md-8">

                        <div class="col-md-4">
                        </div>

                        <div class="col-md-4">




                        </div>
                        <div class="col-md-4">
                        </div>

                        <!-- BEGIN VALIDATION STATES-->
                        <div class="portlet box grey">
                            <div class="portlet-title">
                                <div class="caption">
                                    Compañeros de <b>${proyecto.nombre}</b>
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

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${proyecto.colaboradorProyectos}" var="colaborador"
                                                   varStatus="loop">
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
                                                        ${colaborador.usuario.aPaterno}
                                                </td>
                                                <td>
                                                        ${colaborador.usuario.aMaterno}
                                                </td>
                                                <td>
                                                        ${colaborador.usuario.email}
                                                </td>
                                                <td>
                                                        ${colaborador.usuario.telefono}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                        <!-- BEGIN VALIDATION STATES-->
                        <div class="portlet box grey">
                            <div class="portlet-title">
                                <div class="caption">
                                    Mis Tareas</b>
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
                                                Título
                                            </th>
                                            <th>
                                                Estado
                                            </th>
                                            <th>
                                                Avance
                                            </th>
                                            <th>
                                                Fecha de Asignación
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${tareasList}" var="tarea" varStatus="loop">
                                            <tr>
                                                <td>
                                                        ${loop.index + 1}
                                                </td>
                                                <td>
                                                        ${tarea.titulo}
                                                </td>
                                                <td>
                                                        ${tarea.estado}
                                                </td>
                                                <td>
                                                        ${tarea.avance}
                                                </td>
                                                <td>
                                                        ${tarea.fechaEntrega}
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
                    <!-- END VALIDATION STATES-->

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

        function confirmar(text, tez2) {
            return confirm("¿Estas seguro de que deseas quitar a este colaborador de tu proyecto? Al dejar de colaborar con el se perdera la tarea que tiene asiganada")
        }


    </script>

    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-37564768-1', 'keenthemes.com');
        ga('send', 'pageview');
    </script>


    <!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>