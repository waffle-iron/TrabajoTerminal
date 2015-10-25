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

				<c:url value="/buscar" var="urlBusquedaBus" />


				<!-- BEGIN FORM 1-->
				<h1>Realiza una Búsqueda</h1>
				<form action="${urlBusquedaBus}" method="get">
					<div class="form-body">
						<div class="form-group">
							<input name="cadena" cssClass="form-control input-sm"
								placeholder="Search..." />
						</div>
					</div>

					<div class="row">
						<button type="submit" class="btn green">Buscar</button>
					</div>
					<div class="row">
						<div class="col-md-8 col-md-offset-2"></div>
					</div>
				</form>
				<div class="row"></div>	<div class="row"></div>				

				<div class="row span12">
					<div class="col-md-8 col-md-offset-2"></div>
				</div>
				<div class="row"></div><div class="row"></div>
				
				<c:if test="${proyectos.size()>0}">
				<div class="row">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box red-intense">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i>Resultados
							</div>
							<div class="actions">
								<div class="btn-group">
									<a class="btn default" href="javascript:;"
										data-toggle="dropdown"> Ver columnas <i
										class="fa fa-angle-down"></i>
									</a>
									<div id="sample_4_column_toggler"
										class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
										<label><input type="checkbox" checked data-column="0">Proyecto</label>
										<label><input type="checkbox" checked data-column="1">Descripción</label>
										<label><input type="checkbox" checked data-column="2">Estado</label>
										<label><input type="checkbox" checked data-column="3">Coordinador</label>
										<label><input type="checkbox" checked data-column="4">Tipo</label>
									</div>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<table class="table table-striped table-bordered table-hover"
								id="sample_4">
								<thead>
									<tr>
										<th>Nombre</th>
										<th>Descripción</th>
										<th class="hidden-xs">Estado</th>
										<th class="hidden-xs">Coordinador</th>
										<th class="hidden-xs">Tipo de proyecto</th>
									</tr>

								</thead>
								<tbody>
									<c:forEach items="${proyectos}" var="proyecto">
										<tr>
											<td><a
												href="${contexto}/proyecto/${proyecto.idProyecto}/ver"
												class="btn default btn-xs purple"> <i class="fa fa-edit"></i>
													${proyecto.nombre}
											</a></td>
											<td>${proyecto.descripcion}</td>
											<td>${proyecto.estado}</td>
											<td>${proyecto.coordinador.nombres}</td>
											<td>${proyecto.tipoProyecto}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
				</c:if>
				<c:if test="${usuarios.size()>0}">
				<div class="row">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box red-intense">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i>Resultados Usuarios
							</div>
							<div class="actions">
								<div class="btn-group">
									<a class="btn default" href="javascript:;"
										data-toggle="dropdown"> Ver columnas <i
										class="fa fa-angle-down"></i>
									</a>
									<div id="sample_4_column_toggler"
										class="dropdown-menu hold-on-click dropdown-checkboxes pull-right">
										<label><input type="checkbox" checked data-column="0">Usuario</label>
										<label><input type="checkbox" checked data-column="1">Nombres</label>
										<label><input type="checkbox" checked data-column="2">Evaluación</label>
										<label><input type="checkbox" checked data-column="3">Escuelar</label>
										<label><input type="checkbox" checked data-column="4">Email</label>
									</div>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<table class="table table-striped table-bordered table-hover"
								id="sample_4">
								<thead>
									<tr>
										<th>Usuario</th>
										<th>Nombres</th>
										<th class="hidden-xs">Evaluación</th>
										<th class="hidden-xs">Escuela</th>
										<th class="hidden-xs">Email</th>
									</tr>

								</thead>
								<tbody>
									<c:forEach items="${usuarios}" var="usuario">
										<tr>
											<td><a
												href="${contexto}/usuario/${usuario.idUsuarios}/ver"
												class="btn default btn-xs purple"> <i class="fa fa-edit"></i>
													${usuario.nombreUsuario}
											</a></td>
											<td>${usuario.nombres}</td>
											<td>${usuario.evaluacion}</td>
											<td>${usuario.escuela.nombre}</td>
											<td>${usuario.email}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->					
				</div>
				</c:if>

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
			TableAdvanced.init();

		});
	</script>

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>