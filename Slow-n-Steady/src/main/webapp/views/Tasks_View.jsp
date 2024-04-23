<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.Project" %>
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
            $(function () {
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
                        <li><a class="dropdown-item" href="#">Proyecto1</a></li>
                        <li><a class="dropdown-item" href="#">Proyecto 2</a></li>
                        <li><a class="dropdown-item" href="#">Proyecto 3</a></li>
                    </ul>
                </div>
                <div class="container-sm bg-info bg-gradient p-2">
                    <div class="container-sm p-4">
                        <div class=" row container-sm border border-dark my-2 py-3 shadow bg-info bg-gradient">
                            <div class="col-md-6">
                                <a>Task 1 Hardcoded</a>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md">
                                        <a>pepito</a>
                                    </div>
                                    <div class="col-md">
                                        Priority: 7
                                    </div>
                                    <div class="col-md">
                                        <a class="btn btn-outline-* p-0 fw-bold text-decoration-underline" data-bs-toggle="modal" data-bs-target="#modifyModal">Modificar</a>
                                    </div>
                                    <div class="col-md">
                                        <a type="button" class="btn btn-outline-* p-0 fw-bold text-decoration-underline" data-bs-toggle="modal" data-bs-target="#deleteModal">Eliminar</a>
                                    </div>
                                    <div class="col-md">
                                        <icon>
                                            <i class="bi bi-info-circle" data-bs-toggle="modal" data-bs-target="#infoModal"></i>
                                        </icon>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                        <div class="container-sm d-grid gap-1">
                            <button class="btn btn-secondary shadow bg-gradient" type="button" data-bs-toggle="modal" data-bs-target="#addTaskModal">
                                Add Task
                            </button>
                        </div>                    
                    </div>
                </div>
                <!-- Add Task Modal -->
                <div class="modal" id="addTaskModal">
                    <div class="modal-dialog">
                        <div class="modal-content bg-info bg-gradient">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title col-12 text-center">New Task</h4>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <form action="./Tasks_Controller" method="post">
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Task Name:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="name" name="name" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Collaborators:</label>
                                        <div class="input-group">
                                            <button class="btn btn-secondary bg-gradient dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                Collaborators
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Proyecto1</a></li>
                                                <li><a class="dropdown-item" href="#">Proyecto 2</a></li>
                                                <li><a class="dropdown-item" href="#">Proyecto 3</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Description:</label>
                                        <div class="input-group">
                                            <textarea class="form-control" aria-label="With textarea" id="description" name="description" required></textarea>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Start Date:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button class="btn btn-secondary" type="submit" data-bs-toggle="modal" data-bs-target="#addTaskModal">
                                    Add Task
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Info Modal -->
                 <div class="modal" id="infoModal">
                    <div class="modal-dialog">
                        <div class="modal-content bg-info bg-gradient">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title col-12 text-center">Task Info</h4>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Task Name:</label>
                                    <span>Name of task</span>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Collaborators:</label>
                                    <div class="input-group">
                                        <span>colaborator 1, etc</span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Description:</label>
                                    <div class="input-group">
                                        <span class="form-control" aria-label="With textarea">descripttion dbadbnasbfasdlhjkfbadsbfapdgba dasbfapdgadsf asdufbapusdfb</span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Start Date:</label>
                                    <span>fecha</span>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modify Modal -->
                <div class="modal" id="modifyModal">
                    <div class="modal-dialog">
                        <div class="modal-content bg-info bg-gradient">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title col-12 text-center">Modify Task</h4>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Task Name:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Collaborators:</label>
                                    <div class="input-group">
                                        <button class="btn btn-secondary bg-gradient dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Collaborators
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">Proyecto1</a></li>
                                            <li><a class="dropdown-item" href="#">Proyecto 2</a></li>
                                            <li><a class="dropdown-item" href="#">Proyecto 3</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Description:</label>
                                    <div class="input-group">
                                        <textarea class="form-control" aria-label="With textarea"></textarea>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Start Date:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4">
                                    </div>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button class="btn btn-secondary" type="button" data-bs-toggle="modal" data-bs-target="#addTaskModal">
                                    Modify
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Delete Modal -->
                 <div class="modal" id="deleteModal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content bg-info bg-gradient">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title col-12 text-center fw-bold">Deleting Task</h4>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="text-center text-light">
                                    <span><em>Are you sure you want to delete this task?</em></span>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer d-grid gap-2 d-md-flex justify-content-center">
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </body>
</html>
