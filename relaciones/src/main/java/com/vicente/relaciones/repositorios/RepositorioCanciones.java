package com.vicente.relaciones.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.vicente.relaciones.modelos.Cancion;

@Repository
public interface RepositorioCanciones extends CrudRepository<Cancion, Long> {  
    
    List<Cancion> findAll();

    Cancion save(Cancion cancion);

    void deleteById(Long id);
}
