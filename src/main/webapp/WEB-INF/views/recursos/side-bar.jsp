<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ruta" value="${pageContext.request.getAttribute('javax.servlet.forward.request_uri')}" />
<c:set var="contexto" value="${pageContext.request.contextPath}" />

<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">

        <ul class="page-sidebar-menu " data-keep-expanded="false"
            data-auto-scroll="true" data-slide-speed="200">

            <li class="start ${ruta == '/trabajoterminal-1.0/+ñkjb vh cbklmñ,{mlcghfxcgbknñm{,mlb ' ?  'active open' : ' '}"><a href="${contexto}"> <i
                    class="icon-home"></i> <span class="title">INICIO</span>
            </a></li>

            <li class="${( ruta == '/trabajoterminal-1.0/nivel'
                        || ruta == '/trabajoterminal-1.0/nivel/crear' ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Nivel</span> <span
                    class="arrow ${( ruta == '/trabajoterminal-1.0/nivel'
                                  || ruta == '/trabajoterminal-1.0/nivel/crear' ) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == '/trabajoterminal-1.0/nivel' ) ?  'open' : ' '}">
                        <a href="${contexto}/nivel">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == '/trabajoterminal-1.0/nivel/crear' ) ?  'open' : ' '}">
                        <a href="${contexto}/nivel/crear">
                        Crear
                        </a>
                    </li>
                </ul>
            </li>

            <li class="${( ruta == '/trabajoterminal-1.0/idioma'
                        || ruta == '/trabajoterminal-1.0/idioma/crear' ) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                        class="icon-rocket"></i> <span class="title">idioma</span> <span
                        class="arrow ${( ruta == '/trabajoterminal-1.0/idioma'
                                      || ruta == '/trabajoterminal-1.0/idioma/crear' ) ?  'open text-success' : ' '}"></span>
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == '/trabajoterminal-1.0/idioma' ) ?  'open' : ' '}">
                        <a href="${contexto}/idioma">
                            Ver todos
                        </a>
                    </li>
                    <li class="${( ruta == '/trabajoterminal-1.0/idioma/crear' ) ?  'open' : ' '}">
                        <a href="${contexto}/idioma/crear">
                            Crear
                        </a>
                    </li>
                </ul>
            </li>

        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>