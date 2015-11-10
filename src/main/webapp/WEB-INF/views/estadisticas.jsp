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

				<!-- BEGIN SUPERIOR -->




				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<div class="dashboard-stat blue">
							<div class="visual">
								<i class="fa fa-comments"></i>
							</div>
							<div class="details">
								<div class="number">
									<span data-counter="counterup">${totalProy}</span>
								</div>
								<div class="desc">Total de proyectos</div>
							</div>
							<a class="more" href="javascript:;"> View more <i
								class="m-icon-swapright m-icon-white"></i>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<div class="dashboard-stat green">
							<div class="visual">
								<i class="fa fa-shopping-cart"></i>
							</div>
							<div class="details">
								<div class="number">
									<span data-counter="counterup">
										${totalProyectosPorGradoMedSup}</span>
								</div>
								<div class="desc">Proyectos registrados en nivel medio
									superior</div>
							</div>
							<a class="more" href="javascript:;"> View more <i
								class="m-icon-swapright m-icon-white"></i>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<div class="dashboard-stat purple">
							<div class="visual">
								<i class="fa fa-globe"></i>
							</div>
							<div class="details">
								<div class="number">
									+ <span data-counter="counterup"></span>
									${totalProyectosPorGradoSup}
								</div>
								<div class="desc">Proyectos registrados en nivel superior</div>
							</div>
							<a class="more" href="javascript:;"> View more <i
								class="m-icon-swapright m-icon-white"></i>
							</a>
						</div>
					</div>

				</div>
				<!-- END SUPERIOR -->

				<div class="row">
					<!-- BEGIN PAGE CONTENT-->
					<div class="col-md-8">
						<!-- BEGIN TODO SIDEBAR -->
						<div class="todo-ui">
							<div class="todo-sidebar">
								<div class="portlet light bordered">
									<div class="portlet-title">
										<div class="caption" data-toggle="collapse"
											data-target=".todo-project-list-content">
											<div class="blog-single-head">
												<h1 class="blog-single-head-title">Proyectos
													registrados en el sistema</h1>
											</div>
										</div>
										<div class="actions">
											<div class="btn-group">
												<a
													class="btn green btn-circle btn-outline btn-sm todo-projects-config"
													href="javascript:;" data-toggle="dropdown"
													data-hover="dropdown" data-close-others="true"> <i
													class="icon-settings"></i> &nbsp; <i
													class="fa fa-angle-down"></i>
												</a>
												<ul class="dropdown-menu pull-right">
													<li><a href=""> Ver </a></li>
													<li class="divider"></li>
												</ul>
											</div>
										</div>


										<div>
											<input type="hidden" id="mult" value="${TamlistProyMult}">
											<input type="hidden" id="prog" value="${TamlistProyProg}">
											<input type="hidden" id="prop" value="${TamlistProyProp}">
											<input type="hidden" id="indi" value="${TamlistProyInd}">
											<input type="hidden" id="red" value="${TamlistProyRed}">
											<input type="hidden" id="inno" value="${TamlistProyInv}">
											<input type="hidden" id="TT" value="${TamlistProyTT}">
										</div>

										<!-- BEGIN BASIC CHART PORTLET-->
										<div style="width: 80%">
											<canvas id="canvas" height="650" width="800"></canvas>
										</div>
										<!--  Aqui comienza el script  -->

									</div>
								</div>

							</div>
							<!-- END TODO SIDEBAR -->

						</div>
					</div>
					<div class="col-md-4">
						<!-- BEGIN TODO SIDEBAR -->
						<div class="todo-ui">
							<div class="todo-sidebar">
								<div class="portlet light bordered">
									<div class="portlet-title">
										<div class="caption" data-toggle="collapse"
											data-target=".todo-project-list-content">
											<span class="caption-subject font-green-sharp bold uppercase">Tipos
												de Proyectos </span> <span
												class="caption-helper visible-sm-inline-block visible-xs-inline-block">click
												to view project list</span>
										</div>

									</div>
									<div class="portlet-body todo-project-list-content">
										<div class="todo-project-list">
											<table>
												<thead>
												</thead>
												<tbody>


													<tr>
														<td class="highlight" height=30>
															<li><a href="javascript:;"> Multidisciplinario </a></li>
														</td>
														<td><span class="badge badge-success">
																${TamlistProyMult} </span></td>
														<td></td>
													</tr>
													<tr>
														<td class="highlight" height=30>
															<li><a href="javascript:;"> Programa Especial </a></li>
														</td>
														<td><span class="badge badge-success">
																${TamlistProyProg} </span></td>
													</tr>
													<tr>
														<td class="highlight" height=30>
															<li><a href="javascript:;"> Propuesta de estudio
															</a></li>
														</td>
														<td><span class="badge badge-success">
																${TamlistProyProp} </span></td>
													</tr>
													<tr>
														<td class="highlight" height=30>
															<li><a href="javascript:;"> Proyecto individual
															</a></li>
														</td>
														<td><span class="badge badge-success">
																${TamlistProyInd} </span></td>
													</tr>
													<tr>
														<td class="highlight" height=30>
															<li><a href="javascript:;"> Proyecto de Red </a></li>
														</td>
														<td><span class="badge badge-success">
																${TamlistProyRed} </span></td>
													</tr>
													<tr>
														<td class="highlight" height=30>
															<li><a href="javascript:;"> Proyecto de
																	innovación </a></li>
														</td>
														<td><span class="badge badge-success">
																${TamlistProyInv} </span></td>
													</tr>
													<tr>
														<td class="highlight" height=30>
															<li><a href="javascript:;"> Trabajo Terminal </a></li>
														</td>
														<td><span class="badge badge-success">
																${TamlistProyTT} </span></td>
													</tr>
													<tr>
														<td class="highlight" height=30>
															<li>Total</li>
														</td>
														<td><span class="badge badge-danger">
																${totalProy} </span></td>

													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>

							</div>
							<!-- END TODO SIDEBAR -->

						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<div class="dashboard-stat red">
							<div class="visual">
								<i class="fa fa-bar-chart-o"></i>
							</div>
							<div class="details">
								<div class="number">
									<span data-counter="counterup">${totalUsuarios}</span>
								</div>
								<div class="desc">Usuarios</div>
							</div>
							<a class="more" href="javascript:;"> View more <i
								class="m-icon-swapright m-icon-white"></i>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<div class="dashboard-stat green">
							<div class="visual">
								<i class="fa fa-shopping-cart"></i>
							</div>
							<div class="details">
								<div class="number">
									<i class="icon-users"><span data-counter="counterup">
											${totalUsuGrado1}</span></i>
								</div>
								<div class="desc">Usuarios nivel medio superior</div>
							</div>
							<a class="more" href="javascript:;"> View more <i
								class="m-icon-swapright m-icon-white"></i>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<div class="dashboard-stat purple">
							<div class="visual">
								<i class="fa fa-globe"></i>
							</div>
							<div class="details">
								<div class="number">
									<span data-counter="counterup"></span><i class="icon-users">
										${totalUsuGrado2} </i>
								</div>
								<div class="desc">Usuarios nivel superior</div>
							</div>
							<a class="more" href="javascript:;"> View more <i
								class="m-icon-swapright m-icon-white"></i>
							</a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
						<div class="dashboard-stat yellow">
							<div class="visual">
								<i class="fa fa-globe"></i>
							</div>
							<div class="details">
								<div class="number">
									<span data-counter="counterup"></span><i class="icon-users">
										${totalUsuGrado3} </i>
								</div>
								<div class="desc">Posgrado</div>
							</div>
							<a class="more" href="javascript:;"> View more <i
								class="m-icon-swapright m-icon-white"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- BEGIN PAGE CONTENT-->
					<div class="col-md-10">
						<!-- BEGIN TODO SIDEBAR -->
						<div class="todo-ui">
							<div class="todo-sidebar">
								<div class="portlet light bordered">
									<div class="portlet-title">
										<div class="caption" data-toggle="collapse"
											data-target=".todo-project-list-content">
											<div class="blog-single-head">
												<h1 class="blog-single-head-title">Usuarios por
													escuelas</h1>
											</div>
										</div>
										<div class="actions">
											<div class="btn-group">
												<a
													class="btn green btn-circle btn-outline btn-sm todo-projects-config"
													href="javascript:;" data-toggle="dropdown"
													data-hover="dropdown" data-close-others="true"> <i
													class="icon-settings"></i> &nbsp; <i
													class="fa fa-angle-down"></i>
												</a>
												<ul class="dropdown-menu pull-right">
													<li><a href=""> Ver </a></li>
													<li class="divider"></li>
												</ul>
											</div>
										</div>


										<div>
											<input type="hidden" id="totalUsuGrado1" value="${totalUsuGrado1}">
											<input type="hidden" id="totalUsuGrado2" value="${totalUsuGrado2}">
											<input type="hidden" id="totalUsuGrado3" value="${totalUsuGrado3}">
										</div>

										<!-- BEGIN BASIC CHART PORTLET-->

										<div style="width: 80%">
											<canvas id="chart-area" width="550" height="550"/>
										</div>


									</div>
								</div>

							</div>
							<!-- END TODO SIDEBAR -->

						</div>
					</div>
				</div>








						<!-- END PAGE CONTENT-->
						<!-- END CONTENT -->
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
								PrograGraficas.init();
							});
						</script>

						<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>