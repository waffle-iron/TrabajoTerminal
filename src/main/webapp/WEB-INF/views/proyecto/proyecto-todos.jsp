<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<!-- BEGIN CONTENT BODY -->
			<div class="page-content">
				<!-- BEGIN PAGE HEAD-->
				<div class="page-head">
					<!-- BEGIN PAGE TITLE -->
				
					<!-- END PAGE TITLE -->
					<!-- BEGIN PAGE TOOLBAR -->

					<!-- END PAGE TOOLBAR -->
				</div>
				<!-- END PAGE HEAD-->
				<!-- BEGIN PAGE BREADCRUMB -->
				<!-- END PAGE BREADCRUMB -->
				<!-- BEGIN PAGE BASE CONTENT -->
				<div class="row">
				
					<div class="col-md-9">
						<!-- BEGIN TODO SIDEBAR -->
						<div class="todo-ui">
							<div class="todo-sidebar">
								<div class="portlet light bordered">
									<div class="portlet-title">
										<div class="caption" data-toggle="collapse"
											data-target=".todo-project-list-content">
											<span class="caption-subject font-green-sharp bold uppercase">Mis Proyectos
											</span> <span
												class="caption-helper visible-sm-inline-block visible-xs-inline-block">click
												to view project list</span>
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
													<li><a href="${contexto}/proyecto/crear"> Nuevo
															proyecto </a></li>
													<li class="divider"></li>
<!-- 													<li><a href="javascript:;"> Multidisciplinario <span -->
<%-- 															class="badge badge-success"> ${tamMultid} </span> --%>
<!-- 													</a></li>													 -->
<!-- 													<li><a href="javascript:;"> Programa Especial <span -->
<%-- 															class="badge badge-success"> ${tamProEsp} </span> --%>
<!-- 													</a></li>													 -->
<!-- 													<li><a href="javascript:;"> Propuesta de estudio <span -->
<%-- 															class="badge badge-success"> ${tamProEst} </span> --%>
<!-- 													</a></li>													 -->
<!-- 													<li><a href="javascript:;"> Proyecto individual <span -->
<%-- 															class="badge badge-success"> ${tamProInd} </span> --%>
<!-- 													</a></li>													 -->
<!-- 													<li><a href="javascript:;"> Proyecto de Red <span -->
<%-- 															class="badge badge-success"> ${tamProRed} </span> --%>
<!-- 													</a></li>													 -->
<!-- 													<li><a href="javascript:;"> Proyecto de innovación  -->
<!-- 													<span class="badge badge-success"> -->
<%-- 														${tamProInn}  --%>
<!-- 													</span> -->
<!-- 													</a></li> -->
<!-- 													<li><a href="javascript:;"> Trabajo Terminal  -->
<!-- 													<span class="badge badge-success"> -->
<%-- 														${tamProTT}  --%>
<!-- 													</span> -->
<!-- 													</a></li>																										 -->
<!-- 													<li><a href="javascript:;"> Otros <span -->
<%-- 															class="badge badge-warning"> ${tamProOtros} </span> --%>
<!-- 													</a></li> -->
<!-- 													<li> Total -->
<!-- 													<span class="badge badge-danger"> -->
<%-- 														${totalProyectos}  --%>
<!-- 													</span> -->
<!-- 													</li> -->
												</ul>
											</div>
										</div>
									</div>
									<div class="portlet-body todo-project-list-content">
										<div class="todo-project-list">
											<table>
												<thead>
												</thead>
												<tbody>
													<c:forEach items="${proyectosList}" var="proyecto">

														<tr>
															<td class="highlight" height=40 width=400>
															<a href="${contexto}/proyecto/ver/${proyecto.idProyecto}">
																	${proyecto.nombre} </a>
															</td>
															<td>${proyecto.descripcion}</td>
														</tr>

													</c:forEach>
												</tbody>
											</table>
										</div>
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
											<span class="caption-subject font-green-sharp bold uppercase">Tipos de Proyectos
											</span> <span
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
															<td class="highlight" height=30 >
																<li><a href="javascript:;"> Multidisciplinario 
																
																</a></li>	
															</td>																
															<td>
																<span class="badge badge-success"> ${tamMultid} </span>
															</td>
														</tr>
														<tr>
															<td class="highlight" height=30 >
																<li><a href="javascript:;"> Programa Especial 
																</a></li>		
															</td>
															<td>
																<span class="badge badge-success"> ${tamProEsp} </span>
															</td>
														</tr>
														<tr>
															<td class="highlight" height=30 >
																<li><a href="javascript:;"> Propuesta de estudio 
																</a></li>	
															</td>
															<td>
																<span class="badge badge-success"> ${tamProEst} </span>
															</td>
														</tr>
														<tr>
															<td class="highlight" height=30 >
																<li><a href="javascript:;"> Proyecto individual 
																</a></li>
															</td>
															<td>
																<span class="badge badge-success"> ${tamProInd} </span>
															</td>
														</tr>
														<tr>
															<td class="highlight" height=30 >
																<li><a href="javascript:;"> Proyecto de Red 
																</a></li>	
															</td>
															<td>
																<span class="badge badge-success"> ${tamProRed} </span>
															</td>
														</tr>
														<tr>
															<td class="highlight" height=30 >
																<li><a href="javascript:;"> Proyecto de innovación 																
																</a></li>
															</td>
															<td>
																<span class="badge badge-success"> ${tamProInn} </span>
															</td>
														</tr>
														<tr>
															<td class="highlight" height=30 >
																<li><a href="javascript:;"> Trabajo Terminal																
																</a></li>
															</td>
															<td>
																<span class="badge badge-success"> ${tamProTT} </span>
															</td>
														</tr>
														
														<tr>															
															<td class="highlight" height=30 >
																<li><a href="javascript:;"> Otros 
																</a></li>	
															</td>
															<td>
																<span class="badge badge-warning"> ${tamProOtros} </span>
															</td>
														</tr>
														<tr>
															<td class="highlight" height=30 >
																<li> Total
																</li>	
															</td>																																																																																																																																																																																														<td>
																<span class="badge badge-danger"> ${totalProyectos} </span>
															</td>
																																																																																																																																																																															
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
					<!-- END PAGE CONTENT-->
				</div>
				
				<!-- Tabla..................................................................................................... -->
				<div class="portlet-body">
					<div class="table-scrollable">
						<table
							class="table table-striped table-bordered table-advance table-hover">
							<thead>
								<tr>
									<th><i class="fa fa-bars"></i> <span
										class="caption-subject">
											Proyecto</span></th>
									<th class="hidden-xs"><i class="fa fa-edit"></i> <span
										class="caption-subject">
											Acciones</span></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${proyectosList}" var="proyecto">

									<tr>
										<!-- 									<td class="highlight"> -->
										<!-- 										<div class="success"> -->
										<!-- 										</div> -->
										<!-- 										<a href="javascript:;"> -->
										<%-- 										${proyecto.idProyecto} </a> --%>
										<!-- 									</td> -->
										<td class="highlight">
											<div class="success"></div>&nbsp; ${proyecto.nombre}
										</td>
										<td><a
											href="${contexto}proyecto/reporte/${proyecto.idProyecto}"
											class="btn default btn-xs grey"> <i class="fa fa-edit"></i>
												Ver
										</a></td>
										<td><a
											href="${contexto}proyecto/${proyecto.idProyecto}/editar"
											class="btn default btn-xs grey"> <i class="fa fa-edit"></i>
												Edit
										</a></td>
										<td><a
											href="${contexto}proyecto/eliminar/${proyecto.idProyecto}"
											class="btn default btn-xs black"> <i
												class="fa fa-trash-o"></i> Delete
										</a></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>


				<!-- END PAGE BASE CONTENT -->
			</div>
			<!-- END CONTENT BODY -->
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