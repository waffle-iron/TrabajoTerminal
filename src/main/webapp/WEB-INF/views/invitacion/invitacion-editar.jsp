<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<meta content="" name="description"/>
	<meta content="" name="author"/>

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
			<!-- END PAGE HEADER-->

			<div class="portlet light portlet-fit bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-social-dribbble font-red"></i>
                                <span class="caption-subject font-red bold ">Invitaciones</span>
                            </div>
                            
                        </div>
                  </div>

			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
<%-- 				<p>${invitaciones == null ? 'No tienes invitaciones' : ''}</p> --%>

				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet light bordered">
						<div class="portlet-title">
							<div class="caption font-dark">
								<i class="icon-settings font-dark"></i>
								<span class="caption-subject bold uppercase"> Aceptar o rechazar invitación </span>
							</div>
							<div class="actions">
<!-- 								<div class="btn-group btn-group-devided" data-toggle="buttons"> -->
<!-- 									<label class="btn btn-transparent dark btn-outline btn-circle btn-sm active"> -->
<!-- 										<input type="radio" name="options" class="toggle" id="option1">Actions</label> -->
<!-- 									<label class="btn btn-transparent dark btn-outline btn-circle btn-sm"> -->
<!-- 										<input type="radio" name="options" class="toggle" id="option2">Settings</label> -->
<!-- 								</div> -->
							</div>
						</div>
						<div class="portlet-body form">
							<c:url value="/invitacion/guardarCambios" var="urlproyectoGuardar"/>

							<form:form action="${urlproyectoGuardar}" method="post" commandName="invitacion"
									   cssClass="form-horizontal">
								<div class="form-body">

									<div class="form-group">
										<label class="control-label col-md-3">Fecha
											<span class="required"> * </span>
										</label>

										<div class="col-md-7">
											<div class="input-icon right">
												<form:hidden path="idInvitacion" />
												<fmt:formatDate value="${fecha}" var="var_fecha" pattern="dd-MM-yyyy" />
												<form:input path="fecha" cssClass="form-control" type="text" value="${var_fecha}" readonly="true"/>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3">Quien te invita
											<span class="required"> * </span>
										</label>

										<div class="col-md-7">
											<div class="input-icon right">
												<form:hidden path="colaboradorProyecto.proyecto.idProyecto"></form:hidden>
												<form:hidden path="colaboradorProyecto.usuario.idUsuarios"></form:hidden>
												<input class="form-control" type="text" readonly value="${invitacion.colaboradorProyecto.usuario.nombres} ${invitacion.colaboradorProyecto.usuario.aPaterno}">
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3">Estado
											<span class="required"> * </span>
										</label>

										<div class="col-md-7">
											<div class="input-icon right">
												<form:select path="estado"  cssClass="form-control"  >
													<form:option value="2">Aceptar</form:option>
													<form:option value="3">Rechazar</form:option>
												</form:select>
											</div>
										</div>
									</div>

								</div>
								<div class="form-actions">
<!-- 									<div class="row"> -->
<!-- 										<div class="col-md-offset-3 col-md-9"> -->
<!-- 											<button type="submit" class="btn green">Actualizar</button> -->
<%-- 											<button type="button" class="btn default" onclick="location.href='${contexto}/mis-invitaciones'">Cancelar</button> --%>
<!-- 										</div> -->
<!-- 									</div> -->
									<div class="row">
											 <div class="profile-userbuttons">
		                                        <button type="submit" class="btn btn-circle red btn-sm">Actualizar</button>
		                                        <button type="button" class="btn btn-circle grey btn-sm" onclick="location.href='${contexto}/mis-invitaciones'">Cancelar</button>
		                                    </div>
													
										</div>
									
								</div>
							</form:form>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
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
	jQuery(document).ready(function () {
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