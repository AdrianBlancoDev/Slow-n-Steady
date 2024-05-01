<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.Project" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="bg-image fullSizeView">
            <div class="container-sm p-5">
                <div class="container-sm">
                    <select class="form-select bg-dark text-light  projectSelect" required>
                        <option value="0" disabled selected>Selecciona un proyecto</option>
                        <c:forEach items="${projects}" var="project">
                            <option class="form-select bg-dark text-light custom-btn" value="${project.getId()}" data-bs-toggle="button" aria-pressed="true" type="submit">
                                ${project.getName()}
                            </option>
                        </c:forEach>
                    </select>
                    <input type="hidden" id="projectId" name="project-id">
                </div>
                <div class="container-sm --bs-warning bg-gradient p-2 rounded-end-4 rounded-bottom-4" >
                    <div class="container-sm p-4 overflow-y-auto"  style="height: 500px;" id="here">
                        <c:forEach items="${tasks}" var="tasks" >
                            <div class="row none-margin container-sm border border-dark my-2 py-3 shadow --bs-info-bg-subtle bg-gradient" >
                                <div class="col-md-6">
                                    <a>${tasks.getName()}</a>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md">
                                        </div>
                                        <div class="col-md">
                                            Priority: ${tasks.getPriority()}
                                        </div>
                                        <div class="col-md">
                                            <a class="btn btn-outline-* p-0 fw-bold text-decoration-underline modify-btn" data-bs-toggle="modal" data-bs-target="#modifyModal" 
                                               data-task-id="${tasks.getId()}" 
                                               data-task-name="${tasks.getName()}" 
                                               data-task-priority="${tasks.getPriority()}"
                                               data-task-description="${tasks.getDescription()}">Modify</a>
                                        </div>
                                        <div class="col-md">
                                            <a class="btn btn-outline-* p-0 fw-bold text-decoration-underline delete-btn" data-bs-toggle="modal" data-bs-target="#deleteModal" 
                                               data-task-id="${tasks.getId()}">Delete</a>
                                        </div>
                                        <div class="col-md">
                                            <icon>
                                                <i class="bi bi-info-circle info-btn" data-bs-toggle="modal" data-bs-target="#infoModal"
                                                   data-task-id="${tasks.getId()}" 
                                                   data-task-name="${tasks.getName()}" 
                                                   data-task-priority="${tasks.getPriority()}"
                                                   data-task-description="${tasks.getDescription()}"></i>
                                            </icon>
                                        </div>
                                    </div>
                                </div>                            
                            </div>
                        </c:forEach>
                    </div>
                    <div class="container-sm d-grid gap-1 none-padding">
                        <button class="btn btn-dark shadow bg-gradient" type="button" data-bs-toggle="modal" data-bs-target="#addTaskModal">
                            Add Task
                        </button>
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
                                <div class="mb-3">
                                    <label for="basic-url" id="validationDefault01" class="form-label">Task Name:</label>
                                    <div class="input-group">
                                        <input type="text"  class="form-control" id="modal_create_name" name="taskName" required/>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Priority (0-10):</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" id="modal_create_priority" name="taskPriority" min="1" max="10">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Description:</label>
                                    <div class="input-group">
                                        <textarea class="form-control" aria-label="With textarea" id="modal_create_description" name="taskDescription" required></textarea>
                                    </div>
                                </div>

                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
                                <input type="hidden" name="selection" value="create"/>
                                <button class="btn btn-dark" id="addTaskBtn" type="submit" data-bs-toggle="modal" data-bs-target="#addTaskModal">
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
                                    <label for="basic-url" class="form-label fw-bold">Project Name:</label>
                                    <span id="modal_info_name">nameProject</span>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label fw-bold">Priority:</label>
                                    <span id="modal_info_priority"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label fw-bold">Description:</label>
                                    <div class="input-group">
                                        <span id="modal_info_description">description</span>
                                    </div>
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
                                <h4 class="modal-title col-12 text-center">Modify Task</h4>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Task Name:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="modal_modify_name" aria-describedby="basic-addon3 basic-addon4">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Priority (0-10):</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" id="modal_modify_priority" name="priority" min="1" max="10">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Description:</label>
                                    <div class="input-group">
                                        <textarea class="form-control" aria-label="With textarea" id="modal_modify_description"></textarea>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
                                <button id="modifyTaskBtn" class="btn btn-dark" type="button">
                                    Modify
                                </button>
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
                                <button id="deleteTaskBtn" type="button" class="btn btn-danger" data-bs-dismiss="modal">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </body>
    <!-- Scripts Add -->
    <script>
        $("#addTaskBtn").click(function () {
            // Obtener los valores del modal
            var taskName = $("#modal_create_name").val();
            var taskDescription = $("#modal_create_description").val();
            var taskPriority = $("#modal_create_priority").val();
            var taskDao = "create"
            // Crear un objeto con los parámetros a enviar al servlet
            var requestData = {
                taskName: taskName,
                taskPriority: taskPriority,
                taskDescription: taskDescription,
                taskDao: taskDao
            };
            $.ajax({
                url: "TasksAPI",
                type: "POST", // O cambia a "GET" si prefieres
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
    </script>
    <!-- Scripts Modify -->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".modify-btn").click(function () {
                var taskId = $(this).data("task-id");
                var taskName = $(this).data("task-name");
                var taskDescription = $(this).data("task-description");
                var taskPriority = $(this).data("task-priority");

                $("#modal_modify_name").attr("value", taskName);
                $("#modal_modify_description").val(taskDescription);
                $("#modal_modify_priority").attr("value", taskPriority);
                $("#modifyTaskBtn").data("task-id", taskId);
            });
        });
    </script>
    <script>
        $("#modifyTaskBtn").click(function () {
            // Obtener los valores del modal
            var taskId = $("#modifyTaskBtn").data("task-id");
            var taskName = $("#modal_modify_name").val();
            var taskDescription = $("#modal_modify_description").val();
            var taskPriority = $("#modal_modify_priority").val();
            var taskDao = "modify"
            // Crear un objeto con los parámetros a enviar al servlet
            var requestData = {
                taskId: taskId,
                taskName: taskName,
                taskPriority: taskPriority,
                taskDescription: taskDescription,
                taskDao: taskDao
            };
            $.ajax({
                url: "TasksAPI",
                type: "POST", // O cambia a "GET" si prefieres
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
    </script>        
    <!-- Scripts Info -->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".info-btn").click(function () {
                var taskId = $(this).data("task-id");
                var taskName = $(this).data("task-name");
                var taskDescription = $(this).data("task-description");
                var taskPriority = $(this).data("task-priority");
                console.log("informacion: " + taskName);
                console.log("informacion: " + taskDescription);
                console.log("informacion: " + taskPriority);
                $("#modal_info_name").text(taskName);
                $("#modal_info_description").text(taskDescription);
                $("#modal_info_priority").text(taskPriority);
            });
        });
    </script>
    <!-- Scripts Delete -->
    <script type="text/javascript">
        $(document).ready(function () {
            $(".delete-btn").click(function () {
                var taskId = $(this).data("task-id");
                console.log(taskId);
                console.log("boton de eliminar fuera del modal");
                $("#deleteTaskBtn").data("task-id", taskId);
            });
        });
    </script>
    <script>
        // Manejar clic en botón de eliminar proyecto
        $("#deleteTaskBtn").click(function () {
            // Obtener el ID del proyecto a eliminar desde el atributo de datos
            var taskId = $("#deleteTaskBtn").data("task-id");
            var taskDao = "delete";
            // Crear un objeto con los parámetros a enviar al servlet
            var requestData = {
                taskId: taskId,
                taskDao: taskDao
            };
            $.ajax({
                url: "TasksAPI", // URL del servlet o endpoint API
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
    </script>        
    <!-- Scripts Projects -->
    <script>
        $(".projectSelect").change(function () {
            //var projectId = $("validationDefault04").val();
            var projectId = $(this).find("option:selected ").val();
            $("#projectId").val(projectId);

            var requestData = {
                projectId: projectId
            };
            $.ajax({
                url: "UserStories",
                type: "GET",
                data: requestData,
                success: function (data) {
                    console.log("¡Proyecto seleccionado con éxito!");
                    var contenido = $(data).find("#here").html();
                    $("#here").html(contenido);
                    // $("#here").html(data);// Recargar la página para actualizar la tabla
                   
                },
                error: function (xhr, status, error) {
                    console.error("ERROR getting Project Sprints: " + error);
                }
            });
        });
    </script>
</html>
