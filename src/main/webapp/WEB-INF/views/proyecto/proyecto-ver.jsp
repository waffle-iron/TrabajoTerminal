<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				<!-- SIDEBAR MENU -->
								<div class="profile-usermenu">
									<ul class="nav">
										<li class="active">


											<h2 class="profile-desc-title">Nombre del proyecto:</h2>
											${proyecto.nombre}
										</li>
										<li>

											<h2 class="profile-desc-title">Descripción:</h2>
											${proyecto.descripcion}
										</li>
										<li>
											<h2 class="profile-desc-title">Fecha de Inicio:</h2> ${proyecto.fechaInicio}
										</li>
										<li>

											<h2 class="profile-desc-title">Fecha de Fin:</h2>
											${proyecto.fechaFin}
										</li>
										<li>

											<h2 class="profile-desc-title">Tipo:</h2>
											${proyecto.tipoProyecto.nombre}
										</li>
										<li>

											<h2 class="profile-desc-title">Coordinador:</h2>
											${proyecto.coordinador.nombres}
										</li>
										<li>

											


									</ul>
								</div>
								<!-- END MENU -->
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