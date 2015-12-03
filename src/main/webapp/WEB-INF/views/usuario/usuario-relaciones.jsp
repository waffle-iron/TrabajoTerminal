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
			
			<div class="portlet light portlet-fit bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                    <i class="fa fa-list"></i>
                                <span class="caption-subject font-red bold ">Sugerencias</span>
                            </div>
                            
                        </div>
                  </div>
			
			
            <c:forEach items="${mapa}" var="entry">
                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet grey">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-users"></i> Usuarios relacionados con: <b>${entry.key}</b>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-scrollable">
                                    <table class="table table-striped table-bordered table-advance table-hover">
                                        <thead>
                                        <tr>
                                            <th class="hidden-xs">
												 Nombre usuario
                                            </th>
                                            <th>
                                                 Apellido paterno
                                            </th>
                                            <th>
                                                Apellido materno
                                            </th>
                                            <th>
                                                Email
                                            </th>
                                            <th>
                                                 Estado civil
                                            </th>
                                            <th>
                                                Sexo
                                            </th>
                                            <th>
                                                Fecha ingreso IPN
                                            </th>
                                            <th>
                                                Calificación
                                            </th>
                                            <th>
                                                Escuela
                                            </th>
                                            <th>
                                                Grado
                                            </th>
                                            <th>
                                                Direccion
                                            </th>

                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach items="${entry.value}" var="usuario">
                                            <tr>
                                                <td>
                                                    <a href="${contexto}usuario/ver/${usuario.idUsuarios}">
                                                            ${usuario.nombreUsuario}
                                                    </a>
                                                </td>
                                                <td>
                                                    
                                                            ${usuario.nombres}
                                                    
                                                </td>
                                                <td>
                                                   
                                                            ${usuario.aPaterno}
                                                   
                                                </td>
                                                <td>
                                                    
                                                            ${usuario.aMaterno}
                                                    
                                                </td>
                                                <td>
                                                    
                                                            ${usuario.email}
                                                    
                                                </td>
                                                <td>
                                                    
                                                            ${usuario.estadoCivil}
                                                    
                                                </td>
                                                <td>
                                                    
                                                            ${usuario.sexo}
                                                    
                                                </td>
                                                <td>
                                                    
                                                            ${usuario.fechaIngresoIPN}
                                                    
                                                </td>
                                                <td>
                                                    
                                                            ${usuario.evaluacion}
                                                    
                                                </td>

                                                <td>
                                                    
                                                            ${usuario.grado.nombre}
                                                    
                                                </td>
                                                <td>
                                                    
                                                            ${usuario.escuela.nombre}
                                                    
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
            </c:forEach>
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