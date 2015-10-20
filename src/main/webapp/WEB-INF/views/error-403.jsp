<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${pageContext.request.contextPath}/resources/tema/assets/admin/pages/css/error.css"
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

<body class="page-md page-404-full-page">
<div class="row">
    <div class="col-md-12 page-404">
        <div class="number">
            403
        </div>
        <div class="details">
            <h3>Oops! No tienes permisos para ver esto.</h3>
            <p>
                We can not find the page you're looking for.<br/>
                <a href="${contexto}/">
                    Return home </a>
                or try the search bar below.
            </p>
        </div>
    </div>
</div>


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
        // Login.init();
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