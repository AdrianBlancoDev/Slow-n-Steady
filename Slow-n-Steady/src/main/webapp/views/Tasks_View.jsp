<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Stories</title>
        <<link rel="stylesheet" href="styles/tasks/tasks_Css.css"/>>
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>
        <script>
            $(function() {
                $("#includeHtml").load("views/components/Navbar_View.jsp");
            });
        </script>
    </head>
    <body>
        <div id="includeHtml"></div>
        <section>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Projects
                </button>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="#">Proyecto 1</a></li>
                  <li><a class="dropdown-item" href="#">Proyecto 2</a></li>
                  <li><a class="dropdown-item" href="#">Proyecto 3</a></li>
                </ul>
            </div>
            <div class="creationTasksDiv">
                <button class="btn btn-secondary" type="button">
                    Add Task
                </button>
            </div>
        </section>
    </body>
</html>
