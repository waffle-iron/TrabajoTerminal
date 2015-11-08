package com.escom.tt.controlador;

import com.escom.tt.modelo.*;
import com.escom.tt.repositorio.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;

import javax.validation.Valid;

import java.security.Principal;
import java.security.Principal;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by darcusfenix on 15/09/15.
 */
@Controller
public class ProyectoControlador {

	@Autowired
	private ProyectoRepositorio proyectoRepositorio;

	@Autowired
	private TipoProyectoRepositorio tipoProyectoRepositorio;

	@Autowired
	private EstadoRepositorio estadoRepositorio;

	@Autowired
	private UsuarioRepositorio usuarioRepositorio;

	@Autowired
	private InvitacionRepositorio invitacionRepositorio;

	@Autowired
	private BusquedaRepositorio busquedaRepositorio;

	@Autowired
	private TareaRepositorio tareaRepositorio;

	@RequestMapping(value = "/proyecto/crear", method = RequestMethod.GET)
	public String crear(Principal principal, Model modelo) {
		Usuario coordinador = null;
		String email = principal.getName();
		String mensaje = "";
		coordinador = busquedaRepositorio.buscarPorEmail(email);
		modelo.addAttribute("coordinadorX", coordinador.getIdUsuarios());
		modelo.addAttribute("tipoProyectoList",
				tipoProyectoRepositorio.obtenerTodos());
		modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
		modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
		modelo.addAttribute("proyecto", new Proyecto());
		modelo.addAttribute("nombre", principal.getName());
		modelo.addAttribute("mensajeFechas", mensaje);
		return "proyecto/proyecto-crear";
	}

	@RequestMapping(value = "/proyecto/crear", method = RequestMethod.POST)
	public String crear(@ModelAttribute("proyecto") @Valid Proyecto proyecto,
			BindingResult validacion, Model modelo, Principal principal) {
		String ruta = null;
		String mensaje = null;

		if (validacion.hasErrors()) {
			List<ObjectError> error = validacion.getAllErrors();
			for (ObjectError objectError : error) {
				System.out.println(objectError);
			}

			proyecto.setAvance(0);

			modelo.addAttribute("proyecto", proyecto);
			modelo.addAttribute("tipoProyectoList",
					tipoProyectoRepositorio.obtenerTodos());
			modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
			modelo.addAttribute("cordinadorList",
					usuarioRepositorio.obtenerTodos());
			modelo.addAttribute("nombre", principal.getName());
			modelo.addAttribute("mensajeFechas", mensaje);
			ruta = "proyecto/proyecto-crear";
		} else {
			// validacion de fechas
			if (proyecto.getFechaFin().before(proyecto.getFechaInicio())) {
				mensaje = "La fecha de inicio es posterior a la de fin";
				proyecto.setAvance(0);

				modelo.addAttribute("proyecto", proyecto);
				modelo.addAttribute("tipoProyectoList",
						tipoProyectoRepositorio.obtenerTodos());
				modelo.addAttribute("estadoList",
						estadoRepositorio.obtenerTodos());
				modelo.addAttribute("cordinadorList",
						usuarioRepositorio.obtenerTodos());
				modelo.addAttribute("nombre", principal.getName());
				modelo.addAttribute("mensajeFechas", mensaje);
				ruta = "proyecto/proyecto-crear";
			} else {
				mensaje = "";
				proyectoRepositorio.crear(proyecto);
				ruta = "redirect:/proyecto/ver/" + proyecto.getIdProyecto()
						+ "/?creado=true";
			}

		}
		return ruta;
	}

	@RequestMapping(value = "/proyecto/guardarCambios", method = RequestMethod.POST)
	public String actualizar(
			@ModelAttribute("proyecto") @Valid Proyecto proyecto,
			BindingResult validacion, Model modelo, Principal principal) {
		String ruta = null;

		if (validacion.hasErrors()) {
			modelo.addAttribute("tipoProyectoList",
					tipoProyectoRepositorio.obtenerTodos());
			modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
			modelo.addAttribute("cordinadorList",
					usuarioRepositorio.obtenerTodos());
			modelo.addAttribute("proyecto", proyecto);
			modelo.addAttribute("nombre", principal.getName());
			ruta = "proyecto/proyecto-editar";
		} else {
			Integer id = proyectoRepositorio.actualizar(proyecto);
			modelo.addAttribute("nombre", principal.getName());
			ruta = "redirect:/proyecto/ver/" + proyecto.getIdProyecto()
					+ "/?actualizado=true";
		}
		return ruta;
	}

	@RequestMapping(value = "/proyecto/{proyectoId:[0-9]+}/editar", method = RequestMethod.GET)
	public String actualizar(@PathVariable Integer proyectoId, Model modelo,
			Principal principal) {
		Usuario coordinador = null;
		String email = principal.getName();
		coordinador = busquedaRepositorio.buscarPorEmail(email);
		modelo.addAttribute("coordinadorX", coordinador.getIdUsuarios());

		Proyecto proyecto = null;
		String ruta = null;
		proyecto = proyectoRepositorio.buscarPorId(proyectoId);
		proyecto.setCoordinador(coordinador);
		if (proyecto != null) {
			modelo.addAttribute("tipoProyectoList",
					tipoProyectoRepositorio.obtenerTodos());
			modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
			modelo.addAttribute("coordinadorId", coordinador.getIdUsuarios());
			// modelo.addAttribute("cordinadorList",
			// usuarioRepositorio.obtenerTodos());

			modelo.addAttribute("proyecto", proyecto);
			modelo.addAttribute("nombre", principal.getName());
			ruta = "proyecto/proyecto-editar";
		} else
			ruta = "redirect:/proyecto";

		return ruta;
	}

	@RequestMapping(value = "/proyecto/ver/{proyectoId:[0-9]+}")
	public String ver(@PathVariable Integer proyectoId, Model modelo,
			Boolean actualizado, Boolean creado, Principal principal) {
		String ruta = null;
		Proyecto proyecto = null;

		proyecto = proyectoRepositorio.buscarPorId(proyectoId);
		if (proyecto != null) {
			modelo.addAttribute("proyecto", proyecto);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			modelo.addAttribute("nombre", principal.getName());
			modelo.addAttribute("proyecto", proyecto);
			modelo.addAttribute("nombre", principal.getName());

			ruta = "proyecto/proyecto-ver";
		} else
			ruta = "redirect:/proyecto";

		return ruta;
	}

	@RequestMapping(value = "/proyecto/eliminar/{proyectoId:[0-9]+}")
	public String eliminar(@PathVariable Integer proyectoId, Model modelo,
			Principal principal) {
		Boolean eliminado;
		Proyecto proyecto = null;
		proyecto = proyectoRepositorio.buscarPorId(proyectoId);

		if (proyecto != null) {
			proyectoRepositorio.eliminar(proyecto);
			eliminado = true;
		} else {
			eliminado = false;
		}

		return "redirect:/proyecto?eliminado=" + eliminado;
	}

	@RequestMapping(value = "/proyecto")
	public String verTodos(Model modelo, Boolean eliminado, Principal principal) {

		String email = principal.getName();

		List<Proyecto> proyectosDeCoordinador = null;
		Usuario usuarioTemp = busquedaRepositorio.buscarPorEmail(email);
		proyectosDeCoordinador = busquedaRepositorio
				.buscarPorCoordinador(usuarioTemp);

		// List<Proyecto> proyectoList = null;
		// proyectoList = proyectoRepositorio.obtenerTodos();

		modelo.addAttribute("proyectosList", proyectosDeCoordinador);
		modelo.addAttribute("eliminado", eliminado);
		modelo.addAttribute("nombre", principal.getName());
		modelo.addAttribute("idd", email);

		return "proyecto/proyecto-todos";
	}

	@RequestMapping(value = "/proyecto/test-add-colaborador")
	public String addColaborador(Model modelo, Boolean eliminado) {

		Usuario usuario = usuarioRepositorio.buscarPorId(1);
		Proyecto proyecto = proyectoRepositorio.buscarPorId(1);
		ColaboradorProyecto colaboradorProyecto = new ColaboradorProyecto(
				proyecto, usuario);
		proyectoRepositorio.addColaborador(colaboradorProyecto);

		return "proyecto/proyecto-todos";
	}

	@RequestMapping(value = "/proyecto/{proyectoId:[0-9]+}/colaboradores", method = RequestMethod.GET)
	public String mostrarColaboradores(@PathVariable Integer proyectoId,
			Model modelo, Principal principal) {
		Usuario usuario = null;
		Proyecto miProyecto = null;

		usuario = usuarioRepositorio.buscarPorCorreo(principal.getName());
		miProyecto = proyectoRepositorio.buscarPorId(proyectoId);

		if (miProyecto != null
				&& !miProyecto.getCoordinador().getEmail()
						.equals(usuario.getEmail()))
			return "redirect:/logout";

		modelo.addAttribute("miProyecto", miProyecto);
		;
		return "proyecto/proyecto-colaboradores";
	}

	@RequestMapping(value = "/proyecto/asignar-tarea", method = RequestMethod.POST)
	public String asignarTarea(@ModelAttribute("tarea") @Valid Tarea tarea,
			BindingResult validacion, Model modelo, Principal principal) {
		Usuario coordinador = null;
		Usuario usuarioTarea = null;
		Proyecto miProyecto = null;
		String ruta = "";

		miProyecto = proyectoRepositorio.buscarPorId(tarea
				.getColaboradorProyecto().getProyecto().getIdProyecto());
		usuarioTarea = usuarioRepositorio.buscarPorId(tarea
				.getColaboradorProyecto().getUsuario().getIdUsuarios());
		coordinador = miProyecto.getCoordinador();

		tarea.setEstado(1);
		tarea.setAvance(1);
		tarea.setFechaEntrega(new Date());
		tarea.setColaboradorProyecto(new ColaboradorProyecto(miProyecto,
				usuarioTarea));

		if (miProyecto == null
				|| !miProyecto.getCoordinador().getEmail()
						.equals(coordinador.getEmail()))
			ruta = "redirect:/";

		if (validacion.hasErrors()) {
			modelo.addAttribute("tarea", tarea);
			ruta = "redirect:/proyecto/" + miProyecto.getIdProyecto()
					+ "/asignar-tarea/" + usuarioTarea.getIdUsuarios()
					+ "?creado=false";
		} else {
			tareaRepositorio.crear(tarea);
			ruta = "redirect:/proyecto/" + miProyecto.getIdProyecto()
					+ "/asignar-tarea/" + usuarioTarea.getIdUsuarios()
					+ "?creado=true";
		}

		return ruta;
	}

	@RequestMapping(value = "/proyecto/{proyectoId:[0-9]+}/asignar-tarea/{colaboradorId:[0-9]+}", method = RequestMethod.GET)
	public String asignarTarea(@PathVariable Integer proyectoId,
			@PathVariable Integer colaboradorId, Model modelo,
			Principal principal, boolean creado) {
		Usuario coordinador = null;
		Usuario usuarioTarea = null;
		Proyecto miProyecto = null;
		Tarea tarea = null;
		String ruta = "";

		coordinador = usuarioRepositorio.buscarPorCorreo(principal.getName());
		usuarioTarea = usuarioRepositorio.buscarPorId(colaboradorId);
		miProyecto = proyectoRepositorio.buscarPorId(proyectoId);

		if (miProyecto == null
				|| !miProyecto.getCoordinador().getEmail()
						.equals(coordinador.getEmail()))
			ruta = "redirect:/";

		for (Iterator<ColaboradorProyecto> colaborador = miProyecto
				.getColaboradorProyectos().iterator(); colaborador.hasNext();)
			if (colaborador.next().getUsuario().getIdUsuarios() == colaboradorId) {
				tarea = new Tarea();
				tarea.setColaboradorProyecto(new ColaboradorProyecto(
						miProyecto, usuarioTarea));
				modelo.addAttribute("tarea", tarea);
				// modelo.addAttribute("colaborador",
				// colaborador.next().getUsuario().getNombreUsuario());
				ruta = "proyecto/proyecto-tarea";
				break;
			}
		modelo.addAttribute("creado", creado);
		return ruta;
	}

	@RequestMapping(value = "/proyecto/invitar", method = RequestMethod.GET)
	public String invitar(Model modelo, Principal principal, Integer error) {
		Usuario usuario = null;
		List<Proyecto> misProyectos = null;
		String mensaje = null;

		usuario = usuarioRepositorio.buscarPorCorreo(principal.getName());
		misProyectos = proyectoRepositorio.buscarPorCoordinador(usuario);

		if (misProyectos != null)
			modelo.addAttribute("misProyectos", misProyectos);
		else
			modelo.addAttribute("mensaje", "No tienes proyectos aun");
		modelo.addAttribute("error", error);
		return "proyecto/proyecto-invitar";
	}

	@RequestMapping(value = "/proyecto/crearInvitacion", method = RequestMethod.GET)
	public String crearInvitacion(
			@RequestParam(required = true) String correoUsuario,
			@RequestParam(required = true) Integer proyectoId, Model modelo,
			Principal principal) {

		Proyecto proyecto = null;
		Usuario usuarioAInvitar = null;
		boolean estaColaborador = false;
		Integer error = 4;

		if (correoUsuario == null || proyectoId == null)
			return "redirect:/proyecto/invitar?error=" + error;

		proyecto = proyectoRepositorio.buscarPorId(proyectoId);
		usuarioAInvitar = usuarioRepositorio
				.buscarPorCorreoORNombreUsuario(correoUsuario);

		// no existe el usuario
		if (usuarioAInvitar == null)
			error = 1;

		// valida que el coordinador sea el mismo de la sesión
		if (proyecto != null
				&& usuarioAInvitar != null
				&& principal.getName().equals(
						proyecto.getCoordinador().getEmail())) {

			// valida si el usuario ya está como colaborador
			for (Iterator<ColaboradorProyecto> colaborador = proyecto
					.getColaboradorProyectos().iterator(); colaborador
					.hasNext();)
				if (colaborador.next().getUsuario().getIdUsuarios() == usuarioAInvitar
						.getIdUsuarios()) {
					error = 2;
					estaColaborador = true;
				}

			ColaboradorProyecto colaboradorProyecto = new ColaboradorProyecto(
					proyecto, usuarioAInvitar);
			Invitacion invitacion = new Invitacion();
			invitacion.setEstado(1);
			invitacion.setFecha(new Date());
			invitacion.setColaboradorProyecto(colaboradorProyecto);

			if (!estaColaborador)
				proyectoRepositorio.addColaborador(colaboradorProyecto);

			invitacionRepositorio.crear(invitacion);
			error = 3;
		}

		return "redirect:/proyecto/invitar?error=" + error;
	}

	@RequestMapping(value = "/proyecto/propio/{proyectoId:[0-9]+}", method = RequestMethod.GET)
	public String consultarProyectoPropio(@PathVariable Integer proyectoId,
			Model modelo, Boolean actualizado, Boolean creado,
			Principal principal) {

		String ruta = null;
		Usuario usuario = null;
		List<Tarea> tareaList = null;
		Proyecto proyecto = null;

		usuario = usuarioRepositorio.buscarPorCorreo(principal.getName());
		proyecto = proyectoRepositorio.buscarPorId(proyectoId);

		if (proyecto != null) {

			if (proyecto.getCoordinador().getEmail().equals(usuario.getEmail())) {
				if (principal.getName().equals(proyecto.getCoordinador().getEmail())){
					tareaList = tareaRepositorio.obtenerPorProyecto(new ColaboradorProyecto(proyecto));
				
				modelo.addAttribute("tareasList", tareaList);
				modelo.addAttribute("proyecto", proyecto);
				ruta = "proyecto/proyecto-propio";
				}
			}
		} else {
			ruta = "redirect:/usuario/perfil";
		}

		return ruta;
	}

	@RequestMapping(value = "/proyecto/{proyectoId:[0-9]+}/tareas-asignadas", method = RequestMethod.GET)
	public String tareasAsignadas(@PathVariable Integer proyectoId,
			Model modelo, Principal principal) {
		List<Tarea> tareaList = null;
		Proyecto proyecto = null;
		proyecto = proyectoRepositorio.buscarPorId(proyectoId);
		// valida que el coordinador sea el mismo de la sesión
		if (proyecto != null
				&& principal.getName().equals(
						proyecto.getCoordinador().getEmail()))
			tareaList = tareaRepositorio
					.obtenerPorProyecto(new ColaboradorProyecto(proyecto));
		modelo.addAttribute("tareasList", tareaList);
		return "proyecto/proyecto-tareas";
	}

	@RequestMapping(value = "/proyecto/eliminarColaborador/{proyectoId:[0-9]+}/{usuarioId:[0-9]+}")
	public String eliminarColaborador(@PathVariable Integer proyectoId,
			@PathVariable Integer usuarioId, Model modelo, Principal principal) {
		Boolean eliminado = false;
		Boolean eliminadoTarea = false;
		Boolean eliminadoInvitacion = false;
		Boolean eliminadoColaboracion = false;
		Proyecto proyecto = null;
		Usuario usuario = null;
		String ruta = null;
		usuario = usuarioRepositorio.buscarPorId(usuarioId);

		proyecto = proyectoRepositorio.buscarPorId(proyectoId);

		if (usuario != null && proyecto != null) {
			ColaboradorProyecto colaboradorProyecto = new ColaboradorProyecto(
					proyecto, usuario);

			eliminadoTarea = tareaRepositorio
					.eliminarAsignaciones(colaboradorProyecto);
			eliminadoInvitacion = invitacionRepositorio
					.eliminarInvitacionColaborador(colaboradorProyecto);
			eliminadoColaboracion = proyectoRepositorio
					.eliminarInvitacionColaborador(colaboradorProyecto);
		}

		eliminado = true;
		if (eliminadoTarea && eliminadoTarea && eliminadoColaboracion) {
			ruta = "redirec:/proyecto/";
		} else {
			ruta = "redirec:/";
		}

		return "redirect:/proyecto?eliminado=" + eliminado;
	}

}
