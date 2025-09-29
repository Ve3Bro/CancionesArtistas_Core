<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Canción</title>
        <link rel="stylesheet" href="/css/styles.css">
    </head>
    <body>
        <div class="nav">
            <h1>Editar Canción</h1>
            <form:form method="POST" action="/canciones/procesa/editar/${cancion.id}" modelAttribute="cancion">
                <table>
                    <tr>
                        <td><form:label path="titulo">Título:</form:label></td>
                        <td><form:input path="titulo" /></td>
                        <td><form:errors path="titulo" cssClass="error" /></td>
                    </tr>
                    <tr>
                        <td><form:label path="artista">Artista:</form:label></td>
                        <td><form:input path="artista" /></td>
                        <td><form:errors path="artista" cssClass="error" /></td>
                    </tr>
                    <tr>
                        <td><form:label path="album">Álbum:</form:label></td>
                        <td><form:input path="album" /></td>
                        <td><form:errors path="album" cssClass="error" /></td>
                    </tr>
                    <tr>
                        <td><form:label path="genero">Género:</form:label></td>
                        <td><form:input path="genero" /></td>
                        <td><form:errors path="genero" cssClass="error" /></td>
                    </tr>
                    <tr>
                        <td><form:label path="idioma">Idioma:</form:label></td>
                        <td><form:input path="idioma" /></td>
                        <td><form:errors path="idioma" cssClass="error" /></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <button type="submit">Actualizar Canción</button>
                            <button type="button" onclick="location.href='/canciones'">Regresar</button>
                        </td>
                    </tr>
                </table>
            </form:form>
        </div>
    </body>
</html>

