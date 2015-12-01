<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<jsp:include page="recursos/headerIndex.jsp"></jsp:include>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<jsp:include page="recursos/side-barIndex.jsp"></jsp:include>
		<!-- END SIDEBAR -->
				<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content">


				<!-- BEGIN PAGE CONTENT-->
				<div class="row margin-bottom-40 stories-header" data-auto-height="true">
				<div class="col-md-12">
                            <h1>SIBIPI- TT-2014-B059</h1>
                            <h2>Sistema de búsqueda de información de proyectos enfocada a los trabajos de investigación de docentes y alumnos de educación superior del IPN</h2>
                </div>
                </div>
				
				  <!-- BEGIN TEXT & Imagen -->
                    <div class="row margin-bottom-40">
                        <div class="col-lg-6">
                            <div class="portlet light about-text">
                                <h4>
                                    <i class="fa fa-check icon-info"></i> Sobre el sistema...</h4>
                                <p class="margin-top-20">
									Uno  de  los  objetivos  del  Instituto  Politécnico  Nacional es  la  realización  de  trabajos  de  investigación.  
									La Dirección de Investigación es la entidad encargada de promover y difundir la investigación que se realice en los  
									niveles  educativos  que  atiende  el  IPN.
									La  falta  de medios  para  la  vinculación  de  diferentes  disciplinas  es  una  de las  causas  de la  baja  cantidad  
									de trabajos  multidisciplinarios  que  se realizan  en  el  IPN. El  costo  de  oportunidad al no  vincular  estas  áreas 
									es muy alto debido que la innovación queda limitada y el campo de problemas con los que se enfrente cada área del conocimiento 
									tiene menos oportunidades de solución.
									
                                    </p>
                                    <p>
                                    Este sistema  web  pretende apoyar a la  coordinación  de  trabajos  de investigación  entre  
                                    la  comunidad  politécnica  (docente-docente,  alumno-alumno  y  docente-alumno).  
                                    Se busca que todos los integrantes del instituto tengan un beneficio con este sistema ya que al brindarse apoyo generarán mejores 
                                    trabajos y proyectos compartiendo experiencia y conocimientos adquiridos en diferentes áreas 
                                    </p>
                                    <p>Entre otras cosas que se podran consultar como:</p>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <ul class="list-unstyled margin-top-10 margin-bottom-10">
                                            <li>
                                                <i class="fa fa-check"></i> Información relacionada con los trabajos de investigación</li>
                                            <li>
                                                <i class="fa fa-check"></i> Avance de dichos proyectos</li>
                                            <li>
                                                <i class="fa fa-check"></i> Acceder fácilmente a un proyecto buscado</li>
                                            
                                        </ul>
                                    </div>
                               
                                </div>
                             
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <iframe src="http://player.vimeo.com/video/43904685" style="width:100%; height:500px;border:0" allowfullscreen> </iframe>
                        </div>
                    </div>
                    <!-- END TEXT & VIDEO -->


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