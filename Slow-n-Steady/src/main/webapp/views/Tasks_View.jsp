<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Stories</title>
        <link rel="stylesheet" href="styles/tasks/tasks_Css.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
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
        <div class="bg-gradient bg-primary">
            <div class="container-sm p-5">
                <div>
                    <button class="btn btn-secondary bg-gradient dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Projects
                    </button>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#">Proyecto 1</a></li>
                      <li><a class="dropdown-item" href="#">Proyecto 2</a></li>
                      <li><a class="dropdown-item" href="#">Proyecto 3</a></li>
                    </ul>
                </div>
                <div class="container-sm bg-info bg-gradient">
                    <div class="container-sm p-4">
                        <div class=" row container-sm border border-dark my-2 py-3 shadow bg-info bg-gradient">
                            <div class="col-md-6">
                                Task 1 Hardcoded
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                <div class="col-md">
                                pepito
                                </div>
                                <div class="col-md">
                                    Priority: 7
                                </div>
                                <div class="col-md">
                                    <link href="">Modificar</link>
                                </div>
                                <div class="col-md">
                                    <link href="">Eliminar</link>
                                </div>
                                <div class="col-md">
                                    <icon>
                                        <i class="bi bi-info-circle" data-bs-toggle="modal" data-bs-target="#myModal">
                                        </i>
                                    </icon>
                                </div>
                                    </div>
                            </div>
                            
                        </div>
                        <div class="container-sm border border-dark bg-info bg-gradient my-2 py-3 shadow row">
                            <div class="col">
                                Task 1 Hardcoded
                            </div>
                            <div class="col-1">
                                <link href="">Modificar</link>
                            </div>
                            <div class="col-1">
                                <link href="">Eliminar</link>
                            </div>
                            <div class="col-1">
                                <icon>
                                    <i class="bi bi-info-circle" data-bs-toggle="modal" data-bs-target="#myModal">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                            <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
                                        </svg>
                                    </i>
                                </icon>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-secondary" type="button">
                        Add Task
                    </button>
                </div>
            </div>
            <div class="modal" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">Modal Heading</h4>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
              ></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">Modal body..</div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-danger"
                data-bs-dismiss="modal"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
        </div>
    </body>
</html>
