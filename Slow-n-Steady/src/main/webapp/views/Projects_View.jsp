<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List project</title>
        <link rel="stylesheet" href="./styles/project/project.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script>
            $(function () {
                $("#includeHtml").load("views/components/Navbar_View.jsp");
            });
        </script>
    </head>
    <body class="body">
        <div id="includeHtml"></div>
        <section>
            <article>
                <h1 class="tittle">Project</h1>
                <div class="container-project">
                    <p>
                        asadfghfdsazxcvbngfdsadf dsdfghtrsdf gfdsfg hfdsfgdghfdg dg
                    </p>
                    <c:choose>
                        <c:when test="${a=='admin'}">
                            <ul>
                                <c:forEach items="${project}" var="project">
                                    <li>${project.getName()} 
                                        <a href="./modificar" target="_blank">Modificar</a>
                                        <a href="./borrar" target="_blank">Eliminar</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:when>    
                        <c:otherwise>
                            <ul>
                                <c:forEach items="${project}" var="project">
                                    <li>${project.getName()} 
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </div>
            </article>
        </section>
    </body>
</html>