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
            <h1>Lista de Canciones</h1>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Artista</th>
                    <th>Detalles</th>
                </tr>
                <c:forEach var="cancion" items="${canciones}">
                    <tr>
                        <td>${cancion.id}</td>
                        <td>${cancion.titulo}</td>
                        <td>${cancion.artista.nombre} ${cancion.artista.apellido}</td>
                        <td><button onclick="location.href='canciones/detalle/${cancion.id}'">Ver Detalles</button></td>
                    </tr>
                </c:forEach>
            </table>
            <button onclick="location.href='/canciones/formulario/agregar'">Agregar Nueva Canción</button>
            <button onclick="location.href='/artistas'">Ir a lista de Artistas</button>
        </div>
    </body>
</html>