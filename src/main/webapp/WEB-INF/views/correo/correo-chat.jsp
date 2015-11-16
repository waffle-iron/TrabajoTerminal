<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
            <jsp:include page="../recursos/breadcrumbs.jsp"></jsp:include>
            <!-- END PAGE HEADER-->

            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet light bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-bubble font-red-sunglo"></i>
                                <span class="caption-subject font-red-sunglo bold uppercase">Chat con:  <b>${receptor}</b></span>
                            </div>
                            <div class="actions">
                                <div class="portlet-input input-inline">
                                    <div class="input-icon right">
                                        <i class="icon-magnifier"></i>
                                        <input type="text" class="form-control input-circle" placeholder="search...">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="portlet-body" id="chats">
                            <div class="scroller" style="height: 525px;" data-always-visible="1" data-rail-visible1="1">
                                <ul class="chats">
                                    <c:forEach items="${chat}" var="mensaje">
                                        <li class="${mensaje.usuarioEmisor.email == principal ? 'out':'in'}">
                                            <img class="avatar" alt=""
                                                 src="${contexto}/resources/tema/assets/admin/layout/img/avatar${mensaje.usuarioEmisor.email == principal ? '1':'2'}.jpg"/>

                                            <div class="message">
                                                <span class="arrow"> </span>
                                                <a href="javascript:;" class="name">
                                                ${(mensaje.usuarioEmisor.email == principal) || (mensaje.usuarioReceptor.email == principal) ?
                                                 mensaje.usuarioEmisor.nombres :
                                                 mensaje.usuarioReceptor.nombres}
                                                </a>
                                                <span class="datetime"> at ${mensaje.fechaHora} </span>
                                                <span class="body">${mensaje.contenido}</span>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="chat-form">

                                <c:url value="/correo/crear" var="urlCorreoGuardar"/>
                                <form:form action="${urlCorreoGuardar}" method="post" commandName="correo">
                                    <div class="input-cont">

                                        <form:input path="asunto" cssClass="form-control" placeholder="Type a asunto here..."/>
                                        <form:errors path="asunto" element="span" cssClass="help-block text-danger"/>
                                    </div>
                                    <div class="input-cont">
                                        <form:input path="contenido" cssClass="form-control" placeholder="Type a message here..."/>
                                        <form:errors path="contenido" element="span" cssClass="help-block text-danger"/>
                                        <form:hidden path="usuarioEmisor.idUsuarios" value="${idEmisor}"></form:hidden>
                                        <form:hidden path="usuarioReceptor.idUsuarios" value="${idReceptor}"></form:hidden>
                                    </div>
                                    <div class="btn-cont">
                                        <span class="arrow"> </span>
                                        <button type="submit" class="btn blue icn-only"><i class="fa fa-check icon-white"></i></button>
                                    </div>
                                </form:form>
                            </div>

                        </div>
                    </div>
                    <!-- END PORTLET-->

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