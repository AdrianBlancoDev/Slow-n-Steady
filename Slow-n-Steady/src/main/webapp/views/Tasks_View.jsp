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
        <!-- Scripts Modify -->
        <script type="text/javascript">
            $(document).ready(function () {
                $(".modify-btn").click(function () {
                    var taskId = $(this).data("task-id");
                    var taskName = $(this).data("task-name");
                    var taskDescription = $(this).data("task-description");
                    var taskPriority = $(this).data("task-priority");

                    $("#modal_body").attr("value", taskName);
                    $("#modal_description").val(taskDescription);
                    $("#modal_priority").attr("value", taskPriority);
                    $("#modifyTaskBtn").data("task-id", taskId);
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#modifyTaskBtn").click(function () {
                    // Obtener los valores del modal
                    var taskId = $("#modifyTaskBtn").data("task-id");
                    var taskName = $("#modal_body").val();
                    var taskDescription = $("#modal_description").val();
                    var taskPriority = $("#modal_priority").val();
                    var projectStartDate = $("#modal_startDate").val();
                    // Crear un objeto con los parámetros a enviar al servlet
                    var requestData = {
                        taskId: taskId,
                        taskName: taskName,
                        taskPriority: taskPriority,
                        taskDescription: taskDescription,
                        projectStartDate: projectStartDate
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
            });
        </script>
        <!-- Scripts Add -->
        <script>
            $(document).ready(function () {
                $("#addTaskBtn").click(function () {
                    // Obtener los valores del modal
                    var taskName = $("#modal_name").val();
                    var taskDescription = $("#modal_description").val();
                    var taskPriority = $("#modal_priority").val();
                    var projectStartDate = $("#modal_startDate").val();
                    var taskDao = "create"
                    // Crear un objeto con los parámetros a enviar al servlet
                    var requestData = {
                        taskName: taskName,
                        taskPriority: taskPriority,
                        taskDescription: taskDescription,
                        projectStartDate: projectStartDate,
                        taskDao: taskDao
                    };
                    $.ajax({
                        url: "UserStories",
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
            });
        </script>
        <!-- Scripts Projects -->
        <script>
            $(document).ready(function () {
                $("#searchProjectBtn").click(function () {
                    // Obtener los valores del modal
                    var taskName = $("#modal_body").val();
                    var taskDescription = $("#modal_description").val();
                    var taskPriority = $("#modal_priority").val();
                    console.log(taskPriority);
                    var projectStartDate = $("#modal_startDate").val();
                    var projectId = $("#modal_project").val();
                    // Crear un objeto con los parámetros a enviar al servlet
                    var requestData = {
                        taskName: taskName,
                        taskPriority: taskPriority,
                        taskDescription: taskDescription,
                        projectStartDate: projectStartDate,
                        projectId: projectId
                    };
                    $.ajax({
                        url: "UserStories",
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
            });
        </script>
        <!-- Scripts Delete -->
        <script>
            $(document).ready(function () {
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
                        url: "UserStories", // URL del servlet o endpoint API
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
        <script type="text/javascript">
            $("#delete-btn").click(function () {
                var taskId = $(this).data("task-id");
                $("#deleteTaskBtn").data("task-id", taskId);
            });
        </script>
    </head>
    <body>
        <div id="includeHtml"></div>
        <div class="bg-image fullSizeView">
            <div class="container-sm p-5">
                <div class="container-sm project-selected">
                    <select class="form-select bg-dark text-light" id="validationDefault04" required>
                        <c:forEach items="${projects}" var="projects">
                            <option class="form-select text-light custom-btn" id="searchProjectBtn"  data-bs-toggle="button" aria-pressed="true" type="submit">${projects.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="container-sm --bs-warning bg-gradient p-2 rounded-end-4 rounded-bottom-4">
                    <div class="container-sm p-4 overflow-y-auto" style="height: 500px;">
                        <c:forEach items="${tasks}" var="tasks">
                            <div class="row none-margin container-sm border border-dark my-2 py-3 shadow --bs-info-bg-subtle bg-gradient">
                                <div class="col-md-6">
                                    <a>${tasks.getName()}</a>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md">
                                            <a>pepe</a>
                                        </div>
                                        <div class="col-md">
                                            Priority: ${tasks.getPriority()}
                                        </div>
                                        <div class="col-md">
                                            <a class="btn btn-outline-* p-0 fw-bold text-decoration-underline modify-btn" data-bs-toggle="modal" data-bs-target="#modifyModal" 
                                               data-task-id="${tasks.getId()}" 
                                               data-task-name="${tasks.getName()}" >Modify</a>
                                        </div>
                                        <div class="col-md">
                                            <a class="btn btn-outline-* p-0 fw-bold text-decoration-underline" id="delete-btn" data-bs-toggle="modal" data-bs-target="#deleteModal" data-project-id="${tasks.getId()}">Delete</a>
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
                            <form action="./UserStories" method="post">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title col-12 text-center">New Task</h4>
                                </div>
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="basic-url" id="validationDefault01" class="form-label">Task Name:</label>
                                        <div class="input-group">
                                            <input type="text"  class="form-control" id="modal_name" name="taskName" required/>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Priority (0-10):</label>
                                        <div class="input-group">
                                            <input type="number" class="form-control" id="modal_priority" name="taskPriority" min="1" max="10">
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Description:</label>
                                        <div class="input-group">
                                            <textarea class="form-control" aria-label="With textarea" id="modal_description" name="taskDescription" required></textarea>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Start Date:</label>
                                        <div class="input-group date">
                                            <input size="16" type="date" class="form-control" id="datetime"/>
                                            <i class="fa fa-calendar"></i>
                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#datetime").datetimepicker({
                                                        format: 'yyyy-mm-dd hh:ii',
                                                        autoclose: true
                                                    });
                                                });
                                            </script>
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
                            </form>
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
                                <form>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Task Name:</label>
                                        <span id="modal_body"></span>
                                    </div>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Description:</label>
                                        <div class="input-group">
                                            <span class="form-control" aria-label="With textarea"></span>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="basic-url" class="form-label">Start Date:</label>
                                        <span>fecha</span>
                                    </div>
                                </form>
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
                                        <input type="text" class="form-control" id="modal_body" aria-describedby="basic-addon3 basic-addon4">
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">Priority (0-10):</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" id="modal_priority" name="priority" min="1" max="10">
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
                                        <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4">
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
</html>
