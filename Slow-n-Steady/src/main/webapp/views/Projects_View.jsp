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
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

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
                        <c:forEach items="${projectAdmin}" var="projectAdmin">
                            <div class="row none-margin container-sm border border-dark my-2 py-3 shadow --bs-info-bg-subtle bg-gradient">
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
                                            <a class="btn btn-outline-* p-0 fw-bold text-decoration-underline modify-btn" data-bs-toggle="modal" data-bs-target="#modifyModal" data-project-id="${projectAdmin.getId()}"  data-project-name="${projectAdmin.getName()}" data-project-description="${projectAdmin.getDescription()}" data-project-startdate="${projectAdmin.getStartDate()}" >Modify</a>
                                        </div>
                                        <div class="col-md">
                                            <a class="btn btn-outline-* p-0 fw-bold text-decoration-underline delete-btn" data-bs-toggle="modal" data-bs-target="#deleteModal" data-project-id="${projectAdmin.getId()}">Delete</a>
                                        </div>
                                        <div class="col-md">
                                            <icon>
                                                <i class="bi bi-info-circle info-btn" data-bs-toggle="modal" data-bs-target="#infoModal" data-project-collaborator="${usernameList}" data-project-name="${projectAdmin.getName()}" data-project-description="${projectAdmin.getDescription()}" data-project-startdate="${projectAdmin.getStartDate()}" ></i>
                                            </icon>
                                        </div>
                                    </div>
                                </div>                            
                            </div>
                        </c:forEach>
                        <c:forEach items="${projectCollaborator}" var="project">
                            <div class="row none-margin container-sm border border-dark my-2 py-3 shadow --bs-info-bg-subtle bg-gradient">
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
                                                <i class="bi bi-info-circle info-btn" data-bs-toggle="modal" data-bs-target="#infoModal" data-project-collaborator="${usernameList}" data-project-name="${project.getName()}" data-project-description="${project.getDescription()}" data-project-startdate="${project.getStartDate()}" ></i>
                                            </icon>                                  
                                        </div>
                                    </div>
                                </div>                            
                            </div>
                        </c:forEach>
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
                                <h4 class="modal-title col-12 text-center">New Project</h4>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <form action="./Tasks_Controller" method="post">
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">New Project:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="modal_name_add" name="name" required/>
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
                                            <textarea class="form-control" aria-label="With textarea" id="modal_description_add" name="description" required></textarea>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Start Date:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="modal_startDate_add" aria-describedby="basic-addon3 basic-addon4">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button class="btn btn-dark" type="submit" id="addProjectBtn" data-bs-toggle="modal">
                                    Add Project
                                </button>
                                <script>
                                    $(document).ready(function () {
                                        $("#addProjectBtn").click(function () {
                                            // Obtener los valores del modal
                                            var projectName = $("#modal_name_add").val();
                                            var projectDescription = $("#modal_description_add").val();
                                            var projectStartDate = $("#modal_startDate_add").val();
                                            var projectDao = "create";
                                            // Crear un objeto con los parámetros a enviar al servlet
                                            var requestData = {
                                                projectName: projectName,
                                                projectDescription: projectDescription,
                                                projectStartDate: projectStartDate,
                                                projectDAO: projectDao
                                            };

                                            $.ajax({
                                                url: "ProjectsAPI",
                                                type: "POST",
                                                data: requestData,
                                                success: function () {
                                                    console.log("¡Datos enviados al servidor con éxito!");
                                                    location.reload();
                                                },
                                                error: function (xhr, status, error) {
                                                    console.error("ERROR al enviar datos al servidor: " + error);
                                                }
                                            });
                                        });
                                    });
                                </script>
                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
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
                                <h4 class="modal-title col-12 text-center">Project Info</h4>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label fw-bold">Project Name:</label>
                                    <span id="info-modal-name">nameProject</span>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label fw-bold">Collaborators:</label>
                                    <div class="input-group">
                                        <span id="info-modal-colaborator">collaborator 1, etc</span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label fw-bold">Description:</label>
                                    <div class="input-group">
                                        <span id="info-modal-description">description</span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label fw-bold" id="info-modal-date">Start Date:</label>
                                    <span id="info-modal-startdate">startDate</span>
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
                                <script>
                                    $(document).ready(function () {
                                        $("#modifyProjectBtn").click(function () {
                                            // Obtener los valores del modal
                                            var projectId = $("#modifyProjectBtn").data("project-id");
                                            var projectName = $("#modal_body").val();
                                            var projectDescription = $("#modal_description").val();
                                            var projectStartDate = $("#modal_startDate").val();
                                            var projectDao = "modify";
                                            // Crear un objeto con los parámetros a enviar al servlet
                                            var requestData = {
                                                projectId: projectId,
                                                projectName: projectName,
                                                projectDescription: projectDescription,
                                                projectStartDate: projectStartDate,
                                                projectDAO: projectDao
                                            };

                                            $.ajax({
                                                url: "ProjectsAPI",
                                                type: "POST",
                                                data: requestData,
                                                success: function () {
                                                    console.log("¡Datos enviados al servidor con éxito!");
                                                    location.reload();
                                                },
                                                error: function (xhr, status, error) {
                                                    console.error("ERROR al enviar datos al servidor: " + error);
                                                }
                                            });
                                        });
                                    });
                                </script>
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
                                <button  id="deleteProjectBtn" type="button" class="btn btn-danger">Delete</button>
                                <script>
                                    $(document).ready(function () {
                                        // Manejar clic en botón de eliminar proyecto
                                        $("#deleteProjectBtn").click(function () {
                                            // Obtener el ID del proyecto a eliminar desde el atributo de datos
                                            var projectId = $("#deleteProjectBtn").data("project-id");
                                            var projectDao = "delete";
                                            console.log(projectId);
                                            // Crear un objeto con los parámetros a enviar al servlet
                                            var requestData = {
                                                projectId: projectId,
                                                projectDAO: projectDao
                                            };
                                            $.ajax({
                                                url: "ProjectsAPI", // URL del servlet o endpoint API
                                                type: "POST",
                                                data: requestData,
                                                success: function () {
                                                    console.log("¡Proyecto eliminado con éxito!");
                                                    location.reload(); // Recargar la página para actualizar la tabla
                                                },
                                                error: function (xhr, status, error) {
                                                    console.error("ERROR al eliminar el proyecto: " + error.toString() + " Status: " + status + " XMLHttpRequest: " + xhr);
                                                }
                                            });
                                        });
                                    });
                                </script>
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
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
    <!-- Script placeholder info -->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".info-btn").click(function () {
                var projectCollaborator = $(this).data("project-collaborator");
                var projectName = $(this).data("project-name");
                var projectDescription = $(this).data("project-description");
                var projectStartdate = $(this).data("project-startdate");

                $("#info-modal-name").text(projectName);
                $("#info-modal-colaborator").text(projectCollaborator);
                $("#info-modal-description").text(projectDescription);
                $("#info-modal-startdate").text(projectStartdate);
            });
        });
    </script>
    <script type="text/javascript">
        $(".delete-btn").click(function () {
            var projectId = $(this).data("project-id");
            $("#deleteProjectBtn").data("project-id", projectId);
        });
    </script>

</html>