<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
					
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="dashboard-stat2 bordered">
                                <div class="display">
                                    <div class="number">
                                        <h3 class="font-green-sharp">
                                            <span data-counter="counterup" data-value="7800">0</span>
                                            <small class="font-green-sharp">$</small>
                                        </h3>
                                        <small>TOTAL PROFIT</small>
                                    </div>
                                    <div class="icon">
                                        <i class="icon-pie-chart"></i>
                                    </div>
                                </div>
                                <div class="progress-info">
                                    <div class="progress">
                                        <span style="width: 76%;" class="progress-bar progress-bar-success green-sharp">
                                            <span class="sr-only">76% progress</span>
                                        </span>
                                    </div>
                                    <div class="status">
                                        <div class="status-title"> progress </div>
                                        <div class="status-number"> 76% </div>
                                    </div>
                                </div>
                            </div>
                        </div>
				
				
				
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
					
					<div class="col-md-12">
					
					<!-- BEGIN VALIDATION STATES-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>Colaboradores de <b>${proyecto.nombre}</b>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>
                                            #
                                        </th>
                                        <th>
                                            Nombre de Usuario
                                        </th>
                                        <th>
                                            Nombre (s)
                                        </th>
                                        <th>
                                            Apellido Paterno
                                        </th>
                                        <th>
                                            Apellido Materno
                                        </th>
                                        <th>
                                            Correo electrónico
                                        </th>
                                        <th>
                                            Teléfono
                                        </th>
                                        <th>
                                            Asignar Tarea
                                        </th>
                                        
                                        <th>
                                            Eliminar Tareea
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${proyecto.colaboradorProyectos}" var="colaborador" varStatus="loop">
                                        <tr>
                                            <td>
                                            
                                                ${loop.index + 1}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.nombreUsuario}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.nombres}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.aPaterno}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.aMaterno}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.email}
                                            </td>
                                            <td>
                                                ${colaborador.usuario.telefono}
                                            </td>
                                            <td>
                                                <a href="${contexto}proyecto/${proyecto.idProyecto}/asignar-tarea/${colaborador.usuario.idUsuarios}" class="btn default btn-xs purple">
                                                    <i class="fa fa-edit"></i> Asignar </a>
                                            </td>        
                                            <td>        
                                              <a href="${contexto}/proyecto/eliminarColaborador/${proyecto.idProyecto}/${colaborador.usuario.idUsuarios}" onclick="return confirmar()" class="btn default btn-xs black" >
											  <i class="fa fa-trash-o"></i> Delete </a>
                                                    
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    </div>
                    <!-- END VALIDATION STATES-->
					
					
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

		function confirmar(text, tez2)
		{
			return confirm("¿Estas seguro de que deseas quitar a este colaborador de tu proyecto? Al dejar de colaborar con el se perdera la tarea que tiene asiganada")}
		
		
		</script>
		
	 <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-37564768-1', 'keenthemes.com');
  ga('send', 'pageview');
</script>
	

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>