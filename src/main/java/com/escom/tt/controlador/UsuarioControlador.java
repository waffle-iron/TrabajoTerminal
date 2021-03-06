package com.escom.tt.controlador;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.escom.tt.modelo.Idioma;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.escom.tt.modelo.ColaboradorProyecto;
import com.escom.tt.modelo.Correo;
import com.escom.tt.modelo.Invitacion;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.BusquedaRepositorio;
import com.escom.tt.repositorio.CorreoRepositorio;
import com.escom.tt.repositorio.EscuelaRepositorio;
import com.escom.tt.repositorio.GradoRepositorio;
import com.escom.tt.repositorio.InvitacionRepositorio;
import com.escom.tt.repositorio.ProyectoRepositorio;
import com.escom.tt.repositorio.UsuarioRepositorio;

@Controller
@RequestMapping("/")
@SessionAttributes("totalRecibidos,totalInvitaciones,totalProyectos")
public class UsuarioControlador {

	@Autowired
	private UsuarioRepositorio usuarioRepositorio;

	@Autowired
	private EscuelaRepositorio escuelaRepositorio;

	@Autowired
	private GradoRepositorio gradoRepositorio;

	@Autowired
	private ProyectoRepositorio proyectoRepositorio;
	
	@Autowired
	private CorreoRepositorio correoRepositorio;
	
	@Autowired
	private InvitacionRepositorio invitacionRepositorio;
	
    @Autowired    
    private BusquedaRepositorio busquedaRepositorio;
    

	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public String registrarse(Model modelo) {

		modelo.addAttribute("usuario", new Usuario());
		modelo.addAttribute("escuelaList", escuelaRepositorio.obtenerTodos());
		modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
		return "registro";
	}

	@RequestMapping(value = "/usuario/crear", method = RequestMethod.GET)
	public String crear(Model modelo) {

		modelo.addAttribute("usuario", new Usuario());
		modelo.addAttribute("escuelaList", escuelaRepositorio.obtenerTodos());
		modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
		return "usuario/usuario-crear";
	}

	@RequestMapping(value = "/usuario/crear", method = RequestMethod.POST)
	public String crear(@ModelAttribute("usuario") @Valid Usuario usuario,
			BindingResult validacion, Model modelo) throws ParseException {
		String ruta = null;
		String mensaje1 = null;
		String mensaje2 = null;
		if (validacion.hasErrors()) {
			System.err.println(validacion.getAllErrors());
			modelo.addAttribute("usuario", usuario);
			modelo.addAttribute("escuelaList",
					escuelaRepositorio.obtenerTodos());
			modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
			modelo.addAttribute("mensajeFechas", mensaje1);
			modelo.addAttribute("mensajeFechasIngreso", mensaje2);
			ruta = "registro";
		} else {
			Date fechaActual = new Date();
			SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy"); 
			String fecha14años = "01/01/2002";
			Date fecha14añosDate = formateador.parse(fecha14años);
					
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(usuario.getFechaNacimiento());
			calendar.add(Calendar.YEAR, 15);
			
			Date fechaNacMas15Años = calendar.getTime(); 
			
			boolean fecha = usuario.getFechaIngresoIPN().before(fechaNacMas15Años);
			if(fecha14añosDate.before(usuario.getFechaNacimiento()) ){
				mensaje1 = "Debes tener mas de 15 años para ingresar al sistema";
				mensaje2 = "";
				modelo.addAttribute("usuario", usuario);
				modelo.addAttribute("escuelaList",
						escuelaRepositorio.obtenerTodos());
				modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
				modelo.addAttribute("mensajeFechas", mensaje1);
				modelo.addAttribute("mensajeFechasIngreso", mensaje2);
				ruta = "registro";
			}else if(usuario.getFechaIngresoIPN().before(fechaNacMas15Años)){
				mensaje1 = "";
				mensaje2 = "Verifica tu fecha de ingreso al IPN";
				modelo.addAttribute("usuario", usuario);
				modelo.addAttribute("escuelaList",
						escuelaRepositorio.obtenerTodos());
				modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
				modelo.addAttribute("mensajeFechas", mensaje1);
				modelo.addAttribute("mensajeFechasIngreso", mensaje2);
				ruta = "registro";
				
			}else{
			
			usuario.setEvaluacion(10);
			usuario.setActivo(true);
			usuario.setRol("ROLE_ADMIN");

			/*
			 * BCryptPasswordEncoder passwordEncoder = new
			 * BCryptPasswordEncoder(); String encript =
			 * passwordEncoder.encode("123"); usuario.setPassword(encript);
			 */

			Integer id = usuarioRepositorio.crearUsuario(usuario);
			System.err.println("NO HUBO ERRORES");
			ruta = "redirect:/login/?creado=true";
			}
		}
		return ruta;
	}

	@RequestMapping(value = "/usuario/guardarCambios", method = RequestMethod.POST)
	public String actualizar(@ModelAttribute("usuario") @Valid Usuario usuario,
			BindingResult validacion, Model modelo) throws ParseException {
		String ruta = null;
		usuario.setRol("ROLE_ADMIN");
		usuario.setIdiomas(null);
		String mensaje1 = null;
		String mensaje2 = null;
		if (validacion.hasErrors()) {
			modelo.addAttribute("usuario", usuario);
			System.err.println(validacion.getAllErrors());

			modelo.addAttribute("escuelaList", escuelaRepositorio.obtenerTodos());
			modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
			modelo.addAttribute("mensajeFechas", mensaje1);
			modelo.addAttribute("mensajeFechasIngreso", mensaje2);
			ruta = "usuario/usuario-editar";
		} else {
			Date fechaActual = new Date();
			SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy"); 
			String fecha14años = "01/01/2002";
			Date fecha14añosDate = formateador.parse(fecha14años);
					
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(usuario.getFechaNacimiento());
			calendar.add(Calendar.YEAR, 15);
			
			Date fechaNacMas15Años = calendar.getTime(); 
			
			boolean fecha = usuario.getFechaIngresoIPN().before(fechaNacMas15Años);
			if(fecha14añosDate.before(usuario.getFechaNacimiento()) ){
				mensaje1 = "Debes tener mas de 15 años para ingresar al sistema";
				mensaje2 = "";
				modelo.addAttribute("usuario", usuario);
				modelo.addAttribute("escuelaList",
						escuelaRepositorio.obtenerTodos());
				modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
				modelo.addAttribute("mensajeFechas", mensaje1);
				modelo.addAttribute("mensajeFechasIngreso", mensaje2);
				ruta = "usuario/usuario-editar";
			}else if(usuario.getFechaIngresoIPN().before(fechaNacMas15Años)){
				mensaje1 = "";
				mensaje2 = "Verifica tu fecha de ingreso al IPN";
				modelo.addAttribute("usuario", usuario);
				modelo.addAttribute("escuelaList",
						escuelaRepositorio.obtenerTodos());
				modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
				modelo.addAttribute("mensajeFechas", mensaje1);
				modelo.addAttribute("mensajeFechasIngreso", mensaje2);
				ruta = "usuario/usuario-editar";
				
			}else{
			
			
			Integer id = usuarioRepositorio.actualizarUsuario(usuario);
			ruta = "redirect:/usuario/perfil/";
		}
		}
		return ruta;
	}

	@RequestMapping(value = "/usuario/{usuarioId:[0-9]+}/editar", method = RequestMethod.GET)
	public String actualizar(Principal principal, @PathVariable Integer usuarioId, Model modelo) {
		Usuario usuario = null;
		String ruta = null;
		String nombre = principal.getName();
		usuario = usuarioRepositorio.buscarPorId(usuarioId);

		if (usuario != null && usuario.getEmail().equals(principal.getName())) {
			modelo.addAttribute("usuario", usuario);
			modelo.addAttribute("escuelaList",
					escuelaRepositorio.obtenerTodos());
			modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
			modelo.addAttribute("nombre", nombre);

			ruta = "usuario/usuario-editar";
		} else
			ruta = "redirect:/usuario";

		return ruta;
	}

	@RequestMapping(value = "/usuario/ver/{usuarioId:[0-9]+}")
	public String ver(@PathVariable Integer usuarioId, Model modelo,
			Boolean actualizado, Boolean creado, Principal principal) {
		String ruta = null;
		Usuario usuario = null;
		String nombre = principal.getName();


		usuario = usuarioRepositorio.buscarPorId(usuarioId);
		if (usuario != null) {
			modelo.addAttribute("usuario", usuario);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			modelo.addAttribute("nombre", nombre);
			
			ruta = "usuario/usuario-ver";
		} else
			ruta = "redirect:/usuario";

		return ruta;
	}

	@RequestMapping(value = "/usuario/eliminar/{usuarioId:[0-9]+}")
	public String eliminar(@PathVariable Integer usuarioId, Model modelo) {

		usuarioRepositorio.eliminarUsuario(usuarioRepositorio
				.buscarPorId(usuarioId));
		modelo.addAttribute("mensaje", "Se ha eliminado el usuario");
		return "usuario/usuario-eliminar";
	}

	@RequestMapping(value = "/usuario")
	public String verTodos(Model modelo) {

		List<Usuario> usuarioList = null;

		usuarioList = usuarioRepositorio.obtenerTodos();

		modelo.addAttribute("usuarioList", usuarioList);

		return "usuario/usuario-todos";
	}

	@RequestMapping(value = "/usuario/perfil")
	public String verMiPerfil(Principal principal, Model modelo,
			Boolean actualizado, Boolean creado,HttpSession session) {
		String ruta = null;
		Usuario usuario = null;
		String nombre = null;
		nombre = principal.getName();
		
		//---solo para saber el numero de invitaciones
		List<Invitacion> invitacionList = null;
		ColaboradorProyecto colaboradorProyecto = null;
        colaboradorProyecto = new ColaboradorProyecto(usuarioRepositorio.buscarPorCorreo(principal.getName()));
        invitacionList = invitacionRepositorio.obtenerPorUsuario(colaboradorProyecto);
        int totalInvitaciones = invitacionList.size();
        //--------------
        //---para numero de proyectos
        List<Proyecto> proyectosDeCoordinador = null;
    	Usuario usuarioTemp0=busquedaRepositorio.buscarPorEmail(nombre);
    	proyectosDeCoordinador=busquedaRepositorio.buscarPorCoordinador(usuarioTemp0);
        
		
		Usuario usuarioTemp = new Usuario();
		usuarioTemp = usuarioRepositorio.buscarPorCorreo(nombre);
		
		List<Correo> correoListRecibidos = correoRepositorio.obtenerCorreosPropiosRecibidos(usuarioTemp);
		int totalRecibidos = correoListRecibidos.size();
		if (principal!= null){
			
		
		nombre = principal.getName();
		}
		
		List<Proyecto> proyectos = null;
		List<Proyecto> proyectosLikeColaborador = null;


		if (nombre != null) {
			// así logramos traer la información del usuario que está en la
			// sesión
			usuario = usuarioRepositorio.buscarPorCorreo(nombre);
			proyectos = proyectoRepositorio.buscarPorCoordinador(usuario);
			proyectosLikeColaborador = proyectoRepositorio.obtenerPorColaborador(new ColaboradorProyecto(usuarioTemp0));


			System.out.println(proyectos);
		}

		else {
			ruta = "redirect:/";
		}
		System.out.println(usuario);
		if (usuario != null) {
			modelo.addAttribute("usuario", usuario);
			modelo.addAttribute("proyectos", proyectos);
			modelo.addAttribute("proyectosLikeColaborador", proyectosLikeColaborador);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			modelo.addAttribute("nombre", nombre);
			session.setAttribute("totalRecibidos", totalRecibidos);
			session.setAttribute("totalInvitaciones", totalInvitaciones);
			session.setAttribute("totalProyectos", proyectosDeCoordinador.size());
			
			
			
			ruta = "usuario/usuario-perfil";
		} else
			ruta = "redirect:/usuario";

		return ruta;
	}

	@RequestMapping(value="/usuario/invitar/{usuarioId:[0-9]+}", method = RequestMethod.GET)
    public String invitarUsuario(@PathVariable Integer usuarioId, Model modelo, Principal principal, Integer error) {
        Usuario usuario = null;
        List<Proyecto> misProyectos = null;
        String mensaje = null;
        Usuario usuarioAInvitar = null;

        usuarioAInvitar = usuarioRepositorio.buscarPorId(usuarioId);
        usuario = usuarioRepositorio.buscarPorCorreo(principal.getName());
        misProyectos = proyectoRepositorio.buscarPorCoordinador(usuario);

        if (misProyectos != null && usuarioAInvitar !=null){
            modelo.addAttribute("misProyectos", misProyectos);
        	modelo.addAttribute("usuarioAInvitar", usuarioAInvitar);

        }else{
            modelo.addAttribute("mensaje", "No tienes proyectos aun");
            modelo.addAttribute("error", error);
            modelo.addAttribute("misProyectos", misProyectos);
       		modelo.addAttribute("usuarioAInvitar", usuarioAInvitar);
        }
        return "usuario/usuario-invitar";
    }
	@RequestMapping(value = "/relacion-de-usuarios")
	public String mostrarUsuariosRelacionados(Principal principal, Model model){
		Map<String, List<Usuario>> usuarioMap = new HashMap<String, List<Usuario>>(); ;
		List<Usuario> usuarios = null;
		Usuario usuario = null;
		String nombre = principal.getName();



		if (principal != null)
			usuario = usuarioRepositorio.buscarPorCorreo(principal.getName());

		if (usuario != null) {
			usuarioMap.put("Escuela " + usuario.getEscuela().getNombre(), usuarioRepositorio.obtenerPorRelacionEscuela(usuario.getEscuela(), nombre));

			usuarioMap.put("Grado " + usuario.getGrado().getNombre(), usuarioRepositorio.obtenerPorRelacionGradoAcademico(usuario.getGrado(), nombre));
			for (Idioma idioma : usuario.getIdiomas())
				usuarioMap.put("Idioma " + idioma.getNombre(), usuarioRepositorio.obtenerPorRelacionIdioma(idioma, nombre));
		}
		model.addAttribute("mapa", usuarioMap);
		model.addAttribute("nombre", nombre);
		

		return "usuario/usuario-relaciones";
	}

}
