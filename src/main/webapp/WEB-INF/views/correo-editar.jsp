<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <!-- BEGIN VALIDATION STATES-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>Editar Correo
                            </div>

                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <c:url value="/escuela/guardarCambios" var="urlEscuelaGuardar"/>

                            <form:form action="${urlEscuelaGuardar}" method="post" commandName="escuela"
                                       cssClass="form-horizontal">
                                <div class="form-body">
                                    <form:hidden path="id" />

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Asunto
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-4">
                                            <div class="input-icon right">
                                                <form:input path="asunto" cssClass="form-control"/>
                                                <form:errors path="asunto" element="span"
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
                                    
                                    
                                    <div class="form-group">
                                        <label class="control-label col-md-3">usuarioReceptorList
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-4">
                                            <div class="input-icon right">
                                                <form:select path="usuarioReceptorList.idUsuario" cssClass="form-control">
                                                    <form:options items="${usuarioReceptorList}" itemValue="idUsuarios"
                                                                  itemLabel="nombreUsuario"/>
                                                </form:select>
                                                <form:errors path="usuarioReceptorList" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Emisor
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-4">
                                            <div class="input-icon right">
                                                <form:select path="usuarioEmisorList.idUsuarios" cssClass="form-control">
                                                    <form:options items="${usuarioEmisorList}" itemValue="idUsuarios"
                                                                  itemLabel="nombreUsuario"/>
                                                </form:select>
                                                <form:errors path="usuarioEmisorList" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-md-9">
                                            <button type="submit" class="btn green">Guardar cambios</button>
                                            <button type="button" class="btn default">Cancelar</button>
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
<jsp:include page="recursos/footer.jsp"></jsp:include>
<!-- END FOOTER -->

<!-- BEGIN JS -->
<jsp:include page="recursos/recursos-js.jsp"></jsp:include>
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
