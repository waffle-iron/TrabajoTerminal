<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
							
							 <i class="icon-share font-dark"></i>
							 <font size="6px">							 
							 <span class="caption-subject font-red bold uppercase ">Crear mensaje</span><br /></font>
							
							
						</div>

					</div>
				</div>

                  
                  
            
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <!-- BEGIN VALIDATION STATES-->
                    <div class="portlet box grey">
                        <div class="portlet-title">
                            <div class="caption">
                                Registrar un correo
                            </div>
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <c:url value="/correo/crear" var="urlCorreoGuardar"/>

                            <form:form action="${urlCorreoGuardar}" method="post" commandName="correo"
                                       cssClass="form-horizontal">
                                <div class="form-body">

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Asunto
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-4">
                                            <div class="input-icon right">
                                                <form:input path="Asunto" cssClass="form-control"/>
                                                <form:errors path="Asunto" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Contenido
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-4">
                                            <div class="input-icon right">
                                                <form:input path="contenido" cssClass="form-control"/>
                                                <form:errors path="contenido" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>
<!--                                     <div class="form-group"> -->
<!--                                         <label class="control-label col-md-3">Emisor -->
<!--                                             <span class="required"> * </span> -->
<!--                                         </label> -->

<!--                                         <div class="col-md-4"> -->
<!--                                             <div class="input-icon right"> -->
<%--                                                 <form:select path="usuarioEmisor.idUsuarios" cssClass="form-control"> --%>
<%--                                                     <form:option value="" label="Selecciona una opci�n"/> --%>
<%--                                                     <form:options items="${usuarioEmisorList}" itemValue="idUsuarios" --%>
<%--                                                                   itemLabel="nombreUsuario"/> --%>
<%--                                                 </form:select> --%>
<%--                                                 <form:errors path="usuarioEmisor" element="span" --%>
<%--                                                              cssClass="help-block text-danger"/> --%>
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
 									<div class="form-group" >
<!--                                         <label class="control-label col-md-3">Emisor -->
<!--                                             <span class="required"> * </span> -->
<!--                                         </label> -->
                                        <div class="col-md-7">
                                            <div class="input-icon right">
                                                <form:input path="usuarioEmisor"  value="${nombre2}" type="hidden"/>
                                                <form:errors path="usuarioEmisor" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>						
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Receptor
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-4">
                                            <div class="input-icon right">
                                                <form:select path="usuarioReceptor.idUsuarios" cssClass="form-control">
                                                    <form:option value="-" label="Selecciona una opci�n"/>
                                                    <form:options items="${usuarioReceptorList}" itemValue="idUsuarios"
                                                                  itemLabel="nombreUsuario"/>
                                                </form:select>
                                                <form:errors path="usuarioReceptor" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-actions">
                                 
                                    <div class="row">
											 <div class="profile-userbuttons">
		                                        <button type="submit" class="btn btn-circle red btn-sm">Crear</button>
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