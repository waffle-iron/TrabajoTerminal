<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<!-- BEGIN VALIDATION STATES-->
						<div class="portlet box grey">
							<div class="portlet-title">
								<div class="caption">
									Editar Perfil
								</div>

							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<c:url value="/usuario/guardarCambios" var="urlUsuarioGuardar" />

								<form:form action="${urlUsuarioGuardar}" method="post"
									commandName="usuario" cssClass="form-horizontal">
									<div class="form-body">
										<form:hidden path="idUsuarios" />
										<form:hidden path="nombreUsuario" />
										<form:hidden path="email" />
										<form:hidden path="Evaluacion" />
										
										


										<!--                                     <div class="form-group"> -->
										<!--                                         <label class="control-label col-md-3">Nombre: -->
										<!--                                             <span class="required"> * </span> -->
										<!--                                         </label> -->

										<!--                                         <div class="col-md-4"> -->
										<!--                                             <div class="input-icon right"> -->
										<%--                                                 <form:input path="nombreUsuario" cssClass="form-control"/> --%>
										<%--                                                 <form:errors path="nombreUsuario" element="span" --%>
										<%--                                                              cssClass="help-block text-danger"/> --%>
										<!--                                             </div> -->
										<!--                                         </div> -->
										<!--                                     </div> -->
										<div class="form-group">
											<label class="control-label col-md-3">Nombre(s): <span
												class="required"> * </span>
											</label>

											<div class="col-md-4">
												<div class="input-icon right">
													<form:input path="nombres" cssClass="form-control" />
													<form:errors path="nombres" element="span"
														cssClass="help-block text-danger" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3">Apellido
												paterno: <span class="required"> * </span>
											</label>

											<div class="col-md-4">
												<div class="input-icon right">
													<form:input path="aPaterno" cssClass="form-control" />
													<form:errors path="aPaterno" element="span"
														cssClass="help-block text-danger" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3">Apellido
												materno: <span class="required"> * </span>
											</label>

											<div class="col-md-4">
												<div class="input-icon right">
													<form:input path="aMaterno" cssClass="form-control" />
													<form:errors path="aMaterno" element="span"
														cssClass="help-block text-danger" />
												</div>
											</div>
										</div>
										<!--                                     <div class="form-group"> -->
										<!--                                         <label class="control-label col-md-3">Email -->
										<!--                                             <span class="required"> * </span> -->
										<!--                                         </label> -->

										<!--                                         <div class="col-md-4"> -->
										<!--                                             <div class="input-icon right"> -->
										<%--                                                 <form:input path="email" cssClass="form-control"/> --%>
										<%--                                                 <form:errors path="email" element="span" --%>
										<%--                                                              cssClass="help-block text-danger"/> --%>
										<!--                                             </div> -->
										<!--                                         </div> -->
										<!--                                     </div> -->
										
										
										<div class="form-group">
											<label class="control-label col-md-3">Teléfono: <span
												class="required"> * </span>
											</label>

											<div class="col-md-4">
												<div class="input-icon right">
													<form:input path="telefono" cssClass="form-control" />
													<form:errors path="telefono" element="span"
														cssClass="help-block text-danger" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3">Sexo: <span
												class="required"> * </span>
											</label>

											<div class="col-md-4">
												<div class="input-icon right">
												
												
												 
												
												
												
													<div class="form-group">
                                                                    
                                                                    <div class="input-group">
                                                                        <div class="icheck-inline">
                                                                        
                                                                        <form:radiobutton path="sexo" name="radio1"  value="Masculino"/> Masculino 
																		<form:radiobutton path="sexo" name="radio1"  value="Femenino"/> Femenino
                                                                            
                                                                            </div>
                                                                    </div>
                                                                </div>
																																							
												<form:errors path="sexo" element="span"
													cssClass="help-block text-danger"/>
												
												
												
													
											
												
												
												</div>
											</div>
										</div>
										
										
										<div class="form-group">
											<label class="control-label col-md-3">Estado civil: <span
												class="required"> * </span>
											</label>

											<div class="col-md-4">
												<div class="input-icon right">
												
													<div class="form-group">
                                                                    
                                                                    <div class="input-group">
                                                                        <form:radiobutton path="estadoCivil" name="radio2"  value="Soltero"/> Soltero 
																		<form:radiobutton path="estadoCivil" name="radio2"  value="Casado"/> Casado
                                                                    </div>
                                                                </div>
												<form:errors path="estadoCivil" element="span"
													cssClass="help-block text-danger"/>
												
												
												
													
											
												
												</div>
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-3">Fecha de
												nacimiento: <span class="required"> * </span>
											</label>

											<div class="col-md-4">
												<div class="input-icon right">
													<fmt:formatDate value="${usuario.fechaNacimiento}" var="fecha_nacimiento" pattern="yyyy-MM-dd" />
													<form:input path="fechaNacimiento" cssClass="form-control" type="date" value="${fecha_nacimiento}"/>
													<form:errors path="fechaNacimiento" element="span"
														cssClass="help-block text-danger" />
														<div style="color:#C00;">${mensajeFechas}</div>
												</div>
											</div>
										</div>

										



										<div class="form-group">
											<label class="control-label col-md-3">Fecha ingreso
												al IPN: <span class="required"> * </span>
											</label>

											<div class="col-md-4">
												<div class="input-icon right">
													<fmt:formatDate value="${usuario.fechaIngresoIPN}" var="fecha_ingreso" pattern="yyyy-MM-dd" />
													<form:input path="fechaIngresoIPN" cssClass="form-control" type="date" value="${fecha_ingreso}"/>
													<form:errors path="fechaIngresoIPN" element="span"
														cssClass="help-block text-danger" />
														<div style="color:#C00;">${mensajeFechasIngreso}</div>
												</div>
											</div>
										</div>
										<!--                                     <div class="form-group"> -->
										<!--                                         <label class="control-label col-md-3">Calificación: -->
										<!--                                             <span class="required"> * </span> -->
										<!--                                         </label> -->

										<!--                                         <div class="col-md-4"> -->
										<!--                                             <div class="input-icon right"> -->
										<%--                                                 <form:input path="Evaluacion" cssClass="form-control"/> --%>
										<%--                                                 <form:errors path="Evaluacion" element="span" --%>
										<%--                                                              cssClass="help-block text-danger"/> --%>
										<!--                                             </div> -->
										<!--                                         </div> -->
										<!--                                     </div> -->

										<div class="form-group">
											<label class="control-label col-md-3">Grado: <span
												class="required"> * </span>
											</label>

											<div class="col-md-4">
												<div class="input-icon right">
													<form:select path="grado.idGrado" cssClass="form-control">
														<form:options items="${gradoList}" itemValue="idGrado"
															itemLabel="nombre" />
													</form:select>
													<form:errors path="grado" element="span"
														cssClass="help-block text-danger" />
												</div>
											</div>
										</div>


										<div class="form-group">
											<label class="control-label col-md-3">Escuela: <span
												class="required"> * </span>
											</label>

											<div class="col-md-4">
												<div class="input-icon right">
													<form:select path="escuela.id" cssClass="form-control">
														<form:options items="${escuelaList}" itemValue="id"
															itemLabel="nombre" />
													</form:select>
													<form:errors path="escuela" element="span"
														cssClass="help-block text-danger" />
												</div>
											</div>
										</div>
										
										

										<!--                                     Contraseña -->
										<!-- 									<div class="form-group"> -->
										<!--                                         <label class="control-label col-md-3">Contraseña -->
										<!--                                             <span class="required"> * </span> -->
										<!--                                         </label> -->

										<!--                                         <div class="col-md-4"> -->
										<!--                                             <div class="input-icon right"> -->
										<form:hidden path="password" />
										<%--                                                 <form:input path="password" cssClass="form-control"/> --%>
										<%--                                                 <form:errors path="password" element="span" cssClass="help-block text-danger"/> --%>
										<!--                                             </div> -->
										<!--                                         </div> -->
										<!--                                     </div> -->



									</div>
									<div class="form-actions">
										
										<div class="row">
											 <div class="profile-userbuttons">
		                                        <button type="submit" class="btn btn-circle red btn-sm">Guardar</button>
		                                        <button type="button" class="btn btn-circle grey btn-sm" onclick="location.href='${contexto}/usuario/perfil'">Cancelar</button>
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
