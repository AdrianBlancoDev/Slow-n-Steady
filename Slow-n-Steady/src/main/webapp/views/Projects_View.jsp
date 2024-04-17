<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
      $(function() {
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
                </div>
            </article>
        </section>
    </body>
</html>

<%-- 
    Document   : lista
    Created on : 18 mar 2024, 14:14:42
    Author     : Mati
--%>

<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de carreras</title>
        <link rel="stylesheet" href="./css/style.css"/>
    </head>
    <body class="first-color">
        <h1 class="second-color">Listas de carreras</h1>
        <ul class="careerList">
            <c:forEach items="${carrera}" var="carrera">
                <li>${carrera.name} 
                    <a href="./modificar?id=${carrera.id}" target="_blank">Modificar</a>
                    <a href="./borrar?id=${carrera.id}" target="_blank">Eliminar</a>
                </li>
            </c:forEach>
        </ul>
    </body>
</html>
--%>
