<%@taglib prefix="form"     uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c"        uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring"   uri="http://www.springframework.org/tags" %>
<c:url value="/" var="contexto"/>

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


    <c:url value="/autentificar" var="rutaAutentificar"/>
    <!--  dsasgegfsadgsgf
    -->
    <form class="login-form" action="${rutaAutentificar}" method="POST">
        <h3 class="form-title">Login to your account</h3>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <div class="alert alert-danger <c:if test="${valido == null}">display-hide</c:if>">
            <button class="close" data-close="alert"></button>
                <c:if test="${valido == false}">
                    <h3 style="color: #FFFFFF">Usuario o password incorrectos!!</h3>

                </c:if>
        </div>
        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">email</label>

            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="email"
                       name="email" value="juancvfenix@gmail.com"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Password</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Password"
                       name="password" value="dsasgegfsadgsgf"/>
            </div>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn blue pull-right">
                Login <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
        <div class="create-account">
            <p>
                Don't have an account yet ?&nbsp; <a href="${contexto}registro" id="register-btn">
                Create an account </a>
            </p>
        </div>
    </form>
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