package com.escom.tt.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escom.tt.modelo.Area;
import com.escom.tt.servicio.AreaServicio;

@Controller
public class AreaControlador {

	@Autowired(required=true)
	private AreaServicio areaServicio;
	
	@RequestMapping(value="/areas")
	public String areas(Model modelo){
		List<Area> areas = null;
		areas = areaServicio.mostrarTodas();
		modelo.addAttribute("areas",areas);
		
		return "areas";
	}
}
