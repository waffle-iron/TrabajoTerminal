
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ruta"
	value="${pageContext.request.getAttribute('javax.servlet.forward.request_uri')}" />
<c:set var="contexto" value="${pageContext.request.contextPath}" />

<div class="page-sidebar-wrapper">
	<div class="page-sidebar navbar-collapse collapse">
		<ul class="page-sidebar-menu " data-keep-expanded="false"
			data-auto-scroll="true" data-slide-speed="200">

			<li
				class="start ${ruta == '/trabajoterminal/ ' ?  'active open' : ' '}">
				<a href="${contexto}"> <i class="icon-home"></i> <span
					class="title">INICIO </span>
			</a>
			</li>
<!-- .............................................................................................................. -->
			<li
				class="${( ruta == '/trabajoterminal/estado'
                        || ruta == '/trabajoterminal/estado/crear' ) ?  'active' : ' '}">
				<a href="javascript:;"> <i class="icon-rocket"></i> 
				<span class="title">Estado</span> 
				<span class="arrow ${( ruta == '/trabajoterminal/estado'
                      				|| ruta == '/trabajoterminal/estado/crear' ) ?  'open text-success' : ' '}"></span>
				</a>
				<ul class="sub-menu">
					<li class="${( ruta == '/trabajoterminal/estado' ) ?  'open' : ' '}">
						<a href="${contexto}/estado"> Ver todos </a>
					</li>
					<li
						class="${( ruta == '/trabajoterminal/estado/crear' ) ?  'open' : ' '}">
						<a href="${contexto}/estado/crear"> Crear </a>
					</li>
				</ul>
			</li>
<!-- .............................................................................................................. -->
<!-- .............................................................................................................. -->
			<li
				class="${( ruta == '/trabajoterminal/palabra_clave'
                        || ruta == '/trabajoterminal/palabra_clave/crear' ) ?  'active' : ' '}">
				<a href="javascript:;"> <i class="icon-rocket"></i> 
				<span class="title">Palabra clave</span> 
				<span class="arrow ${( ruta == '/trabajoterminal/palabra_clave'
                      				|| ruta == '/trabajoterminal/palabra_clave/crear' ) ?  'open text-success' : ' '}"></span>
				</a>
				<ul class="sub-menu">
					<li class="${( ruta == '/trabajoterminal/palabra_clave' ) ?  'open' : ' '}">
						<a href="${contexto}/palabra_clave"> Ver todos </a>
					</li>
					<li
						class="${( ruta == '/trabajoterminal/palabra_clave/crear' ) ?  'open' : ' '}">
						<a href="${contexto}/palabra_clave/crear"> Crear </a>
					</li>
				</ul>
			</li>
<!-- .............................................................................................................. -->

			<li
				class="${( ruta == '/trabajoterminal/idioma'
                        || ruta == '/trabajoterminal/idioma/crear' ) ?  'active' : ' '}">
				<a href="javascript:;"> <i class="icon-rocket"></i> <span
					class="title">Idioma</span> <span
					class="arrow ${( ruta == '/trabajoterminal/idioma'
                                      || ruta == '/trabajoterminal/idioma/crear' ) ?  'open text-success' : ' '}"></span>
			</a>
				<ul class="sub-menu">
					<li
						class="${( ruta == '/trabajoterminal/idioma' ) ?  'open' : ' '}">
						<a href="${contexto}/idioma"> Ver todos </a>
					</li>
					<li
						class="${( ruta == '/trabajoterminal/idioma/crear' ) ?  'open' : ' '}">
						<a href="${contexto}/idioma/crear"> Crear </a>
					</li>
				</ul>
			</li>

		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
</div>