<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
					<div class="col-md-8 col-md-offset-2">
						<!-- BEGIN VALIDATION STATES-->
						<div class="portlet box blue">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-gift"></i>Actualizar Tarea a: <b>${colaborador}</b>
								</div>
							</div>
							<div class="portlet-body form">
								<div class="alert ${creado ? "alert-success" : "alert-danger"} ${ creado ? "" : "display-hide"}">
									<button class="close" data-close="alert"></button>
									<c:choose>
										<c:when test="${creado}">
                                        Se ha enviado generado la tarea al usuario.
                                    </c:when>
										<c:when test="${!creado}">
                                        Hubo errores, por favor verifica.
                                    </c:when>
									</c:choose>
								</div>
								<!-- BEGIN FORM-->
								<c:url value="/tarea/guardarCambios" var="urlTareaUpdate" />

								<form:form action="${urlTareaUpdate}" method="post"
									commandName="tarea" cssClass="form-horizontal">
									<div class="form-body">

										<div class="form-group">
											<label class="control-label col-md-3">Título <span
												class="required"> * </span>
											</label>

											<div class="col-md-7">
												<div class="input-icon right">
													<form:input path="titulo" cssClass="form-control" />
													<form:errors path="titulo" element="span"
														cssClass="help-block text-danger" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3">Estado <span
												class="required"> * </span>
											</label>

											<div class="col-md-7">
												<div class="input-icon right">
													<form:input path="estado" cssClass="form-control"  />
													<form:errors path="estado" element="span"
														cssClass="help-block text-danger" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3">Descripcón de
												la tarea <span class="required"> * </span>
											</label>

											<div class="col-md-7">
												<div class="input-icon right">
													<form:textarea path="descripcion" cssClass="form-control" />
													<form:errors path="descripcion" element="span"
														cssClass="help-block text-danger" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3">Avance <span
												class="required"> * </span>
											</label>

											<div class="col-md-7">
												<div class="input-icon right">
													<form:input path="avance" cssClass="form-control" />
													<form:errors path="*" element="span"
														cssClass="help-block text-danger" />
												</div>
											</div>
										</div>
										<fmt:formatDate value="${fechaEntrega}" var="var_fechaEntrega"
											pattern="yyyy-MM-dd" />
										<form:hidden path="fechaEntrega" value="${var_fechaEntrega}" />
										<form:hidden path="idTarea"></form:hidden>
										<form:hidden path="colaboradorProyecto.proyecto.idProyecto"></form:hidden>
										<form:hidden path="colaboradorProyecto.usuario.idUsuarios"></form:hidden>
									</div>
									<div class="form-actions">
										<div class="row">
											<div class="col-md-offset-3 col-md-9">
												<button type="submit" class="btn green">Actualizar</button>
											</div>
										</div>
									</div>
								</form:form>
							</div>
						</div>
						<!-- END VALIDATION STATES-->
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