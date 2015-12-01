<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

				<!-- BEGIN PAGE CONTENT-->

				<div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">

							<span class="caption-subject font-red bold ">Mi perfil</span>
							${nombre}
						</div>

					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
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
									<div>
										${usuario.grado.nombre}</div>
									<div class="profile-usertitle-job">
										<a href="${contexto}/usuario/${usuario.idUsuarios}/editar ">
											Editar perfil</a>
									</div>
									<div class="profile-usertitle-job">
										<a href="${contexto}/mis-invitaciones">
											Ver invitaciones</a>
									</div>
									<div class="profile-usertitle-job">
										<a href="${contexto}/crear/correo">
											Enviar correo en chat</a>
									</div>

								</div>
								<!-- END SIDEBAR USER TITLE -->
								<!-- SIDEBAR BUTTONS -->

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





						<!-- BEGIN PROFILE CONTENT -->
						<div class="profile-content" align="center">
							

							<div class="row">
								<div class="col-md-12">



									<!-- BEGIN EXAMPLE TABLE PORTLET-->
									<div class="portlet box grey">
										<div class="portlet-title">
											<div class="caption">Proyectos</div>
											<div class="tools">
												<a href="javascript:;" class="reload"> </a> <a
													href="javascript:;" class="remove"> </a>
											</div>
										</div>
										<div class="portlet-body" style="height: 600px">
											<table class="table table-striped table-bordered table-hover"
												id="sample_3">
												<thead>
													<tr>
														<th>#</th>
														<th>Nombre</th>
														<th>Descripción</th>
														<th>Fecha de Inicio</th>
														<th>Fecha de Fin</th>
														<th>Coordinador</th>
														<th>Editar proyecto</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${proyectos}" var="proyecto"
														varStatus="loop">
														<tr>
															<td><a
																href="${contexto}/proyecto/propio/${proyecto.idProyecto}">${loop.index + 1}</a>
															</td>
															<td>${proyecto.nombre}</td>
															<td>${proyecto.descripcion}</td>
															<td>${proyecto.fechaInicio}</td>
															<td>${proyecto.fechaFin}</td>
															<td>${proyecto.coordinador.nombres}</td>
															<td><a
																href="${contexto}/proyecto/${proyecto.idProyecto}/editar"
																class="btn default btn-xs grey"> <i
																	class="fa fa-edit"></i> Editar
															</a></td>
														</tr>

													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<!-- END EXAMPLE TABLE PORTLET-->





								</div>
							</div>
							<div class="row" align="center">
								<div class="col-md-4"></div>

								<div class="col-md-4">
									<div class="profile-sidebar" style="width: 500x;">
										<!-- PORTLET MAIN -->
										<div class="portlet light profile-sidebar-portlet">
											<div class="profile-content">
												<div class="row" align="center">
													<a href="${contexto}/proyecto/crear">
														<button type="submit" class="btn red-soft">Crear
															Proyecto</button>
													</a>
												</div>
											</div>
										</div>

									</div>
								</div>
								<div class="col-md-4"></div>
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
			TableAdvanced.init();

		});
	</script>

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>