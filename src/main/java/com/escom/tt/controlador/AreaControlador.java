package com.escom.tt.controlador;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.escom.tt.modelo.Area;
import com.escom.tt.repositorio.AreaRepositorio;

@Controller
public class AreaControlador {
	@Autowired
	private AreaRepositorio areaRepositorio;
	
	@RequestMapping(value = "/area/crear", method = RequestMethod.GET)
	public String crearArea(Model modelo){
		modelo.addAttribute("area", new Area());
		return "area/area-crear";
	}
	
	@RequestMapping(value = "/area/guardar", method = RequestMethod.POST)
	public String guardar(@ModelAttribute("area") @Valid Area area, Model modelo, BindingResult validacion){
		String ruta = null;
		if (validacion.hasErrors()){
			modelo.addAttribute("area", area);
			ruta = "area/area-crear";
		}else{
			Integer id = areaRepositorio.crearArea(area);
			ruta = "redirect:/area/ver/" + area.getIdArea()+ "/?creado=true";
		}
		
		return ruta;
	}
	
	@RequestMapping(value = "/area/guardarCambios", method = RequestMethod.POST)
	public String guardarCambios(@ModelAttribute("area") @Valid Area area, Model modelo, BindingResult validacion){
		String ruta = null;
		if (validacion.hasErrors()){
			modelo.addAttribute("area", area);
			ruta = "area/area-editar";
		}else{
			Integer id = areaRepositorio.actualizarArea(area);
			ruta = "redirect:/area/ver/"+ area.getIdArea()+ "/?actualizado=true";
		}
		
		return ruta;
	}
	
	@RequestMapping(value = "/area/{areaId:[0-9]+}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable Integer areaId, Model modelo){
		String ruta = null;
		Area area = null;
		System.out.println(areaId+"***********");
		area = areaRepositorio.buscarPorId(areaId);
		System.out.println(area.getNombre()+"***********"+area.getIdArea());
		if (area!=null){
			modelo.addAttribute("area", area);
			ruta = "area/area-editar";
		}else{
			ruta = "redirect:/area";
		}
		System.out.println("editar" + ruta);
		return ruta;
	}
	
	@RequestMapping(value = "/area/ver/{areaId:[0-9]+}", method = RequestMethod.GET)
	public String ver(@PathVariable Integer areaId, Model modelo, Boolean actualizado, Boolean creado){
		String ruta = null;
		Area area = null;
		area = areaRepositorio.buscarPorId(areaId);
		if (area != null){
			modelo.addAttribute("area", area);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "area/area-ver";
		}else {
			ruta = "redirect:/area";
		}
		return ruta;
	}
	
	@RequestMapping(value = "/area/eliminar/{areaId:[0-9]+}", method = RequestMethod.GET)
	public String eliminar (@PathVariable Integer areaId, Model modelo){
		areaRepositorio.eliminarArea(areaRepositorio.buscarPorId(areaId));
		modelo.addAttribute("mensaje", "El area ha sido eliminado");
		return "area/area-eliminar";
	}
	
	@RequestMapping(value = "/area")
	public String verTodos(Model modelo){
		List<Area> areas= null;
		areas = areaRepositorio.obtenerTodos();
		modelo.addAttribute("areas", areas);
		return "area/area-todos";
		
	}
	
	
}
