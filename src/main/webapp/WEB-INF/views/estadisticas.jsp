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
				<div class="col-md-9">
					<!-- BEGIN TODO SIDEBAR -->
					<div class="todo-ui">
						<div class="todo-sidebar">
							<div class="portlet light bordered">
								<div class="portlet-title">
									<div class="caption" data-toggle="collapse"
										data-target=".todo-project-list-content">
										<div class="blog-single-head">
											<h1 class="blog-single-head-title">Proyectos registrados
												en el sistema</h1>
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

									<script>
										var mult = document.getElementById("mult").value;
										var prog = document.getElementById("prog").value;
										var prop = document.getElementById("prop").value;
										var indi = document.getElementById("indi").value;
										var red = document.getElementById("red").value;
										var inno = document.getElementById("inno").value;
										var TT = document.getElementById("TT").value;
										
										
										var randomScalingFactor = function() {
											return Math
													.round(Math.random() * 100)
										};

										var barChartData = {
											labels : [ "Multidisciplinario", "Programa Especial",
													"Propuesta de Estudio", "Proyecto individual", "Proyecto de red",
													"Proyecto de innovación", "Trabajo terminal" ],
											datasets : [
													{
														fillColor : "rgba(220,220,220,0.5)",
														strokeColor : "rgba(220,220,220,0.8)",
														highlightFill : "rgba(220,220,220,0.75)",
														highlightStroke : "rgba(220,220,220,1)",
														data : [
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor(),
																randomScalingFactor() ]
													},
													{
														fillColor : "rgba(151,187,205,0.5)",
														strokeColor : "rgba(151,187,205,0.8)",
														highlightFill : "rgba(151,187,205,0.75)",
														highlightStroke : "rgba(151,187,205,1)",
														data : [
																mult,
																prog,
																prop,
																indi,
																red,
																inno,
																TT 
																 ]
													} ]

										}
										window.onload = function() {
											var ctx = document.getElementById(
													"canvas").getContext("2d");
											window.myBar = new Chart(ctx).Bar(
													barChartData, {
														responsive : true
													});
										}
									</script>

								</div>
							</div>

						</div>
						<!-- END TODO SIDEBAR -->

					</div>
				</div>
				<div class="col-md-3">
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
														<li><a href="javascript:;"> Proyecto individual </a></li>
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

												<!-- 														<tr>															 -->
												<!-- 															<td class="highlight" height=30 > -->
												<!-- 																<li><a href="javascript:;"> Otros  -->
												<!-- 																</a></li>	 -->
												<!-- 															</td> -->
												<!-- 															<td> -->
												<%-- 																<span class="badge badge-warning"> ${tamProOtros} </span> --%>
												<!-- 															</td> -->
												<!-- 														</tr> -->
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
			ChartsFlotcharts.init();

		});
	</script>

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>