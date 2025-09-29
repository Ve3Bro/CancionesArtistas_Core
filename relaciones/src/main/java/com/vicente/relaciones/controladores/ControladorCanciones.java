package com.vicente.relaciones.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.vicente.relaciones.modelos.Artista;
import com.vicente.relaciones.modelos.Cancion;
import com.vicente.relaciones.servicios.ServicioArtistas;
import com.vicente.relaciones.servicios.ServicioCanciones;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class ControladorCanciones {

    @Autowired
    private ServicioCanciones servicioCanciones;

    @Autowired
    private ServicioArtistas servicioArtistas;

    @GetMapping("/")
    public String redirigirInicio() {
        return "redirect:/canciones";
    }

    @GetMapping("/canciones")
    public String desplegarCanciones(Model listaCanciones) {
        listaCanciones.addAttribute("canciones", servicioCanciones.obtenerTodasLasCanciones());
        return "canciones";
    }

    @GetMapping("/canciones/detalle/{id}")
    public String desplegarDetalleCancion(@PathVariable Long id, Model modelo) {
        modelo.addAttribute("cancion", servicioCanciones.obtenerCancionPorId(id));
        return "detalleCancion";
    }

    @GetMapping("/canciones/formulario/agregar")
    public String formularioAgregarCanciones(@ModelAttribute("cancion") Cancion cancion, Model artista) {
        List<Artista> artistas = servicioArtistas.obtenerTodosLosArtistas();
        artista.addAttribute("artistas", artistas);
        return "agregarCanciones";
    }

    @PostMapping("/canciones/procesa/agregar")
    public String procesarAgregarCancion(@Valid @ModelAttribute("cancion") Cancion nuevaCancion,
                                         BindingResult validaciones,
                                         @RequestParam("idArtista")Long idArtista) {
        if (validaciones.hasErrors()) {
            return "agregarCanciones";
        }
        Artista artista = servicioArtistas.obtenerArtistasPorId(idArtista);
        this.servicioCanciones.guardarCancion(nuevaCancion);
        return "redirect:/canciones";
    }

    @GetMapping("/canciones/formulario/editar/{id}")
    public String formularioEditarCancion(@PathVariable Long id, Model modelo) {
        Cancion cancion = servicioCanciones.obtenerCancionPorId(id);
        modelo.addAttribute("cancion", cancion);
        return "editarCancion";
    }

    @PostMapping("/canciones/procesa/editar/{id}")
    public String procesarEditarCancion(@PathVariable Long id,
                                        @Valid @ModelAttribute("cancion") Cancion cancion,
                                        BindingResult validaciones) {
        if (validaciones.hasErrors()) {
            return "editarCancion";
        }

        cancion.setId(id);
        this.servicioCanciones.actualizaCancion(cancion);
        return "redirect:/canciones";
    }

    @GetMapping("/canciones/eliminar/{id}")
    public String procesarEliminarCancion(@PathVariable Long id) {
    servicioCanciones.eliminaCancion(id);
    return "redirect:/canciones";
    }
}
