<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <!-- END PAGE HEADER-->

            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <p>${invitaciones == null ? 'No tienes invitaciones' : ''}</p>

                <div class="col-md-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
							
							 <i class="icon-share font-dark"></i>
							 <font size="6px">							 
							 <span class="caption-subject font-red bold uppercase ">Mis invitaciones</span><br /></font>
							
							
						</div>

					</div>
				</div>
                    
                    
                    <div class="portlet light bordered">
                       
                        <div class="portlet-body">
                            <div class="table-toolbar">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="btn-group">
                                            <button id="sample_editable_1_new" class="btn sbold green">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
<!--                                     <div class="col-md-6"> -->
<!--                                         <div class="btn-group pull-right"> -->
<!--                                             <button class="btn green  btn-outline dropdown-toggle" -->
<!--                                                     data-toggle="dropdown">... -->
<!--                                                 <i class="fa fa-angle-down"></i> -->
<!--                                             </button> -->
<!--                                             <ul class="dropdown-menu pull-right"> -->
<!--                                                 <li> -->
<!--                                                     <a href="javascript:;"> -->
<!--                                                         <i class="fa fa-print"></i> .. </a> -->
<!--                                                 </li> -->
<!--                                                 <li> -->
<!--                                                     <a href="javascript:;"> -->
<!--                                                         <i class="fa fa-file-pdf-o"></i> .. </a> -->
<!--                                                 </li> -->
<!--                                                 <li> -->
<!--                                                     <a href="javascript:;"> -->
<!--                                                         <i class="fa fa-file-excel-o"></i> .. </a> -->
<!--                                                 </li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                </div>
                            </div>
                            <table class="table table-striped table-bordered table-hover table-checkable order-column"
                                   id="sample_1">
                                <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" class="group-checkable"
                                               data-set="#sample_1 .checkboxes"/></th>
                                    <th> Proyecto</th>
                                    <th>Qui�n te invita</th>
                                    <th> Fecha</th>
                                    <th> Estado</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${invitaciones}" var="invitacion">
                                    <tr class="odd gradeX">
                                        <td>
                                            <input type="checkbox" class="checkboxes" value="1"/>
                                        </td>
                                        <td>
                                            ${invitacion.colaboradorProyecto.proyecto.nombre}
                                        </td>
                                        <td>
                                            ${invitacion.colaboradorProyecto.usuario.nombres} ${invitacion.colaboradorProyecto.usuario.aPaterno}
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${invitacion.fecha}" var="var_fechaInicio" pattern="yyyy-MM-dd" />
                                            ${var_fechaInicio}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${invitacion.estado == 1}">
                                                    <span class="label label-sm label-warning">
                                                        Pendiente
                                                    </span>
                                                </c:when>
                                                <c:when test="${invitacion.estado == 2}">
                                                    <span class="label label-sm label-success">
                                                        Acepptada
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="label label-sm label-info">
                                                        Rechazada
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${invitacion.estado == 1}">
                                                    <a href="${contexto}/invitacion/${invitacion.idInvitacion}/editar" class="label label-sm label-default">
                                                        Mirar
                                                    </a>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
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
        TableAdvanced.init();
    });
</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>