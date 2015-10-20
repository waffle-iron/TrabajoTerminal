package com.escom.tt.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

/**
 * Created by darcusfenix on 10/9/15.
 */
@Controller
public class PaginaControlador {

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String login(Boolean valido, Model modelo){

        modelo.addAttribute("valido",valido);

        return "login";
    }
    @RequestMapping(value="/", method = RequestMethod.GET)
    public String index(Principal principal, Model model){

        if (principal != null) {
            model.addAttribute("nombre",principal.getName());
        }
        return "index";

    }
    @RequestMapping(value="/error-403", method = RequestMethod.GET)
    public String error404(){
        return "error-403";
    }
    @RequestMapping(value="/error-404", method = RequestMethod.GET)
    public String error403(){
        return "error-404";
    }
}
