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
            <jsp:include page="../recursos/breadcrumbs.jsp"></jsp:include>
            <!-- END PAGE HEADER-->

            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <p>${invitaciones == null ? 'No tienes invitaciones' : ''}</p>
					<pre>
                        ${invitaciones}
                    </pre>
                <div class="col-md-12">
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet light bordered">
                        <div class="portlet-title">
                            <div class="caption font-dark">
                                <i class="icon-settings font-dark"></i>
                                <span class="caption-subject bold uppercase"> Managed Table</span>
                            </div>
                            <div class="actions">
                                <div class="btn-group btn-group-devided" data-toggle="buttons">
                                    <label class="btn btn-transparent dark btn-outline btn-circle btn-sm active">
                                        <input type="radio" name="options" class="toggle" id="option1">Actions</label>
                                    <label class="btn btn-transparent dark btn-outline btn-circle btn-sm">
                                        <input type="radio" name="options" class="toggle" id="option2">Settings</label>
                                </div>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-toolbar">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="btn-group">
                                            <button id="sample_editable_1_new" class="btn sbold green"> Add New
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="btn-group pull-right">
                                            <button class="btn green  btn-outline dropdown-toggle"
                                                    data-toggle="dropdown">Tools
                                                <i class="fa fa-angle-down"></i>
                                            </button>
                                            <ul class="dropdown-menu pull-right">
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-print"></i> Print </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-file-pdf-o"></i> Save as PDF </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:;">
                                                        <i class="fa fa-file-excel-o"></i> Export to Excel </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-bordered table-hover table-checkable order-column"
                                   id="sample_1">
                                <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" class="group-checkable"
                                               data-set="#sample_1 .checkboxes"/></th>
                                    <th> Username</th>
                                    <th> Email</th>
                                    <th> Points</th>
                                    <th> Joined</th>
                                    <th> Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> shuxer</td>
                                    <td>
                                        <a href="mailto:shuxer@gmail.com"> shuxer@gmail.com </a>
                                    </td>
                                    <td> 120</td>
                                    <td class="center"> 12 Jan 2012</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> looper</td>
                                    <td>
                                        <a href="mailto:looper90@gmail.com"> looper90@gmail.com </a>
                                    </td>
                                    <td> 120</td>
                                    <td class="center"> 12.12.2011</td>
                                    <td>
                                        <span class="label label-sm label-warning"> Suspended </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> userwow</td>
                                    <td>
                                        <a href="mailto:userwow@yahoo.com"> userwow@yahoo.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 12.12.2012</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> user1wow</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> userwow@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 12.12.2012</td>
                                    <td>
                                        <span class="label label-sm label-default"> Blocked </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> restest</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> test@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 12.12.2012</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> foopl</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 19.11.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> weep</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 19.11.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> coop</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 19.11.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> pppol</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 19.11.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> test</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 19.11.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> userwow</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> userwow@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 12.12.2012</td>
                                    <td>
                                        <span class="label label-sm label-default"> Blocked </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> test</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> test@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 12.12.2012</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> goop</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 12.11.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> weep</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 15.11.2011</td>
                                    <td>
                                        <span class="label label-sm label-default"> Blocked </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> toopl</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 16.11.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> userwow</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> userwow@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 9.12.2012</td>
                                    <td>
                                        <span class="label label-sm label-default"> Blocked </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> tes21t</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> test@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 14.12.2012</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> fop</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 13.11.2010</td>
                                    <td>
                                        <span class="label label-sm label-warning"> Suspended </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> kop</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 17.11.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> vopl</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 19.11.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> userwow</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> userwow@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 12.12.2012</td>
                                    <td>
                                        <span class="label label-sm label-default"> Blocked </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> wap</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> test@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 12.12.2012</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> test</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 19.12.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> toop</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 17.12.2010</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                <tr class="odd gradeX">
                                    <td>
                                        <input type="checkbox" class="checkboxes" value="1"/></td>
                                    <td> weep</td>
                                    <td>
                                        <a href="mailto:userwow@gmail.com"> good@gmail.com </a>
                                    </td>
                                    <td> 20</td>
                                    <td class="center"> 15.11.2011</td>
                                    <td>
                                        <span class="label label-sm label-success"> Approved </span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->
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