<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contexto" value="${pageContext.request.contextPath}"/>

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
				<div class="portlet light portlet-fit bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-social-dribbble font-red"></i>
                                <span class="caption-subject font-red bold ">Información del correo</span>
                            </div>
                            
                        </div>
                  </div>
				
				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->
				<div class="row">
					<c:if test="${actualizado}">
						<h1 class="text-success"><strong>Datos actualizados</strong></h1>
					</c:if>
					<c:if test="${creado}">
                        <h1 class="text-success"><strong>Se ha creado un nuevo correo</strong></h1>
					</c:if>
					<div class="col-md-8 col-md-offset-2">
						<div class="portlet grey box">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-cogs"></i>Información del correo
								</div>
								<div class="actions">
<%-- 									<a href="${contexto}correo/${correo.idCorreo}/editar" class="btn btn-default btn-sm"> --%>
<!-- 										<i class="fa fa-pencil"></i> Editar </a> -->
									<a href="${contexto}correo/eliminar/${correo.idCorreo}/" class="btn btn-default btn-sm">
										<i class="fa fa-pencil"></i> Eliminar </a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="row static-info">
									<div class="col-md-5 name">
										Asunto
									</div>
									<div class="col-md-7 value">
										${correo.asunto}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Contenido
									</div>
									<div class="col-md-7 value">
										${correo.contenido}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Emisor
									</div>
									<div class="col-md-7 value">
										${correo.usuarioEmisor.nombreUsuario}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Receptor
									</div>
									<div class="col-md-7 value">
										${correo.usuarioReceptor.nombreUsuario}
									</div>
								</div>
							</div>
						</div>
						<div class="row">
											 <div class="profile-userbuttons">
		                                        <button type="button" class="btn btn-circle grey btn-sm" onclick="location.href='${contexto}/correo'">Regresar</button>
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