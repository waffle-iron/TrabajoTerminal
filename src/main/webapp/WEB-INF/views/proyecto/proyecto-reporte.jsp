<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/" var="contexto" />

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
				<jsp:include page="../recursos/breadcrumbs.jsp"></jsp:include>
				<!-- END PAGE HEADER-->

				 <!-- BEGIN PAGE BASE CONTENT -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Begin: life time stats -->
                            <div class="portlet light portlet-fit portlet-datatable bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-settings font-dark"></i>
                                        <span class="caption-subject font-dark sbold uppercase"> Información del proyecto
                                            <span class="hidden-xs"> <i class="icon-calendar">| ${fecha}</i></span>
                                        </span>
                                    </div>
                                    <div class="actions">
                                        <div class="btn-group">
                                            <a class="btn red btn-outline btn-circle" href="javascript:;" data-toggle="dropdown">
                                                <i class="fa fa-share"></i>
                                                <span class="hidden-xs"> Ver </span>
                                                <i class="fa fa-angle-down"></i>
                                            </a>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;"> Generar PDF </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;"> Ver detalle </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;"> ... </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs nav-tabs-lg">
                                            <li class="active">
                                                <a href="#tab_1" data-toggle="tab"> Resumen </a>
                                            </li>
                                            <li>
                                                <a href="#tab_2" data-toggle="tab"> Tareas
                                                    <span class="badge badge-success">${totalTareasPorProy}</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab_3" data-toggle="tab"> <i class="fa fa-users"></i>  Colaboradores
                                                <span class="badge badge-danger">${totalColaboradoresPorProyecto}</span></a>
                                            </li>
                                            <li>
                                                <a href="#tab_4" data-toggle="tab"> Avance
                                                    
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab_5" data-toggle="tab"> Mas </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_1">
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="portlet green-meadow box">
                                                            <div class="portlet-title">
                                                                <div class="caption">
                                                                    <i class="fa fa-cogs"></i>Resumen
                                                                </div>                                                                
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="row static-info">
                                                                    <div class="col-md-5 value"> 
                                                                    	Nombre: 
                                                                    </div>
                                                                    <div class="col-md-7 name"> 
                                                                    	${proyecto.nombre}    
                                                                    </div>
                                                                    <div class="col-md-5 value"> 
                                                                    	Descripción: 
                                                                    </div>
                                                                    <div class="col-md-7 name"> 
                                                                    	${proyecto.descripcion}    
                                                                    </div>
                                                                </div>                                                                                                                              
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="portlet blue-hoki box">
                                                            <div class="portlet-title">
                                                                <div class="caption">
                                                                    <i class="fa fa-cogs"></i>Información importante</div>                                                                
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="row static-info">
                                                                    <div class="col-md-5 name">  
                                                                    	Fecha inicio:
                                                                    </div>
                                                                    <div class="col-md-7 value">  
                                                                    	${proyecto.fechaInicio }
                                                                    </div>
                                                                    <div class="col-md-5 name">  
                                                                    	Fecha fin:
                                                                    </div>
                                                                    <div class="col-md-7 value">  
                                                                    	${proyecto.fechaFin}
                                                                    </div>
                                                                </div>                                                                                                                               
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="row">
                                                    <div class="col-md-12 col-sm-12">
                                                        <div class="portlet grey-cascade box">
                                                            <div class="portlet-title">
                                                                <div class="caption">
                                                                    <i class="fa fa-cogs"></i>Mas Información </div>
                                                                <div class="actions">
                                                                    <a href="javascript:;" class="btn btn-default btn-sm">
                                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                                </div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover table-bordered table-striped">
                                                                        <thead>
                                                                            <tr>
                                                                                <th> Id </th>
                                                                                <th> Proyecto </th>
                                                                                <th> Descripción </th>
                                                                                <th> Fecha inicio </th>
                                                                                <th> Fecha fin </th>
                                                                                <th> Estatus </th>
                                                                                <th> Avance </th>
                                                                                <th> Tipo de proyecto</th>
                                                                                <th> Coordinador </th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <a href="javascript:;"> ${proyecto.idProyecto} </a>
                                                                                </td>
                                                                                <td>
                                                                                    <span class="label label-sm label-success"> ${proyecto.nombre} </td>
                                                                                <td> ${proyecto.descripcion} </td>
                                                                                <td> ${proyecto.fechaInicio} </td>
                                                                                <td> ${proyecto.fechaFin} </td>
                                                                                <td> ${proyecto.privado} </td>                                                                                
                                                                                <td> ${proyecto.avance} </td>
                                                                                <td> ${proyecto.tipoProyecto} </td>
                                                                                <td> ${proyecto.coordinador.nombreUsuario} </td>
                                                                              
                                                                            </tr>
                                                                           
                                                                           
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6"> </div>
                                                    <div class="col-md-6">
                                                        <div class="well">
                                                            <div class="row static-info align-reverse">
                                                                <div class="col-md-8 name"> Sub Total: </div>
                                                                <div class="col-md-3 value"> $1,124.50 </div>
                                                            </div>
                                                            <div class="row static-info align-reverse">
                                                                <div class="col-md-8 name"> Shipping: </div>
                                                                <div class="col-md-3 value"> $40.50 </div>
                                                            </div>
                                                            <div class="row static-info align-reverse">
                                                                <div class="col-md-8 name"> Grand Total: </div>
                                                                <div class="col-md-3 value"> $1,260.00 </div>
                                                            </div>
                                                            <div class="row static-info align-reverse">
                                                                <div class="col-md-8 name"> Total Paid: </div>
                                                                <div class="col-md-3 value"> $1,260.00 </div>
                                                            </div>
                                                            <div class="row static-info align-reverse">
                                                                <div class="col-md-8 name"> Total Refunded: </div>
                                                                <div class="col-md-3 value"> $0.00 </div>
                                                            </div>
                                                            <div class="row static-info align-reverse">
                                                                <div class="col-md-8 name"> Total Due: </div>
                                                                <div class="col-md-3 value"> $1,124.50 </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_2">
                                                <div class="row">
                                                    <div class="col-md-12 col-sm-12">
                                                        <div class="portlet grey-cascade box">
                                                            <div class="portlet-title">
                                                                <div class="caption">
                                                                    <i class="fa fa-cogs"></i>Mas Información </div>
                                                                <div class="actions">
                                                                    <a href="javascript:;" class="btn btn-default btn-sm">
                                                                        <i class="fa fa-pencil"></i> Edit </a>
                                                                </div>
                                                            </div>
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover table-bordered table-striped">
                                                                        <thead>
                                                                            <tr>
                                                                                <th> Id Tarea </th>
                                                                                <th> Nombre </th>
                                                                                <th> Avance </th>
                                                                                <th> otro </th>
                                                                                <th> ... </th>
                                                                                <th> ... </th>
                                                                                <th> ... </th>
                                                                                <th> ...</th>
                                                                                <th> ... </th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        	<c:forEach items="${listaTareasDeProyecto}" var="tarea">
                                                                            <tr>                                                                            	
                                                                                <td>
                                                                                    <a href="javascript:;"> ${tarea.idTarea} </a>
                                                                                </td>
                                                                                <td>
                                                                                    <span class="label label-sm label-success"> ${tarea.descripcion} </td>
                                                                                <td> ${tarea.avance} </td>
                                                                                <td> ... </td>
                                                                                <td> ... </td>
                                                                                <td> ... </td>                                                                                
                                                                                <td> ... </td>
                                                                                <td> ... </td>
                                                                                <td> ... </td>
                                                                              
                                                                            </tr>
                                                                           </c:forEach>
                                                                           
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_3">
                                               <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table table-hover table-bordered table-striped">
                                                                        <thead>
                                                                            <tr>
                                                                                <th> Id Tarea </th>
                                                                                <th> Nombre </th>
                                                                                <th> Avance </th>
                                                                                <th> otro </th>
                                                                                <th> ... </th>
                                                                                <th> ... </th>
                                                                                <th> ... </th>
                                                                                <th> ...</th>
                                                                                <th> ... </th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                        	<c:forEach items="${colaboradoresProyecto}" var="colaborador">
                                                                            <tr>                                                                            	
                                                                                <td>
                                                                                    <a href="javascript:;"> ${colaborador.usuario.idUsuarios} </a>
                                                                                </td>
                                                                                <td>
                                                                                    <span class="label label-sm label-success"> ${colaborador.usuario.nombreUsuario} </td>
                                                                                <td>  </td>
                                                                                <td> ... </td>
                                                                                <td> ... </td>
                                                                                <td> ... </td>                                                                                
                                                                                <td> ... </td>
                                                                                <td> ... </td>
                                                                                <td> ... </td>
                                                                              
                                                                            </tr>
                                                                           </c:forEach>
                                                                           
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                  
                                            </div>
                                            <div class="tab-pane" id="tab_4">
                                                <div class="table-container">
                                                    <table class="table table-striped table-bordered table-hover" id="datatable_shipment">
                                                        <thead>
                                                            <tr role="row" class="heading">
                                                                <th width="5%"> Shipment&nbsp;# </th>
                                                                <th width="15%"> Ship&nbsp;To </th>
                                                                <th width="15%"> Shipped&nbsp;Date </th>
                                                                <th width="10%"> Quantity </th>
                                                                <th width="10%"> Actions </th>
                                                            </tr>
                                                            <tr role="row" class="filter">
                                                                <td>
                                                                    <input type="text" class="form-control form-filter input-sm" name="order_shipment_no"> </td>
                                                                <td>
                                                                    <input type="text" class="form-control form-filter input-sm" name="order_shipment_ship_to"> </td>
                                                                <td>
                                                                    <div class="input-group date date-picker margin-bottom-5" data-date-format="dd/mm/yyyy">
                                                                        <input type="text" class="form-control form-filter input-sm" readonly name="order_shipment_date_from" placeholder="From">
                                                                        <span class="input-group-btn">
                                                                            <button class="btn btn-sm default" type="button">
                                                                                <i class="fa fa-calendar"></i>
                                                                            </button>
                                                                        </span>
                                                                    </div>
                                                                    <div class="input-group date date-picker" data-date-format="dd/mm/yyyy">
                                                                        <input type="text" class="form-control form-filter input-sm" readonly name="order_shipment_date_to" placeholder="To">
                                                                        <span class="input-group-btn">
                                                                            <button class="btn btn-sm default" type="button">
                                                                                <i class="fa fa-calendar"></i>
                                                                            </button>
                                                                        </span>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="margin-bottom-5">
                                                                        <input type="text" class="form-control form-filter input-sm" name="order_shipment_quantity_from" placeholder="From" /> </div>
                                                                    <input type="text" class="form-control form-filter input-sm" name="order_shipment_quantity_to" placeholder="To" /> </td>
                                                                <td>
                                                                    <div class="margin-bottom-5">
                                                                        <button class="btn btn-sm yellow filter-submit margin-bottom">
                                                                            <i class="fa fa-search"></i> Search</button>
                                                                    </div>
                                                                    <button class="btn btn-sm red filter-cancel">
                                                                        <i class="fa fa-times"></i> Reset</button>
                                                                </td>
                                                            </tr>
                                                        </thead>
                                                        <tbody> </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_5">
                                                <div class="table-container">
                                                    <table class="table table-striped table-bordered table-hover" id="datatable_history">
                                                        <thead>
                                                            <tr role="row" class="heading">
                                                                <th width="25%"> Datetime </th>
                                                                <th width="55%"> Description </th>
                                                                <th width="10%"> Notification </th>
                                                                <th width="10%"> Actions </th>
                                                            </tr>
                                                            <tr role="row" class="filter">
                                                                <td>
                                                                    <div class="input-group date datetime-picker margin-bottom-5" data-date-format="dd/mm/yyyy hh:ii">
                                                                        <input type="text" class="form-control form-filter input-sm" readonly name="order_history_date_from" placeholder="From">
                                                                        <span class="input-group-btn">
                                                                            <button class="btn btn-sm default date-set" type="button">
                                                                                <i class="fa fa-calendar"></i>
                                                                            </button>
                                                                        </span>
                                                                    </div>
                                                                    <div class="input-group date datetime-picker" data-date-format="dd/mm/yyyy hh:ii">
                                                                        <input type="text" class="form-control form-filter input-sm" readonly name="order_history_date_to" placeholder="To">
                                                                        <span class="input-group-btn">
                                                                            <button class="btn btn-sm default date-set" type="button">
                                                                                <i class="fa fa-calendar"></i>
                                                                            </button>
                                                                        </span>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <input type="text" class="form-control form-filter input-sm" name="order_history_desc" placeholder="To" /> </td>
                                                                <td>
                                                                    <select name="order_history_notification" class="form-control form-filter input-sm">
                                                                        <option value="">Select...</option>
                                                                        <option value="pending">Pending</option>
                                                                        <option value="notified">Notified</option>
                                                                        <option value="failed">Failed</option>
                                                                    </select>
                                                                </td>
                                                                <td>
                                                                    <div class="margin-bottom-5">
                                                                        <button class="btn btn-sm yellow filter-submit margin-bottom">
                                                                            <i class="fa fa-search"></i> Search</button>
                                                                    </div>
                                                                    <button class="btn btn-sm red filter-cancel">
                                                                        <i class="fa fa-times"></i> Reset</button>
                                                                </td>
                                                            </tr>
                                                        </thead>
                                                        <tbody> </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End: life time stats -->
                        </div>
                    </div>
                    <!-- END PAGE BASE CONTENT -->
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT --

			
			


			</div>
		</div>
	</div>



					

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
								PrograGraficas.init();
							});
						</script>

						<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>