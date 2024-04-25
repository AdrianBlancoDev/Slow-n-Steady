<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projects</title>
        <link rel="stylesheet" href="./styles/project/project.css"/>
        <link rel="stylesheet" href="styles/tasks/tasks_Css.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script>
            $(function () {
                $("#includeHtml").load("views/components/Navbar_View.jsp");
            });
        </script>
    </head>
    <body>
        <div id="includeHtml"></div>
        <section class="bg-image fullSizeView">
            <article class="container-sm p-5">
                <div>
                    <button class="btn btn-dark bg-gradient custom-disabled" type="button" aria-expanded="false">
                        Projects
                    </button>
                </div>
                <div class="container-sm --bs-warning bg-gradient p-2 rounded-end-4 rounded-bottom-4">
                    <div class="container-sm p-4">
                        <div class="row none-margin container-sm border border-dark my-2 py-3 shadow --bs-info-bg-subtle bg-gradient">
                            <c:forEach items="${projectAdmin}" var="projectAdmin">
                                <div class="col-md-6">
                                    <a>${projectAdmin.getName()}</a>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md"></div>
                                        <div class="col-md">
                                            <a>admin</a>
                                        </div>
                                        <div class="col-md">
                                            <a class="btn btn-outline-* p-0 fw-bold text-decoration-underline modify-btn" data-bs-toggle="modal" data-bs-target="#modifyModal" data-project-id="${projectAdmin.getId()}"  data-project-name="${projectAdmin.getName()}" data-project-description="${projectAdmin.getDescription()}" data-project-startdate="${projectAdmin.getStartDate()}" >Modificar</a>
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
                        </c:forEach>
                        <div class="row none-margin container-sm border border-dark my-2 py-3 shadow --bs-info-bg-subtle bg-gradient">
                            <c:forEach items="${projectCollaborator}" var="project">
                                <div class="col-md-6">
                                    <a>${project.getName()}</a>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md"></div>
                                        <div class="col-md"></div>
                                        <div class="col-md"></div>
                                        <div class="col-md"></div>
                                        <div class="col-md">
                                            <icon>
                                                <i class="bi bi-info-circle" data-bs-toggle="modal" data-bs-target="#infoModal"></i>
                                            </icon>
                                        </div>
                                    </div>
                                </div>                            
                            </c:forEach>
                        </div>
                        <div class="container-sm d-grid gap-1 none-padding">
                            <button class="btn btn-dark shadow bg-gradient" type="button" data-bs-toggle="modal" data-bs-target="#addTaskModal">
                                Add Project
                            </button>
                        </div>                    
                    </div>
                </div>
                <!-- Add Task Modal -->
                <div class="modal fade" id="addTaskModal" data-bs-backdrop="static">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content bg-image-modal">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title col-12 text-center">New Task</h4>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <form action="./Tasks_Controller" method="post">
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">New Project:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="name" name="name" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Collaborators:</label>
                                        <div class="input-group">
                                            <button class="btn btn-dark bg-gradient dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                Collaborators
                                            </button>
                                            <ul class="dropdown-menu text-bg-dark">
                                                <li><button class="dropdown-item btn btn-dark text-light custom-btn" data-bs-toggle="button" aria-pressed="true" href="#">Proyecto 1</button></li>
                                                <li><button class="dropdown-item btn btn-dark text-light custom-btn" data-bs-toggle="button" aria-pressed="true" href="#">Proyecto 1</button></li>
                                                <li><button class="dropdown-item btn btn-dark text-light custom-btn" data-bs-toggle="button" aria-pressed="true" href="#">Proyecto 1</button></li>
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
                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
                                <button class="btn btn-dark" type="submit" data-bs-toggle="modal" data-bs-target="#addTaskModal">
                                    Add Task
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Info Modal -->
                <div class="modal fade" id="infoModal" data-bs-backdrop="static">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content bg-image-modal">
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
                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modify Modal -->
                <div class="modal fade" id="modifyModal" data-bs-backdrop="static">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content bg-image-modal">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title col-12 text-center">Modify Project</h4>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Project Name:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="modal_body" aria-describedby="basic-addon3 basic-addon4">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Collaborators:</label>
                                    <div class="input-group">
                                        <button class="btn btn-dark bg-gradient dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Collaborators
                                        </button>
                                        <ul class="dropdown-menu text-bg-dark">
                                            <li><button class="dropdown-item btn btn-dark text-light custom-btn" data-bs-toggle="button" aria-pressed="true" href="#">Proyecto 1</button></li>
                                            <li><button class="dropdown-item btn btn-dark text-light custom-btn" data-bs-toggle="button" aria-pressed="true" href="#">Proyecto 1</button></li>
                                            <li><button class="dropdown-item btn btn-dark text-light custom-btn" data-bs-toggle="button" aria-pressed="true" href="#">Proyecto 1</button></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Description:</label>
                                    <div class="input-group">
                                        <textarea class="form-control" aria-label="With textarea" id="modal_description"></textarea>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Start Date:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="modal_startDate" aria-describedby="basic-addon3 basic-addon4">
                                    </div>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button id="modifyProjectBtn" class="btn btn-dark" type="button">
                                    Modify
                                </button>
                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Delete Modal -->
                <div class="modal fade" id="deleteModal" data-bs-backdrop="static">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content bg-image-modal">
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
            </article>
        </section>
    </body>
    <!-- Script placeholders -->
    <script type="text/javascript">
        $(".modify-btn").click(function () {
            var projectId = $(this).data("project-id");
            var projectName = $(this).data("project-name");
            var projectDescription = $(this).data("project-description");
            var projectStartdate = $(this).data("project-startdate");

            $("#modal_body").attr("value", projectName);
            $("#modal_description").val(projectDescription);
            $("#modal_startDate").attr("value", projectStartdate);
            
            $("#modifyProjectBtn").data("project-id", projectId);
        });
    </script>


</html>

<script type="text/javascript">
 $(document).ready(function() {
    $("#modifyProjectBtn").click(function() {
        // Obtener el ID del proyecto del modal
        var projectId = $("#modifyModal").data("project-id");
        
        // Obtener los valores del modal
        var projectName = $("#modal_body").val();
        var projectDescription = $("#modal_description").val();
        var projectStartDate = $("#modal_startDate").val();

        // Crear un objeto Project
        var projectData = {
            id: projectId,
            name: projectName,
            description: projectDescription,
            startDate: projectStartDate
        };

        // Realizar la solicitud de modificación al servidor
        $.ajax({
            type: "POST",
            url: "http://localhost:8080/model.persist/Project/modify",
            data: JSON.stringify(projectData),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(response) {
                // Manejar la respuesta del servidor
                console.log("Modificación exitosa:", response);
                // Otra lógica de actualización de la interfaz de usuario si es necesario
            },
            error: function(error) {
                console.error("Error al modificar el proyecto:", error);
                // Lógica para manejar errores si es necesario
            }
        });
    });
});

</script>
