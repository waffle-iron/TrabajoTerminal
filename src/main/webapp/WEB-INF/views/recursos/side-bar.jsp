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
			<c:set var="contextocorreo" value="${contexto.concat('/correo')}" />
			<c:set var="contextodireccion" value="${contexto.concat('/direccion')}" />
			<c:set var="contextoescuela" value="${contexto.concat('/escuela')}" />
			<c:set var="contextogrado" value="${contexto.concat('/grado')}" />
			<c:set var="contextoinvitacion" value="${contexto.concat('/invitacion')}" />
			<c:set var="contextoproyecto" value="${contexto.concat('/proyecto')}" />
			<c:set var="contextousuario" value="${contexto.concat('/usuario')}" />

			<c:set var="contextonivelcrear" value="${contexto.concat('/nivel/crear')}" />
			<c:set var="contextoidiomacrear" value="${contexto.concat('/idioma/crear')}" />
			<c:set var="contextoestadocrear" value="${contexto.concat('/estado/crear')}" />
			<c:set var="contextopalabra_clavecrear" value="${contexto.concat('/palabra_clave/crear')}" />
			<c:set var="contextoareacrear" value="${contexto.concat('/area/crear')}" />
			<c:set var="contextotipoproyectocrear" value="${contexto.concat('/tipoproyecto/crear')}" />
			<c:set var="contextocorreocrear" value="${contexto.concat('/correo/crear')}" />
			<c:set var="contextodireccioncrear" value="${contexto.concat('/direccion/crear')}" />
			<c:set var="contextogradocrear" value="${contexto.concat('/grado/crear')}" />
			<c:set var="contextoinvitacioncrear" value="${contexto.concat('/invitacion/crear')}" />
			<c:set var="contextousuariocrear" value="${contexto.concat('/usuario/crear')}" />


			<li class="${( ruta == contextopalabra_clave
                        || ruta == contextopalabra_clavecrear) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Palabra_clave</span> <span
                    class="arrow ${( ruta == contextopalabra_clave
                                  || ruta == contextopalabra_clavecrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextopalabra_clave) ?  'open' : ' '}">
                        <a href="${contexto}/palabra_clave">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextopalabra_clavecrear ) ?  'open' : ' '}">
                        <a href="${contexto}/palabra_clave/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>


			<li class="${( ruta == contextoestado
                        || ruta == contextoestadocrear) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Estado</span> <span
                    class="arrow ${( ruta == contextoestado
                                  || ruta == contextoestadocrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextoestado) ?  'open' : ' '}">
                        <a href="${contexto}/estado">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextoestadocrear ) ?  'open' : ' '}">
                        <a href="${contexto}/estado/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>


			<li class="${( ruta == contextoidioma
                        || ruta == contextoidiomacrear) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Idioma</span> <span
                    class="arrow ${( ruta == contextoidioma
                                  || ruta == contextoidiomacrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextoidioma) ?  'open' : ' '}">
                        <a href="${contexto}/idioma">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextoidiomacrear ) ?  'open' : ' '}">
                        <a href="${contexto}/idioma/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>


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

			<li class="${( ruta == contextocorreo
                        || ruta == contextocorreocrear ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Correo</span> <span
                    class="arrow ${( ruta == contextocorreo
                                  || ruta == contextocorreocrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextocorreo) ?  'open' : ' '}">
                        <a href="${contexto}/correo">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextocorreocrear ) ?  'open' : ' '}">
                        <a href="${contexto}/correo/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>
            
            <li class="${( ruta == contextodireccion
                        || ruta == contextodireccioncrear ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Dirección</span> <span
                    class="arrow ${( ruta == contextodireccion
                                  || ruta == contextodireccioncrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextodireccion) ?  'open' : ' '}">
                        <a href="${contexto}/direccion">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextodireccioncrear ) ?  'open' : ' '}">
                        <a href="${contexto}/direccion/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>
            
            <li class="${( ruta == contextoescuela
                        || ruta == contextoescuelacrear ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Escuela</span> <span
                    class="arrow ${( ruta == contextoescuela
                                  || ruta == contextoescuelacrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextoescuela) ?  'open' : ' '}">
                        <a href="${contexto}/escuela">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextoescuelacrear ) ?  'open' : ' '}">
                        <a href="${contexto}/escuela/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>
            
            <li class="${( ruta == contextogrado
                        || ruta == contextogradocrear ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Grado</span> <span
                    class="arrow ${( ruta == contextogrado
                                  || ruta == contextogradocrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextogrado) ?  'open' : ' '}">
                        <a href="${contexto}/grado">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextogradocrear ) ?  'open' : ' '}">
                        <a href="${contexto}/grado/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>
            
            <li class="${( ruta == contextoinvitacion
                        || ruta == contextoinvitacioncrear ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Invitacion</span> <span
                    class="arrow ${( ruta == contextoinvitacion
                                  || ruta == contextoinvitacioncrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextoinvitacion) ?  'open' : ' '}">
                        <a href="${contexto}/invitacion">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextoinvitacioncrear ) ?  'open' : ' '}">
                        <a href="${contexto}/invitacion/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>
            
            <li class="${( ruta == contextoproyecto
                        || ruta == contextoproyectocrear ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Proyecto</span> <span
                    class="arrow ${( ruta == contextoproyecto
                                  || ruta == contextoproyectocrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextoproyecto) ?  'open' : ' '}">
                        <a href="${contexto}/proyecto">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextoproyectocrear ) ?  'open' : ' '}">
                        <a href="${contexto}/proyecto/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>
            
            <li class="${( ruta == contextousuario
                        || ruta == contextousuariocrear ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Usuario</span> <span
                    class="arrow ${( ruta == contextousuario
                                  || ruta == contextousuariocrear) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextousuario) ?  'open' : ' '}">
                        <a href="${contexto}/usuario">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == contextousuariocrear ) ?  'open' : ' '}">
                        <a href="${contexto}/usuario/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>
            
            
            

        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>