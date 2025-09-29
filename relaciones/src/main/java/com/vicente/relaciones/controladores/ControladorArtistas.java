package com.vicente.relaciones.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.vicente.relaciones.modelos.Artista;
import com.vicente.relaciones.servicios.ServicioArtistas;

import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ControladorArtistas {

    @Autowired
    private ServicioArtistas servicioArtistas;

    @GetMapping("/artistas")
    public String desplegarArtistas(Model listaArtistas) {
        listaArtistas.addAttribute("artistas", servicioArtistas.obtenerTodosLosArtistas());
        return "artistas";
    }

    @GetMapping("/artistas/detalle/{idArtista}")
    public String desplegarDetalleArtista(@PathVariable("idArtista") Long id, Model detalleArtista) {
        detalleArtista.addAttribute("artista", servicioArtistas.obtenerArtistasPorId(id));
        return "detalleArtista";
    }

    @GetMapping("/artistas/formulario/agregar")
    public String formularioAgregarArtista(@ModelAttribute("artista") Artista artista) {
        return "agregarArtista";
    }

    @PostMapping("/artistas/procesa/agregar")
    public String procesarAgregarArtista(@Valid @ModelAttribute("artista") Artista artista,
                                         BindingResult validaciones) {
        if (validaciones.hasErrors()) {
            return "agregarArtista";
        }
        servicioArtistas.agregarArtista(artista);
        return "redirect:/artistas";
    }
}


