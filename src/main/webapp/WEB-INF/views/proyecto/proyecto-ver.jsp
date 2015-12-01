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
				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->
				

				<div class="row">
				<c:if test="${actualizado}">
						<h1 class="text-success"><strong>Datos actualizados</strong></h1>
					</c:if>
					<c:if test="${creado}">
                        <h1 class="text-success"><strong>Se ha creado un nuevo proyecto</strong></h1>
					</c:if>
					<div class="row">
					<div class="col-md-4" >
					</div>
						<div class="col-md-4" >
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
									
																			
								</div>
								<!-- END SIDEBAR USER TITLE -->
								<!-- SIDEBAR BUTTONS -->
								
								<!-- END SIDEBAR BUTTONS -->
								<!-- SIDEBAR MENU -->
								<div class="profile-usermenu">
									<ul class="nav">
										<li class="active">


											<h2 class="profile-desc-title">Descripción:</h2>
											${proyecto.descripcion}
										</li>
										<li>

											<h2 class="profile-desc-title">Fecha de inicio:</h2>
											${proyecto.fechaInicio}
										</li>
										<li>
											<h2 class="profile-desc-title">Fecha de fin:</h2> ${proyecto.fechaFin}
										</li>
										<li>

											<h2 class="profile-desc-title">Avance:</h2>
											${proyecto.avance} 
										</li>
										<li>

											<h2 class="profile-desc-title">Tipo de proyecto:</h2>
											${proyecto.tipoProyecto.nombre}
										</li>
										<li>

											<h2 class="profile-desc-title">Estado:</h2>
											${proyecto.estado.nombre}
										</li>
										<li>

											<h2 class="profile-desc-title">Coordinador:</h2> ${proyecto.coordinador.nombres}
										</li>
										


									</ul>
								</div>
								<!-- END MENU -->
							</div>



						</div>
						<!-- END BEGIN PROFILE SIDEBAR -->
						</div>
<!-- ********** --><div class="col-md-4">
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