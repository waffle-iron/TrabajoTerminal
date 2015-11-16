<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<c:if test="${actualizado}">
					<h1 class="text-success"><strong>Datos actualizados</strong></h1>
				</c:if>
				<c:if test="${creado}">
					<h1 class="text-success"><strong>Se ha creado un nuevo Usuario</strong></h1>
				</c:if>
				<div class="col-md-8 col-md-offset-2">
					<div class="portlet blue-hoki box">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cogs"></i>Información del usuario
							</div>
							<div class="actions">
								<div class="btn-group">
									<a class="btn blue-hoki btn-circle btn-sm" href="javascript:;" data-toggle="dropdown"
									   data-hover="dropdown" data-close-others="true"> Más
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="dropdown-menu pull-right">
										<li>
											<a href="${contexto}/chat/${usuario.idUsuarios}"> Enviar Mensaje </a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row static-info">
								<div class="col-md-5 name">
									Nombre de usuario:
								</div>
								<div class="col-md-7 value">
									${usuario.nombreUsuario}
								</div>
							</div>


							<div class="row static-info">
								<div class="col-md-5 name">
									Nombres
								</div>
								<div class="col-md-7 value">
									${usuario.nombres}
								</div>
							</div>
							<div class="row static-info">
								<div class="col-md-5 name">
									Apellido paterno
								</div>
								<div class="col-md-7 value">
									${usuario.aPaterno}
								</div>
							</div>
							<div class="row static-info">
								<div class="col-md-5 name">
									Apellido materno
								</div>
								<div class="col-md-7 value">
									${usuario.aMaterno}
								</div>
							</div>
							<div class="row static-info">
								<div class="col-md-5 name">
									Email
								</div>
								<div class="col-md-7 value">
									${usuario.email}
								</div>
							</div>
							<div class="row static-info">
								<div class="col-md-5 name">
									Fecha de nacimiento
								</div>
								<div class="col-md-7 value">
									${usuario.fechaNacimiento}
								</div>
							</div>
							<div class="row static-info">
								<div class="col-md-5 name">
									Estado Civil
								</div>
								<div class="col-md-7 value">
									${usuario.estadoCivil}
								</div>
							</div>
							<div class="row static-info">
								<div class="col-md-5 name">
									Telefono
								</div>
								<div class="col-md-7 value">
									${usuario.telefono}
								</div>
							</div>
							<div class="row static-info">
								<div class="col-md-5 name">
									Sexo
								</div>
								<div class="col-md-7 value">
									${usuario.sexo}
								</div>
							</div>
							<div class="row static-info">
								<div class="col-md-5 name">
									Fecha ingreso IPN
								</div>
								<div class="col-md-7 value">
									${usuario.fechaIngresoIPN}
								</div>
							</div>
							<div class="row static-info">
								<div class="col-md-5 name">
									Calificacion
								</div>
								<div class="col-md-7 value">
									${usuario.evaluacion}
								</div>
							</div>

							<div class="row static-info">
								<div class="col-md-5 name">
									Grado
								</div>
								<div class="col-md-7 value">
									${usuario.grado.nombre}
								</div>
							</div>
							<div class="row static-info">
								<div class="col-md-5 name">
									Escuela
								</div>
								<div class="col-md-7 value">
									${usuario.escuela.nombre}
								</div>
							</div>


						</div>
					</div>


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