<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

            <!-- BEGIN PAGE CONTENT-->
            <div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
							
							 <i class="icon-share font-dark"></i>
							 <font size="6px">							 
							 <span class="caption-subject font-red bold uppercase ">Invitar usuario a proyecto</span><br /></font>
							
							
						</div>

					</div>
				</div>
            
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <!-- BEGIN VALIDATION STATES-->
                    <div class="portlet box grey">
                       
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <c:url value="/proyecto/crearInvitacion" var="urlInvitarUsuario"/>

                            <form action="${urlInvitarUsuario}" method="GET"  class="form-horizontal form-row-sepe">
                                <div class="form-body">
                                    <div class="alert ${error == 3 ? "alert-success" : "alert-danger"} ${ error > 0 ? "" : "display-hide"}">
                                        <button class="close" data-close="alert"></button>
                                        <c:choose>
                                            <c:when test="${error == 1}">
                                                El usuario con este correo o nombre de usuario no existe
                                            </c:when>
                                            <c:when test="${error == 2}">
                                                El usuario ya est� como colaborador
                                            </c:when>
                                            <c:when test="${error == 3}">
                                                Se ha enviado una invitaci�n al usuario
                                            </c:when>
                                            <c:when test="${error == 4}">
                                                Los campos son obligatorios
                                            </c:when>
                                        </c:choose>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Correo o nombre de Usuario:
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-7">

                                            <input name="correoUsuario" class="form-control"  required/>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Proyecto:
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-7">

                                            <select name="proyectoId" class="form-control input-large select2me"  data-placeholder="Selecciona un proyecto..." required>
                                                <option value=""></option>
                                                <c:forEach items="${misProyectos}" var="proyecto">
                                                    <option value="${proyecto.idProyecto}" class="form-control">${proyecto.nombre}</option>
                                                </c:forEach>
                                            </select>

                                        </div>
                                    </div>

                                </div>
                                <div class="form-actions">
                              
                                    <div class="row">
											 <div class="profile-userbuttons">
		                                        <button type="submit" class="btn btn-circle red btn-sm">Invitar</button>
		                                        <button type="button" class="btn btn-circle grey btn-sm" onclick="location.href='${contexto}/usuario/perfil'">Cancelar</button>
		                                    </div>
													
										</div>
                                    
                                </div>
                            </form>
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
    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
    });
</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>