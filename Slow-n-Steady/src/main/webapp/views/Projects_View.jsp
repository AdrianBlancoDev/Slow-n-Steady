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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.6.0/bootstrap-tagsinput.css" integrity="sha512-3uVpgbpX33N/XhyD3eWlOgFVAraGn3AfpxywfOTEQeBDByJ/J7HkLvl4mJE1fvArGh4ye1EiPfSBnJo2fgfZmg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        <script src="https://twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js"></script>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.8/handlebars.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.6.0/bootstrap-tagsinput.min.js" integrity="sha512-SXJkO2QQrKk2amHckjns/RYjUIBCI34edl9yh0dzgw3scKu0q4Bo/dUr+sGHMUha0j9Q1Y7fJXJMaBi4xtyfDw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
                                                <i class="bi bi-info-circle info-btn" data-bs-toggle="modal" data-bs-target="#infoModal" data-project-id="${projectAdmin.getId()}" data-project-name="${projectAdmin.getName()}" data-project-description="${projectAdmin.getDescription()}" data-project-startdate="${projectAdmin.getStartDate()}" data-project-creationdate="${projectAdmin.getCreationDate()}"></i>
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
                                                <i class="bi bi-info-circle info-btn" data-bs-toggle="modal" data-bs-target="#infoModal" data-project-id="${projectAdmin.getId()}" data-project-name="${project.getName()}" data-project-description="${project.getDescription()}" data-project-startdate="${project.getStartDate()}" data-project-creationdate="${projectAdmin.getCreationDate()}"></i>
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
                <!-- Add Project Modal -->
                <div class="modal fade" id="addTaskModal" data-bs-backdrop="static">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content bg-image-modal">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title col-12 text-center">New Project</h4>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label">New Project:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="modal_name_add" name="name" required/>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="colaborator" class="form-label">Collaborators:</label>
                                    <input type="text" data-role="tagsinput" id="tags-input" class="form-control" placeholder="Agregar colaboradores">

                                </div>

                                <script>
                                    $(document).ready(function () {
                                        // Tu lista de colaboradores como un array de strings
                                        var colaboradoresList = ["Colaborador1", "Colaborador2", "Colaborador3"];

                                        // Configurar Bloodhound
                                        var colaboradores = new Bloodhound({
                                            datumTokenizer: Bloodhound.tokenizers.whitespace,
                                            queryTokenizer: Bloodhound.tokenizers.whitespace,
                                            local: colaboradoresList
                                        });
                                        console.log("Inicializando Bloodhound");
                                        // Inicializar Bloodhound
                                        colaboradores.initialize();

                                        console.log("Configurando Typeahead.js");

                                        // Configurar Typeahead.js
                                        $('#tags-input').tagsinput({
                                            typeaheadjs: {
                                                name: 'colaboradores',
                                                source: colaboradores.ttAdapter()
                                            }
                                        });
                                        $('#tags-input').on('itemAdded', function (event) {
                                            console.log("Tag añadida: " + event.item);
                                        });

                                        // Manejar el evento al eliminar una etiqueta
                                        $('#tags-input').on('itemRemoved', function (event) {
                                            console.log("Tag eliminada: " + event.item);
                                        });
                                    });
                                </script>


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
                                            // Obtener los valores de las etiquetas directamente desde el input
                                            var tagsSeleccionados = $('#tags-input').val();
                                            var projectDao = "create";
                                            // Crear un objeto con los parámetros a enviar al servlet
                                            var requestData = {
                                                projectName: projectName,
                                                projectDescription: projectDescription,
                                                projectStartDate: projectStartDate,
                                                tagsSelect: tagsSeleccionados,
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
                                                    location.reload();
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
                                    <label for="basic-url" class="form-label fw-bold">Start Date:</label>
                                    <span id="info-modal-startdate">startDate</span>
                                </div>
                                <div class="mb-3">
                                    <label for="basic-url" class="form-label fw-bold">Creation Date:</label>
                                    <span id="info-modal-creationdate">creationDate</span>
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
                var projectId = $(this).data("project-id");
                var projectName = $(this).data("project-name");
                var projectDescription = $(this).data("project-description");
                var projectStartdate = $(this).data("project-startdate");
                var projectCreationdate = $(this).data("project-creationdate");

                $.ajax({
                    url: "ProjectsAPI", // URL del servlet o endpoint API
                    type: "GET",
                    data: {projectId: projectId},
                    success: function (data) {
                        $("#info-modal-colaborator").text(data);
                    },
                    error: function (xhr, status, error) {
                        console.error("ERROR al eliminar el proyecto: " + error.toString() + " Status: " + status + " XMLHttpRequest: " + xhr);
                    }
                });

                $("#info-modal-name").text(projectName);
                $("#info-modal-description").text(projectDescription);
                $("#info-modal-startdate").text(projectStartdate);
                $("#info-modal-creationdate").text(projectCreationdate);
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