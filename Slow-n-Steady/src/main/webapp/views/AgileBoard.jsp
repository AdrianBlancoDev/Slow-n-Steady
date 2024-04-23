<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Agile Board</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="styles/AgileBoardStyles.css"/>
        <script src="scripts/drag.js" defer></script>
        <script src="scripts/todo.js" defer></script>
        <link rel="stylesheet" href="styles/AgileBoardStyles.css"/>
        <style>
            /* Estilos CSS para posicionar el aside a la izquierda */
            .projectMenu {
                position: absolute;
                top: 0;
                left: 0;
                bottom: 0;
                width: auto; /* ajustar según sea necesario */
                background-color: #f0f0f0; /* color de fondo opcional */
                padding: 20px; /* espaciado interno opcional */
            }
            .board {
                margin-left: 220px; /* ancho del aside + espaciado */
            }
        </style>
    </head>
    <body class="body">
        <aside class="projectMenu">
            <h1 class="projectsTitle">Projects</h1>
            <div class="d-grid gap-2" style="min-width: 200px; width: 200px;">
                <button class="btn btn-primary" type="button">Project 1</button>
                <button class="btn btn-primary" type="button">Project 2</button>
            </div>
        </aside>
        <div class="board">
            <form id="todo-form">
                <input type="text" placeholder="New Task..." id="todo-input">
                <button type="submit"> Add +</button>
            </form>

            <div class="lanes">
                <div id="sprint-backlog-lane" class="swim-lane">
                    <h3 class="heading">Sprint Backlog</h3>
                    <p class="task" draggable="true">Develop Login</p>
                    <p class="task" draggable="true">Design Login View</p>
                    <p class="task" draggable="true">Implement Login Backend with Login Views</p>
                </div>

                <div id="in-progress-lane" class="swim-lane">
                    <h3 class="heading">In Progress</h3>
                    <p class="task" draggable="true">Develop Login</p>
                    <p class="task" draggable="true">Design Login View</p>
                    <p class="task" draggable="true">Implement Login Backend with Login Views</p>
                </div>

                <div id="for-testing-lane" class="swim-lane">
                    <h3 class="heading">Ready for Testing</h3>
                    <p class="task" draggable="true">Develop Login</p>
                    <p class="task" draggable="true">Design Login View</p>
                    <p class="task" draggable="true">Implement Login Backend with Login Views</p>
                </div>

                <div id="completed-lane" class="swim-lane">
                    <h3 class="heading">Completed</h3>
                    <p class="task" draggable="true">Develop Login</p>
                    <p class="task" draggable="true">Design Login View</p>
                    <p class="task" draggable="true">Implement Login Backend with Login Views</p>
                </div>
            </div>
        </div>
    </body>
</html>
