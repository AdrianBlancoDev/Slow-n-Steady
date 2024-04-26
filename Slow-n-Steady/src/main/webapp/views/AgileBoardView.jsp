<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Agile Board</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/AgileBoardStyles.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        <script src="scripts/drag.js" defer></script>
        <script>
            $(function () {
                $("#includeHtml").load("views/components/Navbar_View.jsp");
            });
        </script>
    </head>

    <body class="body">
        <div id="includeHtml"></div>
        <!-- BOARD -->
        <div class="board">
            <!-- SPRINT SELECT -->
            <div class="project-sprint-select-create">
                <div class="projectSelect">
                    <select  class="form-select" aria-label="Default Select Example">

                        <c:forEach items="${userProjects}" var="userProject">
                            <option value="${userProject.getId()}">${userProject.getName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="sprintSelect">
                    <select class="form-select" aria-label="Default select example">
                    </select>
                </div>
                <script>
                    $(document).ready(function () {
                        $(".projectSelect").change(function () {
                            // var projectId = $(this).val();
                            var projectId = $(this).find("option:selected").val();
                            console.log(projectId);
                            var $sprintSelect = $(this).closest(".project-sprint-select-create").find(".sprintSelect select");
                            $sprintSelect.empty();
                            $.ajax({
                                url: "getProjectSprints",
                                type: "GET",
                                data: {projectId: projectId},
                                dataType: "json",
                                success: function (data) {
                                    //Now we list the existing sprints for the selected project
                                    $.each(data, function (index, sprint) {
                                        $sprintSelect.append('<option value="' + sprint.id + '">' + sprint.name + '</option>');
                                    });
                                },
                                error: function (xhr, status, error) {
                                    console.error("ERROR getting Project Sprints: " + error);
                                }
                            });
                        });
                    });
                </script>
                <form>
                    <button class="createSprintButton" type="button" data-bs-toggle="modal"
                            data-bs-target="#createSprintModal">Create Sprint +</button>
                    <!-- CREATE SPRINT MODAL -->
                    <div class="modal fade" id="createSprintModal" tabindex="-1"
                         aria-labelledby="createSprintModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="createSprintModalLabel">Creating a Sprint</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="mb-3">
                                            <label for="sprint-name" class="col-form-label">Name:</label>
                                            <input type="text" class="form-control" id="recipient-name">
                                        </div>
                                        <div class="mb-3">
                                            <label for="sprint-description" class="col-form-label">Description:</label>
                                            <textarea class="form-control" id="message-text"></textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label for="date" class="col-form-label">Start Date:</label>
                                            <div class="input-group date" id="startDatePicker">
                                                <input type="text" class="form-control">
                                                <span class="input-group-append">
                                            </div>
                                            <script type="text/javascript">
                                                $(function () {
                                                    $("#startDatePicker").datepicker();
                                                })
                                            </script>
                                        </div>
                                        <div class="mb-3">
                                            <label for="date" class="col-form-label">End Date:</label>
                                            <div class="input-group date" id="endDatePicker">
                                                <input type="text" class="form-control">
                                                <span class="input-group-append">
                                            </div>
                                            <script type="text/javascript">
                                                $(function () {
                                                    $("#endDatePicker").datepicker();
                                                })
                                            </script>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Cancel</button>
                                    <button type="button" class="btn btn-primary">Create Sprint</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="lanes">
                <div id="sprint-backlog-lane" class="swim-lane">
                    <h3 class="heading">Sprint Backlog</h3>
                    <form>
                        <button id="addTaskButton" class="btn btn-secondary btn-lg" type="button" data-bs-toggle="modal"
                                data-bs-target="#addTaskModal"> Add +</button>
                        <!-- ADD TASK MODAL -->
                        <div class="modal fade" id="addTaskModal" tabindex="-1" aria-labelledby="addTaskModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addTaskModalLabel">Adding Tasks</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="input-group mb-3">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" value=""
                                                       aria-label="Checkbox for following text input">
                                            </div>
                                            <input type="text" class="form-control"
                                                   aria-label="Text input with checkbox" value="User Story 1" readonly>
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" value=""
                                                       aria-label="Checkbox for following text input">
                                            </div>
                                            <input type="text" class="form-control"
                                                   aria-label="Text input with checkbox" value="User Story 2" readonly>
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-text">
                                                <input class="form-check-input mt-0" type="checkbox" value=""
                                                       aria-label="Checkbox for following text input">
                                            </div>
                                            <input type="text" class="form-control"
                                                   aria-label="Text input with checkbox" value="User Story 3" readonly>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Cancel</button>
                                        <button type="button" class="btn btn-primary">Add Tasks</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
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