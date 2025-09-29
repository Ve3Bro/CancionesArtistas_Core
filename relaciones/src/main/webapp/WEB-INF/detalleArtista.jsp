<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Detalle Artista</title>
        <link rel="stylesheet" href="/css/styles.css">
    </head>
    <body>
        <div class="nav">
            <h1>Detalles del Artista</h1>
            <table border="1">
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Biografia</th>
                    <th>Canciones</th>
                    <th>Fecha de Creación</th>
                    <th>Fecha de Actualización</th>
                </tr>
                <tr>
                <tr>
                    <td>${artista.nombre}</td>
                    <td>${artista.apellido}</td>
                    <td>${artista.biografia}</td>
                    <td>
                        <c:forEach var="cancion" items="${artista.canciones}">
                            ${cancion.titulo}<br/>
                        </c:forEach>
                    </td>
                    <td>${artista.fechaCreacion}</td>
                    <td>${artista.fechaActualizacion}</td>
                </tr>
            </table>
            <button onclick="location.href='/artistas'">Volver a la lista</button>
        </div>
    </body>
</html>