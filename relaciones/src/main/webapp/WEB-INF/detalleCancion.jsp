<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Canciones</title>
        <link rel="stylesheet" href="/css/styles.css">
    </head>
    <body>
        <div class="nav">
            <h1>Detalles de la Canción</h1>
            <table border="1">
                <tr>
                    <th>Título</th>
                    <th>Artista</th>
                    <th>Album</th>
                    <th>Género</th>
                    <th>Idioma</th>
                    <th>Fecha de Creación</th>
                    <th>Fecha de Actualización</th>
                </tr>
                <tr>
                    <td>${cancion.titulo}</td>
                    <td>${cancion.artista}</td>
                    <td>${cancion.album}</td>
                    <td>${cancion.genero}</td>
                    <td>${cancion.idioma}</td>
                    <td>${cancion.fechaCreacion}</td>
                    <td>${cancion.fechaActualizacion}</td>
                </tr>
            </table>
            <button onclick="location.href='/canciones'">Volver a la lista</button>
            <button onclick="location.href='/canciones/formulario/editar/${cancion.id}'">Editar Canción</button>
            <button onclick="location.href='/canciones/eliminar/${cancion.id}'">Eliminar Canción</button>
        </div>
    </body>
</html>