<%-- 
    Document   : Login
    Created on : 16 abr 2024, 10:34:02
    Author     : IvyDeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
        <script>
            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
            const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
        </script>
        <title>SlowNSteady</title>
    </head>
    <body>
        <div class="container row">
            <div class="md-6 col pt-5">
                <img width="500px" height="500px" src="" alt="alt"/>
            </div>
            <div class="md-6 col pt-5">
                <form class="container row-flex border border-2 rounded" action="" method="POST">
                    <div class="row p-5">
                        <input id="username" type="text" class="form-control mb-3 mt-3" placeholder="Enter your email">
                        <div class="text-start mb-1">
                            <button data-bs-toggle="tooltip" data-bs-html="true"
                                    data-bs-title="asd" 
                                    <i class="bi bi-info-circle"></i>
                            </button>
                        </div>
                        <input id="password" type="password" class="form-control mb-3" placeholder="Enter your password">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="rememberSession" name="Recordar sesión" value="false" checked>
                            <label class="form-check-label">Recordar sesión</label>
                        </div>
                        <a class="align-self-end mb-3 mt-3 text-end">Forgot password?</a>
                        <button id="login-btn" type="button" class="btn btn-primary mb-3">Login</button>
                        <p class="text-center">-or-</p>
                        <button id="register-btn" type="button" class="btn btn-primary">Register Now</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
