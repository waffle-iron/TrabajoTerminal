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
				

				<div class="row">
				<c:if test="${actualizado}">
						<h1 class="text-success"><strong>Datos actualizados</strong></h1>
					</c:if>
					<c:if test="${creado}">
                        <h1 class="text-success"><strong>Se ha creado un nuevo proyecto</strong></h1>
					</c:if>
					
					
				
					<div class="col-md-8 col-md-offset-2">
						<div class="portlet blue-hoki box">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-cogs"></i>Información del Proyecto
								</div>
								
							</div>
							<div class="portlet-body">
								<div class="row static-info">
									<div class="col-md-5 name">
										Nombre del proyecto:
									</div>
									<div class="col-md-7 value">
										${proyecto.nombre}
									</div>
								</div>
								
															
								<div class="row static-info">
									<div class="col-md-5 name">
										Descripción:
									</div>
									<div class="col-md-7 value">
										${proyecto.descripcion}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Fecha de inicio:
									</div>
									<div class="col-md-7 value">
										${proyecto.fechaInicio}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Fecha Fin:
									</div>
									<div class="col-md-7 value">
										${proyecto.fechaFin}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Avance:
									</div>
									<div class="col-md-7 value">
										${proyecto.avance} 
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Tipo de proyecto:
									</div>
									<div class="col-md-7 value">
										${proyecto.tipoProyecto}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Estado:
									</div>
									<div class="col-md-7 value">
										${proyecto.estado}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Coordinador:
									</div>
									<div class="col-md-7 value">
										${proyecto.coordinador.nombres}
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