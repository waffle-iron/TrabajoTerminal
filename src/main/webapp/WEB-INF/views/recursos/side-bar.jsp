<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ruta" value="${pageContext.request.getAttribute('javax.servlet.forward.request_uri')}" />
<c:set var="contexto" value="${pageContext.request.contextPath}" />

<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">

        <ul class="page-sidebar-menu " data-keep-expanded="false"
            data-auto-scroll="true" data-slide-speed="200">

            <li class="start ${ruta == '/trabajoterminal/' ?  'active open' : ' '}"><a href="${contexto}"> <i
                    class="icon-home"></i> <span class="title">INICIO</span>
            </a></li>

			<c:set var="contextonivel" value="${contexto.concat('/nivel')}" />
			<c:set var="contextoidioma" value="${contexto.concat('/idioma')}" />
			<c:set var="contextoestado" value="${contexto.concat('/estado')}" />
			<c:set var="contextopalabra_clave" value="${contexto.concat('/palabra_clave')}" />
			<c:set var="contextoarea" value="${contexto.concat('/area')}" />
			<c:set var="contextotipoproyecto" value="${contexto.concat('/tipoproyecto')}" />

			<c:set var="contextonivelcrear" value="${contexto.concat('/nivel/crear')}" />
			<c:set var="contextoidiomacrear" value="${contexto.concat('/idioma/crear')}" />
			<c:set var="contextoestadocrear" value="${contexto.concat('/estado/crear')}" />
			<c:set var="contextopalabra_clavecrear" value="${contexto.concat('/palabra_clave/crear')}" />
			<c:set var="contextoareacrear" value="${contexto.concat('/area/crear')}" />
			<c:set var="contextotipoproyectocrear" value="${contexto.concat('/tipoproyecto/crear')}" />




            <li class="${ ( ruta == contextonivel ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Nivel</span> <span
                    class="arrow ${( ruta == contextonivel || ruta == contextonivelcrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextonivel) ?  'open' : ' '}">
                        <a href="${contexto}/nivel">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextonivelcrear) ?  'open' : ' '}">
                        <a href="${contexto}/nivel/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>

            <li class="${( ruta == contextotipoproyecto
                        || ruta == contextotipoproyectocrear) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Tipo Proyecto</span> <span
                    class="arrow ${( ruta == contextotipoproyecto
                                  || ruta == contextotipoproyectocrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextotipoproyecto) ?  'open' : ' '}">
                        <a href="${contexto}/tipoproyecto">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextotipoproyectocrear ) ?  'open' : ' '}">
                        <a href="${contexto}/tipoproyecto/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>

            <li class="${( ruta == contextoarea
                        || ruta == contextoareacrear ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Area</span> <span
                    class="arrow ${( ruta == contextoarea
                                  || ruta == contextoareacrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextoarea) ?  'open' : ' '}">
                        <a href="${contexto}/area">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextoareacrear ) ?  'open' : ' '}">
                        <a href="${contexto}/area/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>


        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>