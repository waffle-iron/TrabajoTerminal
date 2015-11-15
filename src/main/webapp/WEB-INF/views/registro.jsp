<%@taglib prefix="form"     uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c"        uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring"   uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fmt"      uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contexto" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>Metronic | Login Options - Login Form 4</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/global/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/global/plugins/simple-line-icons/simple-line-icons.min.css"
          rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/global/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/global/plugins/uniform/css/uniform.default.css"
          rel="stylesheet"
          type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${pageContext.request.contextPath}/resources/global/plugins/select2/select2.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/tema/assets/admin/pages/css/login-soft.css"
          rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->
    <link href="${pageContext.request.contextPath}/resources/tema/assets/global/css/components-md.css"
          id="style_components" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/tema/assets/global/css/plugins-md.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/tema/assets/admin/layout/css/layout.css" rel="stylesheet"
          type="text/css"/>
    <link id="style_color"
          href="${pageContext.request.contextPath}/resources/tema/assets/admin/layout/css/themes/default.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/tema/assets/admin/layout/css/custom.css" rel="stylesheet"
          type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-md login">
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="index.html">
        <img src="${pageContext.request.contextPath}/resources/tema/assets/admin/layout4/img/logo-big.png" alt=""/>
    </a>
</div>
<!-- END LOGO -->
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGIN -->
<div class="content">

    <!-- BEGIN REGISTRATION FORM -->
    <c:url value="/usuario/crear" var="urlUsuarioGuardar"/>
    <form:form action="${urlUsuarioGuardar}" method="post" commandName="usuario" cssClass="form-horizontal">
        <h3>Registro</h3>

        <p>
            Ingresa tus datos:
        </p>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Usuario</label>
            <div class="input-icon">
                <i class="fa fa-font"></i>
                <form:input path="nombreUsuario" cssClass="form-control placeholder-no-fix"  placeholder="Usuario" />
                <form:errors path="nombreUsuario" element="span" cssClass="help-block text-danger" />
            </div>
        </div>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Nombre )</label>
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <form:input path="nombres" cssClass="form-control placeholder-no-fix"  placeholder="Nombre (s)" />
                <form:errors path="nombres" element="span" cssClass="help-block text-danger" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Apellido Paterno</label>
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <form:input path="aPaterno" cssClass="form-control placeholder-no-fix"  placeholder="Apellido Paterno" />
                <form:errors path="aPaterno" element="span" cssClass="help-block text-danger" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Apellido Materno</label>
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <form:input path="aMaterno" cssClass="form-control placeholder-no-fix"  placeholder="Apellido Materno" />
                <form:errors path="aMaterno" element="span" cssClass="help-block text-danger" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">E-mail</label>
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <form:input path="email" cssClass="form-control placeholder-no-fix"  placeholder="Correo" />
                <form:errors path="email" element="span" cssClass="help-block text-danger" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Teléfono</label>
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <form:input path="telefono" cssClass="form-control placeholder-no-fix" type="tel" placeholder="Teléfono" />
                <form:errors path="telefono" element="span" cssClass="help-block text-danger" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Fecha de nacimiento</label>
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <form:input path="fechaNacimiento" cssClass="form-control placeholder-no-fix" type="date"/>
                <form:errors path="fechaNacimiento" element="span" cssClass="help-block text-danger" />
                <div style="color:#C00;">${mensajeFechas}</div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Fecha de ingreso al IPN</label>
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <form:input path="fechaIngresoIPN" cssClass="form-control placeholder-no-fix" type="date"  />
                <form:errors path="fechaIngresoIPN" element="span" cssClass="help-block text-danger" />
                <div style="color:#C00;">${mensajeFechasIngreso}</div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Estado Civil</label>
            <div class="input-icon">
                <form:radiobutton path="estadoCivil" value="Soltero" cssClass="form-control placeholder-no-fix"/>Soltero
                <form:radiobutton path="estadoCivil" value="Casado" cssClass="form-control placeholder-no-fix"/>Casado
                <form:errors path="estadoCivil" element="span" cssClass="help-block text-danger" />
            </div>
        </div>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Sexo</label>
            <div class="input-icon">
                <form:radiobutton path="sexo" value="Masculino" cssClass="form-control placeholder-no-fix"/>Masculino
                <form:radiobutton path="sexo" value="Femenino" cssClass="form-control placeholder-no-fix"/>Femenino
                <form:errors path="sexo" element="span" cssClass="help-block text-danger" />
            </div>
        </div>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Escuela</label>

            <form:select path="escuela.id" cssClass="select2 form-control" id="select2_sample4">
                <form:option value="" label="Selecciona una opción"/>
                <form:options items="${escuelaList}" itemValue="id"
                              itemLabel="nombre"/>
            </form:select>
            <form:errors path="escuela" element="span" cssClass="help-block text-danger"/>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Grado</label>
            <form:select path="grado.idGrado"  cssClass="select2 form-control" id="select2_sample4">
                <form:option value="" label="Selecciona una opción"/>
                <form:options items="${gradoList}" itemValue="idGrado" itemLabel="nombre"/>
            </form:select>
            <form:errors path="grado" element="span" cssClass="help-block text-danger"/>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Contraseña</label>
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <form:input path="password" cssClass="form-control placeholder-no-fix" placeholder="Contraseña" type="password"/>
                <form:errors path="password" element="span" cssClass="help-block text-danger" />
            </div>
        </div>
        <div class="form-actions">
            <button type="submit" class="btn blue pull-right">
                Registrarse <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
        <div class="create-account">
            <p>
                Ya tienes una cuenta <a href="${contexto}/login" id="register-btn">
                Iniciar Sesión </a>
            </p>
        </div>
    </form:form>
    <!-- END REGISTRATION FORM -->
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
    2014 &copy; Metronic - Admin Dashboard Template.
</div>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/resources/global/plugins/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${pageContext.request.contextPath}/resources/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/jquery-migrate.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/jquery.blockui.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/uniform/jquery.uniform.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/jquery.cokie.min.js"
        type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${pageContext.request.contextPath}/resources/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/global/plugins/backstretch/jquery.backstretch.min.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/global/plugins/select2/select2.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/tema/scripts/layout.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/tema/scripts/demo.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/resources/tema/assets/admin/pages/scripts/login-soft.js"
        type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        //Login.init();
        Demo.init();
        // init background slide images
        $.backstretch([
                    "${pageContext.request.contextPath}/resources/tema/assets/admin/pages/media/bg/1.jpg",
                    "${pageContext.request.contextPath}/resources/tema/assets/admin/pages/media/bg/2.jpg",
                    "${pageContext.request.contextPath}/resources/tema/assets/admin/pages/media/bg/3.jpg",
                    "${pageContext.request.contextPath}/resources/tema/assets/admin/pages/media/bg/4.jpg"
                ], {
                    fade: 1000,
                    duration: 8000
                }
        );
    });
</script>
<!-- END JAVASCRIPTS -->
</body>

<!-- END BODY -->
</html>