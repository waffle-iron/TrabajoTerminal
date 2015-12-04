<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ruta" value="${pageContext.request.getAttribute('javax.servlet.forward.request_uri')}" />
<c:set var="contexto" value="${pageContext.request.contextPath}" />

<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">

        <ul class="page-sidebar-menu " data-keep-expanded="false"
            data-auto-scroll="true" data-slide-speed="200">

            <li class="start ${ruta == '/trabajoterminal/' ?  'active open' : ' '}"><a href="${contexto}"> <i
                    class="icon-home"></i> <span class="title">Principal</span>
            </a></li>

			<c:set var="contextoLogin" value="${contexto.concat('/login')}" />

			<c:set var="contextoEstadisticas" value="${contexto.concat('/estadisticas')}" />




			<li class="${( ruta == contextoLogin
                       || ruta == contextoLogin) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Iniciar sesión</span> 
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextoLogin) ?  'open' : ' '}">
                        <a href="${contexto}/login">
                            Iniciar sesión
                        </a>
                    </li>
                    
                </ul>
            </li>
            <li class="${( ruta == contextoEstadisticas
                       || ruta == contextoEstadisticas) ?  'active' : ' '}">
                <a href="javascript:;"> <i
                    class="icon-rocket"></i> <span class="title">Estadisticas del sistema</span> 
                </a>
                <ul class="sub-menu">
                    <li class="${( ruta == contextoEstadisticas) ?  'open' : ' '}">
                        <a href="${contexto}/estadisticas">
                            Estadisticas del Sistema
                        </a>
                    </li>
                    
                </ul>
            </li>







            
            
            
            
            
            
            
            
            

        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
</div>