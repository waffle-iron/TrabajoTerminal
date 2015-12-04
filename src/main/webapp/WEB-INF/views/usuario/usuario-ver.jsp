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
<meta content="" name="description" />
<meta content="" name="author" />

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
				<!-- END PAGE HEADER-->
				<div class="portlet light portlet-fit bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-social-dribbble font-red"></i>
                                <span class="caption-subject font-red bold ">Detalle de perfil seleccionado</span>
                            </div>
                            
                        </div>
                  </div>
				
				<!-- BEGIN PAGE CONTENT-->
				<div class="row">
					<c:if test="${actualizado}">
						<h1 class="text-success"><strong>Datos actualizados</strong></h1>
					</c:if>
					<c:if test="${creado}">
                        <h1 class="text-success"><strong>Se ha creado un nuevo Usuario</strong></h1>
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
										${usuario.nombreUsuario}</div>
									<div class="profile-usertitle-job">
										${usuario.grado.nombre}</div>
									
								</div>
								<!-- END SIDEBAR USER TITLE -->
								<!-- SIDEBAR BUTTONS -->
								<div class="profile-userbuttons">
								<a href ="${contexto}/usuario/invitar/${usuario.idUsuarios}">
									<button type="button" class="btn btn-circle red btn-sm">Invitar
										a colaborar</button>
								</a>
								<a href="${contexto}/correo/crear">                        
									<button type="button" class="btn btn-circle btn-danger btn-sm">Mensaje</button>
								</a>
								</div>					
								<!-- END SIDEBAR BUTTONS -->
								<!-- SIDEBAR MENU -->
								<div class="profile-usermenu">
									<ul class="nav">
										<li class="active">


											<h2 class="profile-desc-title">Apellido Paterno:</h2>
											${usuario.aPaterno}
										</li>
										<li>

											<h2 class="profile-desc-title">Apellido Materno:</h2>
											${usuario.aMaterno}
										</li>
										<li>
											<h2 class="profile-desc-title">Email:</h2> ${usuario.email}
										</li>
										<li>

											<h2 class="profile-desc-title">Fecha de nacimiento:</h2>
											${usuario.fechaNacimiento}
										</li>
										<li>

											<h2 class="profile-desc-title">Estado Civil:</h2>
											${usuario.estadoCivil}
										</li>
										<li>

											<h2 class="profile-desc-title">Teléfono:</h2>
											${usuario.telefono}
										</li>
										<li>

											<h2 class="profile-desc-title">Sexo:</h2> ${usuario.sexo}
										</li>
										<li>

											<h2 class="profile-desc-title">Calificación:</h2>
											${usuario.evaluacion}
										</li>
										<li>

											<h2 class="profile-desc-title">Escuela:</h2>
											${usuario.escuela.nombre}
										</li>

										<li>

											<h2 class="profile-desc-title">Fecha ingreso IPN:</h2>
											${usuario.fechaIngresoIPN}
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