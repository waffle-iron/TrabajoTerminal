<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ruta" value="${pageContext.request.getAttribute('javax.servlet.forward.request_uri')}" />
<c:set var="contexto" value="${pageContext.request.contextPath}" />

<div class="page-sidebar-wrapper">
    <!-- DOC: Seot data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu " data-keep-expanded="false"
            data-auto-scroll="true" data-slide-speed="200">

            <li class="start ${ruta == '/trabajoterminal-1.0/' ?  'active open' : ' '}"><a href="${contexto}"> <i
                    class="icon-home"></i> <span class="title">INICIO</span>
            </a></li>

            <li class="${( ruta == '/trabajoterminal-1.0/nivel'
                        || ruta == '/trabajoterminal-1.0/nivel/crear' ) ?  'active' : ' '}"><a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Nivel</span> <span
                    class="arrow ${( ruta == '/trabajoterminal-1.0/nivel'
                                  || ruta == '/trabajoterminal-1.0/nivel/crear' ) ?  'open text-success' : ' '}"></span>
            </a
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
                    </li>
                </ul>
            </li>

        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>