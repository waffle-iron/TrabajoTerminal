<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
					<div class="col-md-12">
						<!-- BEGIN PROFILE SIDEBAR -->
						<div class="profile-sidebar" style="width: 250px;">
							<!-- PORTLET MAIN -->
							<div class="portlet light profile-sidebar-portlet">
								<!-- SIDEBAR USERPIC -->
								<div class="profile-userpic">
									<img
										src="../../assets/admin/pages/media/profile/profile_user.jpg"
										class="img-responsive" alt="">
								</div>
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
									<button type="button" class="btn btn-circle green-haze btn-sm">Invitar
										a colaborar</button>
									<button type="button" class="btn btn-circle btn-danger btn-sm">Mensaje</button>
								</div>
								<!-- END SIDEBAR BUTTONS -->
								<!-- SIDEBAR MENU -->
								<div class="profile-usermenu">
									<ul class="nav">
										<li class="active">


											<h2 class="profile-desc-title">Apellido Parterno:</h2>
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
						<div class="profile-content">
							<div class="row">
								<div class="col-md-12">



									<!-- BEGIN EXAMPLE TABLE PORTLET-->
									<div class="portlet box blue-madison">
										<div class="portlet-title">
											<div class="caption">
												<i class="fa fa-globe"></i>Responsive Table With Expandable
												details
											</div>
											<div class="tools">
												<a href="javascript:;" class="reload"> </a> <a
													href="javascript:;" class="remove"> </a>
											</div>
										</div>
										<div class="portlet-body">
											<table class="table table-striped table-bordered table-hover"
												id="sample_3">
												<thead>
													<tr>
														<th>Rendering engine</th>
														<th>Browser</th>
														<th>Platform(s)</th>
														<th>Engine version</th>
														<th>CSS grade</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>Trident</td>
														<td>Internet Explorer 4.0</td>
														<td>Win 95+</td>
														<td>4</td>
														<td>X</td>
													</tr>
													<tr>
														<td>Trident</td>
														<td>Internet Explorer 5.0</td>
														<td>Win 95+</td>
														<td>5</td>
														<td>C</td>
													</tr>
													<tr>
														<td>Trident</td>
														<td>Internet Explorer 5.5</td>
														<td>Win 95+</td>
														<td>5.5</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Trident</td>
														<td>Internet Explorer 6</td>
														<td>Win 98+</td>
														<td>6</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Trident</td>
														<td>Internet Explorer 7</td>
														<td>Win XP SP2+</td>
														<td>7</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Trident</td>
														<td>AOL browser (AOL desktop)</td>
														<td>Win XP</td>
														<td>6</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Firefox 1.0</td>
														<td>Win 98+ / OSX.2+</td>
														<td>1.7</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Firefox 1.5</td>
														<td>Win 98+ / OSX.2+</td>
														<td>1.8</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Firefox 2.0</td>
														<td>Win 98+ / OSX.2+</td>
														<td>1.8</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Firefox 3.0</td>
														<td>Win 2k+ / OSX.3+</td>
														<td>1.9</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Camino 1.0</td>
														<td>OSX.2+</td>
														<td>1.8</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Camino 1.5</td>
														<td>OSX.3+</td>
														<td>1.8</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Netscape 7.2</td>
														<td>Win 95+ / Mac OS 8.6-9.2</td>
														<td>1.7</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Netscape Browser 8</td>
														<td>Win 98SE+</td>
														<td>1.7</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Netscape Navigator 9</td>
														<td>Win 98+ / OSX.2+</td>
														<td>1.8</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Mozilla 1.0</td>
														<td>Win 95+ / OSX.1+</td>
														<td>1</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Mozilla 1.1</td>
														<td>Win 95+ / OSX.1+</td>
														<td>1.1</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Mozilla 1.2</td>
														<td>Win 95+ / OSX.1+</td>
														<td>1.2</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Mozilla 1.3</td>
														<td>Win 95+ / OSX.1+</td>
														<td>1.3</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Mozilla 1.4</td>
														<td>Win 95+ / OSX.1+</td>
														<td>1.4</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Mozilla 1.5</td>
														<td>Win 95+ / OSX.1+</td>
														<td>1.5</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Mozilla 1.6</td>
														<td>Win 95+ / OSX.1+</td>
														<td>1.6</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Mozilla 1.7</td>
														<td>Win 98+ / OSX.1+</td>
														<td>1.7</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Mozilla 1.8</td>
														<td>Win 98+ / OSX.1+</td>
														<td>1.8</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Seamonkey 1.1</td>
														<td>Win 98+ / OSX.2+</td>
														<td>1.8</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Gecko</td>
														<td>Epiphany 2.20</td>
														<td>Gnome</td>
														<td>1.8</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Webkit</td>
														<td>Safari 1.2</td>
														<td>OSX.3</td>
														<td>125.5</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Webkit</td>
														<td>Safari 1.3</td>
														<td>OSX.3</td>
														<td>312.8</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Webkit</td>
														<td>Safari 2.0</td>
														<td>OSX.4+</td>
														<td>419.3</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Webkit</td>
														<td>Safari 3.0</td>
														<td>OSX.4+</td>
														<td>522.1</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Webkit</td>
														<td>OmniWeb 5.5</td>
														<td>OSX.4+</td>
														<td>420</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Webkit</td>
														<td>iPod Touch / iPhone</td>
														<td>iPod</td>
														<td>420.1</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Webkit</td>
														<td>S60</td>
														<td>S60</td>
														<td>413</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Presto</td>
														<td>Opera 7.0</td>
														<td>Win 95+ / OSX.1+</td>
														<td>-</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Presto</td>
														<td>Opera 7.5</td>
														<td>Win 95+ / OSX.2+</td>
														<td>-</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Presto</td>
														<td>Opera 8.0</td>
														<td>Win 95+ / OSX.2+</td>
														<td>-</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Presto</td>
														<td>Opera 8.5</td>
														<td>Win 95+ / OSX.2+</td>
														<td>-</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Presto</td>
														<td>Opera 9.0</td>
														<td>Win 95+ / OSX.3+</td>
														<td>-</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Presto</td>
														<td>Opera 9.2</td>
														<td>Win 88+ / OSX.3+</td>
														<td>-</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Presto</td>
														<td>Opera 9.5</td>
														<td>Win 88+ / OSX.3+</td>
														<td>-</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Presto</td>
														<td>Opera for Wii</td>
														<td>Wii</td>
														<td>-</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Presto</td>
														<td>Nokia N800</td>
														<td>N800</td>
														<td>-</td>
														<td>A</td>
													</tr>
													<tr>
														<td>Presto</td>
														<td>Nintendo DS browser</td>
														<td>Nintendo DS</td>
														<td>8.5</td>
														<td>C/A<sup>1</sup>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<!-- END EXAMPLE TABLE PORTLET-->
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
			TableAdvanced.init();
			
		});
	</script>

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>