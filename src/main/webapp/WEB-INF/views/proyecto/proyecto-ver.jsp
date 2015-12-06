<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
					<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
							
							 <i class="icon-share font-dark"></i>
							 <font size="6px">							 
							 <span class="caption-subject font-red bold uppercase ">Contenido de proyecto</span><br /></font>
							
							
						</div>

					</div>
				</div>
					
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
										${proyecto.nombre}
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
											<p class="text-muted">Fecha de fin:</p>
											<p class="text-primary">${proyecto.fechaFin}</p>
											
											
										</li>
										<li>

											<p class="text-muted">Avance:</p>
											<p class="text-primary">${proyecto.avance} </p>
										</li>
										<li>
											<p class="text-muted">Tipo de proyecto:</p>
											<p class="text-primary">${proyecto.tipoProyecto.nombre}</p>
											
											
										</li>
										<li>
											<p class="text-muted">Estado:</p>
											<p class="text-primary">${proyecto.estado.nombre}</p>
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