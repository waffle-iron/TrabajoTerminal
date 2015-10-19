<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/" var="contexto" />
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

<title>Trabajor terminal | archivo base</title>
<meta content="" name="description" />
<meta content="" name="author" />

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
				<div class="row-fluid span12"></div>
				<div class="row">${error}</div>
				<c:url value="/busqueda/bus" var="urlBusquedaBus" />
			


				<c:url value="/busqueda/bus" var="urlBusquedaBus" />
				<!-- BEGIN FORM-->
				<form:form action="${urlBusquedaBus}" method="get" commandName="cadena" >
					<div class="form-body">
						<div class="form-group">
							<form:input path="cadenaBuscada" cssClass="form-control input-sm" placeholder="Search..." />
							<form:errors path="cadenaBuscada" element="span" cssClass="help-block text-danger" />
						</div>
					</div>
					<button type="submit" class="btn green">Buscar</button>
					<button type="button" class="btn default">Cancelar</button>
					<div class="row">
						<div class="col-md-8 col-md-offset-2"></div>
					</div>
				</form:form>
				<div class="row span12">
					<div class="col-md-8 col-md-offset-2"></div>
				</div>
				
 <!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box red">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cogs"></i>Simple Table
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="remove">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-scrollable">
								<table class="table table-hover">
								<thead>
								<tr>
									<th>
										 Proyecto
									</th>
									<th>
										 Descripcion
									</th>
									<th>
										Tipo de Proyecto
									</th>
									<th>
										 Usuario
									</th>
									<th>
										 
									</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>
										 ${proyecto.nombre}
									</td>
									<td>
										${proyecto.descripcion}
									</td>
									<td>
										${proyecto.tipoProyecto}
									</td>
									<td>
										 ${proyecto.estado}
										 
									</td>
									<td>
										<a href="${contexto}/usuario/ver/${proyecto.coordinador.idUsuarios}" class="btn default btn-xs green-stripe">${proyecto.coordinador.nombres}</a>
										 
										 
									</td>
								</tr>
												</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
                	
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-bell-o"></i>Mis Proyectos
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="#portlet-config" data-toggle="modal" class="config">
								</a>
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="remove">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-advance table-hover">
								<thead>
								<tr>
									<th>
										<i class="fa fa-bars"></i> Proyecto
									</th>
									<th class="hidden-xs">
										<i class="fa fa-user"></i> Usuario
									</th>
									<th>
										<i class="fa fa-edit"></i> Acciones
									</th>
									<th>
										<i class=""></i> Acciones
									</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${proyectosList}" var="proyecto">
						
								<tr>
									<td class="highlight">
										<div class="success">
										</div>
										<a href="javascript:;">
										${proyecto.idProyecto} </a>
									</td>
									<td class="hidden-xs">
										${proyecto.nombre}
									</td>
									<td>
										<a href="${contexto}/proyecto/${proyecto.idProyecto}/editar" class="btn default btn-xs purple">
										<i class="fa fa-edit"></i> Edit </a>
									</td>
									<td>
										<a href="${contexto}/proyecto/eliminar/${proyecto.idProyecto}" class="btn default btn-xs black">
										<i class="fa fa-trash-o"></i> Delete </a>
									</td>
									
								</tr>
							</c:forEach>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
					
				



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
		jQuery(document).ready(function() {
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			Demo.init(); // init demo features
		});
	</script>

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>