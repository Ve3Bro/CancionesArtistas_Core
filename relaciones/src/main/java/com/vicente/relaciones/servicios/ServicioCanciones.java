package com.vicente.relaciones.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vicente.relaciones.modelos.Cancion;
import com.vicente.relaciones.repositorios.RepositorioCanciones;

@Service
public class ServicioCanciones {
    @Autowired
    private RepositorioCanciones repo;

    public ServicioCanciones(RepositorioCanciones repo){
        this.repo = repo;
    }

    public List<Cancion> obtenerTodasLasCanciones() {
        return repo.findAll();
    }
    public Cancion obtenerCancionPorId(Long id) {
        return repo.findById(id).orElse(null);
    }
    public Cancion guardarCancion(Cancion nuevaCancion) {
        return this.repo.save(nuevaCancion);
    }
    public Cancion actualizaCancion(Cancion cancion) {
        return repo.save(cancion);
    }

    public void eliminaCancion(Long id) {
        repo.deleteById(id);
    }
}
