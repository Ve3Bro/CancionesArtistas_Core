<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Artistas</title>
        <link rel="stylesheet" href="/css/styles.css">
    </head>
    <body>
        <div class="nav">
            <h1>Lista de Artistas</h1>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Detalles</th>
                </tr>
                    <c:forEach var="artista" items="${artistas}">
                        <tr>
                            <td>${artista.id}</td>
                            <td>${artista.nombre}</td>
                            <td>${artista.apellido}</td>
                            <td><button onclick="location.href='artistas/detalle/${artista.id}'">Ver Detalles</button></td>
                        </tr>
                    </c:forEach>
            </table>
            <button onclick="location.href='/canciones'">ir a lista de Canciones</button>
        </div>
    </body>
</html>