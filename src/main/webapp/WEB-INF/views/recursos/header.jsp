<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="contexto" value="${pageContext.request.contextPath}" />
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">

			<a href="${contexto}"> <img
				src="${context}/resources/tema/img/logoTT.png" alt="logo"
				class="logo-default" />
			</a>
			<div class="menu-toggler sidebar-toggler">
				<!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
			</div>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler"
			data-toggle="collapse" data-target=".navbar-collapse"> </a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN PAGE ACTIONS -->
		<!-- DOC: Remove "hide" class to enable the page header actions -->
		<div class="page-actions">
<!-- 			<div class="btn-group"> -->
<!-- 				<button type="button" class="btn red-haze btn-sm dropdown-toggle" -->
<!-- 					data-toggle="dropdown" data-hover="dropdown" -->
<!-- 					data-close-others="true"> -->
<!-- 					<span class="hidden-sm hidden-xs">Actions&nbsp;</span><i -->
<!-- 						class="fa fa-angle-down"></i> -->
<!-- 				</button> -->
<!-- 				<ul class="dropdown-menu" role="menu"> -->
<!-- 					<li><a href="#"> <i class="icon-docs"></i> New Post -->
<!-- 					</a></li> -->
<!-- 					<li><a href="#"> <i class="icon-tag"></i> New Comment -->
<!-- 					</a></li> -->
<!-- 					<li><a href="#"> <i class="icon-share"></i> Share -->
<!-- 					</a></li> -->
<!-- 					<li class="divider"></li> -->
<!-- 					<li><a href="#"> <i class="icon-flag"></i> Comments <span -->
<!-- 							class="badge badge-success">4</span> -->
<!-- 					</a></li> -->
<!-- 					<li><a href="#"> <i class="icon-users"></i> Feedbacks <span -->
<!-- 							class="badge badge-danger">2</span> -->
<!-- 					</a></li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
		</div>
		<!-- END PAGE ACTIONS -->
		<!-- BEGIN PAGE TOP -->
		<div class="page-top">
			<!-- BEGIN HEADER SEARCH BOX -->
			<!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
<!-- 			<form class="search-form" action="extra_search.html" method="GET"> -->
<!-- 				<div class="input-group"> -->
<!-- 					<input type="text" class="form-control input-sm" -->
<!-- 						placeholder="Buscar..." name="query"> <span -->
<!-- 						class="input-group-btn"> <a href="javascript:;" -->
<!-- 						class="btn submit"><i class="icon-magnifier"></i></a> -->
<!-- 					</span> -->
<!-- 				</div> -->
<!-- 			</form> -->
			<!-- END HEADER SEARCH BOX -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<li class="separator hide"></li>
					<!-- BEGIN NOTIFICATION DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li
						class="dropdown dropdown-extended dropdown-notification dropdown-dark"
						id="header_notification_bar"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-close-others="true"> <i
							class="icon-bell"></i> <span class="badge badge-success">
								Alertas ${totalInvitaciones} </span>
					</a>
						<ul class="dropdown-menu">
							<li class="external">
								<h3>
									<span class="bold">#</span> Mis invitaciones
								</h3> <a href="${contexto}/mis-invitaciones">Ver todas</a>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller" style="height: 250px;"
									data-handle-color="#637283">

									<li><a href="${contexto}/proyecto/invitar"> <span class="time">...
												</span> <span class="details"> <span
												class="label label-sm label-icon label-warning"> <i
													class="fa fa-bell-o"></i>
											</span> Nueva invitación..
										</span>
									</a></li>

<!-- 									<li><a href="javascript:;"> <span class="time">... -->
<!-- 												</span> <span class="details"> <span -->
<!-- 												class="label label-sm label-icon label-danger"> <i -->
<!-- 													class="fa fa-bolt"></i> -->
<!-- 											</span> Mensaje nuevo. -->
<!-- 										</span> -->
<!-- 									</a></li> -->



								</ul>
							</li>
						</ul></li>
					<!-- END NOTIFICATION DROPDOWN -->
					<li class="separator hide"></li>
					<!-- BEGIN INBOX DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-extended dropdown-inbox dropdown-dark"
						id="header_inbox_bar"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" data-hover="dropdown"
						data-close-others="true"> <i class="icon-envelope-open"></i> <span
							class="badge badge-danger"> ${totalRecibidos} </span>
					</a>
						<ul class="dropdown-menu">
							<li class="external">
								<h3>
									Tu tienes <span class="bold">${totalRecibidos} </span> Mensajes
								</h3> <a href="${contexto}/correo">Ver todos</a>
							</li>
									
							<li>
								<ul class="dropdown-menu-list scroller" style="height: 275px;"
									data-handle-color="#637283">

									<li><a href="${contexto}/correo/crear"> <span class="time">...
												</span> <span class="details"> <span
												class="label label-sm label-icon label-danger"> <i
													class="fa fa-bolt"></i>
											</span> Mensaje nuevo.
										</span>
									</a></li>
									
									

								</ul>
							</li>
						</ul></li>
					<!-- END INBOX DROPDOWN -->
					<li class="separator hide"></li>
					<!-- BEGIN TODO DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-extended dropdown-tasks dropdown-dark"
						id="header_task_bar"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" data-hover="dropdown"
						data-close-others="true"> <i class="icon-calendar"></i> <span
							class="badge badge-primary"> ${totalProyectos} </span>
					</a>
						<ul class="dropdown-menu extended tasks">
							<li class="external">
								<h3>
									Tu tienes <span class="bold">${totalProyectos}</span> Proyectos
								</h3>  <a href="${contexto}/proyecto">Ver todos</a>
							</li>
							<li>
								<ul class="dropdown-menu-list scroller" style="height: 275px;"
									data-handle-color="#637283">
<!-- 									<li><a href="javascript:;"> <span class="task"> -->
<!-- 												<span class="desc">Proyecto 1</span> <span -->
<!-- 												class="percent">40%</span> -->
<!-- 										</span> <span class="progress"> <span style="width: 40%;" -->
<!-- 												class="progress-bar progress-bar-success" aria-valuenow="40" -->
<!-- 												aria-valuemin="0" aria-valuemax="100"><span -->
<!-- 													class="sr-only">40% completado</span></span> -->
<!-- 										</span> -->
<!-- 									</a></li> -->
<!-- 									<li><a href="javascript:;"> <span class="task"> -->
<!-- 												<span class="desc">Proyecto 1</span> <span -->
<!-- 												class="percent">40%</span> -->
<!-- 										</span> <span class="progress"> <span style="width: 40%;" -->
<!-- 												class="progress-bar progress-bar-success" aria-valuenow="40" -->
<!-- 												aria-valuemin="0" aria-valuemax="100"><span -->
<!-- 													class="sr-only">40% completado</span></span> -->
<!-- 										</span> -->
<!-- 									</a></li> -->

								</ul>
							</li>
						</ul></li>
					<!-- END TODO DROPDOWN -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-user dropdown-dark"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-close-others="true"> <span
							class="username username-hide-on-mobile"> ${nombre} </span> <!-- DOC: Do not remove below empty space(&nbsp;) as its purposely used -->
							<img alt="" class="img-circle"
							src="${context}/resources/tema/img/usuario.png" />
					</a>
						<ul class="dropdown-menu dropdown-menu-default">
							<li><a href="${contexto}/usuario/perfil"> <i class="icon-user"></i>
									Mi perfil
							</a>
							</li>
							<li class="divider"></li>

							<c:url var="logoutUrl" value="/login"/>

							<li>
								<form action="${logoutUrl}" method="post">
									<input type="submit" value="Salir" />
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								</form>
							</li>
						</ul></li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END PAGE TOP -->
	</div>
	<!-- END HEADER INNER -->
</div>