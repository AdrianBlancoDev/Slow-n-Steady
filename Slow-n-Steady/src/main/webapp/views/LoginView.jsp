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
        <script src="./login.js"></script>
        <script src="./components/input.password.js"></script>
        <title>SlowNSteady</title>
        <style>
            .halfContainer{
                width: 500px;
                height: 500px;
            }
        </style>
    </head>
    <body>
        <div class="container column halfContainer"> 
            <div>
                <img src="" alt="">
            </div>
            <form class="container flex-row" action="" method="POST">
                <div class="row">
                    <input id="username" type="text" class="form-control mb-3" placeholder="youremail@example.com">
                    <input id="password" type="password" class="form-control mb-3">
                    <a class="align-self-end mb-3">Forgot password?</a>
                    <button id="login-btn" class="button">Login</button>
                    <p class="align-self-center">-or-</p>
                    <button id="register-btn" class="button">Register Now</button>
                </div>
            </form>
        </div>
    </body>
</html>
