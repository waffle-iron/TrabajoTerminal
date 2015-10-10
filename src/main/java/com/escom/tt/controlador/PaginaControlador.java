package com.escom.tt.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by darcusfenix on 10/9/15.
 */
@Controller
public class PaginaControlador {

    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String login(Model modelo){

        return "login";
    }
    @RequestMapping(value="/", method = RequestMethod.GET)
    public String index(Model modelo){

        return "index";
    }
}
