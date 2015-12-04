mo <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="contexto"/>
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

			
                  <div class="portlet light portlet-fit bordered">
					<div class="portlet-title">
						<div class="caption">
							
							 <i class="icon-share font-dark"></i>
							 <font size="6px">							 
							 <span class="caption-subject font-red bold uppercase ">Mis correos recibidos</span><br /></font>
							
							
						</div>

					</div>
				</div>
                  
			
            <!-- BEGIN PAGE CONTENT-->
<!--             <div class="row"> -->
<!--                 <div class="col-md-12"> -->
<!--                     <h2><b class="text-success"> -->
<%--                         <c:if test="${eliminado}"> --%>
<!--                             El correo ha sido eliminado -->
<%--                         </c:if> --%>
<%--                         <c:if test="${!eliminado}"> --%>
<!--                             No existe el correo -->
<%--                         </c:if> --%>
<!--                     </b></h2> -->
<!--                 </div> -->
<!--             </div> -->
          
             <div class="row">
                <div class="col-md-12">
                    <div class="portlet light">
                        <div class="portlet-title">
                            <div class="caption">
                                Lista de correos recibidos
                            </div>

                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-striped table-bordered table-advance table-hover">
                                    <thead>
                                    <tr>
<!--                                          <th class="hidden-xs"> -->
<!--                                            Id -->
<!--                                         </th> -->
                                        <th class="hidden-xs">
                                           Asunto
                                        </th>
                                        <th>
                                           Contenido
                                        </th>
                                        <th>
                                            Usuario emisor
                                        </th>
                                        <th>
                                            Usuario receptor
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${correosListRecibidos}" var="correo">
                                        <tr>
<!--                                         <td> -->
<%--                                                 <a href="${contexto}correo/ver/${correo.idCorreo}"> --%>
<%--                                                     ${correo.idCorreo} --%>
<!--                                                 </a> -->
<!--                                             </td> -->
                                           
                                            <td>
                                                <a href="${contexto}correo/ver/${correo.idCorreo}">
                                                    ${correo.asunto}
                                                </a>
                                            </td>
                                            <td>
                                                
                                                    ${correo.contenido}
                                                
                                            </td>
                                                                                        
                                            <td>
                                                    ${correo.usuarioReceptor.nombreUsuario}
                                            
                                            </td>
                                             <td>
                                             <a href="${contexto}chat/${correo.usuarioEmisor.idUsuarios}">
                                             
                                                    ${correo.usuarioEmisor.nombreUsuario}
                                             </a>
                                            </td>
                                                                                        
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- END SAMPLE TABLE PORTLET-->

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