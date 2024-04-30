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
        <title>SlowNSteady</title>
        <style>
            .gradient-custom-2 {
                /* fallback for old browsers */
                /*background: #fccb90;*/

                /* Chrome 10-25, Safari 5.1-6 */
                /*background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);*/

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                /*background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);*/

                background: rgb(15,15,17);
                background: linear-gradient(90deg, rgba(15,15,17,1) 0%, rgba(147,49,189,1) 33%, rgba(26,29,189,1) 100%);
            }

            .purple-background{
                background: url("https://cdn.discordapp.com/attachments/1229455660035342397/1232234911889621013/bg3.png?ex=6630a0b0&is=662f4f30&hm=658594aeea72b9cf7e989231bbfbc8276576a9ee2321e7fde30a40deda07be8d&");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }



            @media (min-width: 768px) {
                .gradient-form {
                    height: 100vh !important;
                }
            }
            @media (min-width: 769px) {
                .gradient-custom-2 {
                    border-top-right-radius: .3rem;
                    border-bottom-right-radius: .3rem;
                }
            }

            .logo{
                border-radius: 50%;
            }
        </style>
        <script>
            $(document).ready(() => {
                $("#loginBtn").click(() => {
                    const user = $("#user").val();
                    const password = $("#password").val();
                    $.ajax({
                        type: "POST",
                        url: "userExists",
                        dataType: "json",
                        data: {
                            user: user,
                            password: password
                        },
                        success: function (response) {
                            window.location = response.url;
                            console.log("Success:", response); // Log the response to the console
                        },
                        error: function (xhr, status, error) {
                            console.log("Error:", error); // Log the error to the console
                        }
                    });
                });
            });

        </script>
    </head>
    <body>
        <section class="h-100 gradient-form" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-6 d-flex align-items-center purple-background">
                                    <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                        <p class="small mb-0">An application to manage little teams with Scrum methodologies</p>
                                        <h4 class="mb-4">Win the race. Together</h4>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">

                                        <div class="text-center">
                                            <img class="logo" src="views/img/Logo4.jpg"
                                                 style="width: 185px;" alt="logo">
                                            <h4 class="mt-1 mb-5 pb-1">Slow and Steady</h4>
                                        </div>

                                        <form  class="needs-validation" novalidate>
                                            <div class="form-outline mb-4">
                                                <input id="user" class="form-control" name="user" required
                                                       placeholder="User name" />
                                                <div class="invalid-feedback">
                                                    Please enter username
                                                </div>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="password" id="password" class="form-control" name="password" placeholder="Password" required/>
                                                <div class="invalid-feedback">
                                                    Please enter the password
                                                </div>
                                            </div>
                                            <div class="text-center pt-1 mb-5 pb-1 container row">
                                                <button  class="btn btn-primary btn-block border border-0 gradient-custom-2 col" id="loginBtn" >Log
                                                    in</button>
                                                <!--<a class="text-muted text-end col" href="#!">Forgot password?</a>-->
                                            </div>

                                        </form>
                                        <form>
                                            <div class="d-flex align-items-center justify-content-center pb-4">
                                                <p class="mb-0 me-2">Don't have an account?</p>
                                                <button type="submit" formaction="./register" formmethod="GET" class="btn btn-primary btn-block border border-0 btn gradient-custom-2">Create new</button>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <script>
        (function () {
            'use strict';

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                    .forEach(function (form) {
                        form.addEventListener('submit', function (event) {
                            if (!form.checkValidity()) {
                                event.preventDefault();
                                event.stopPropagation();
                            }

                            form.classList.add('was-validated');
                        }, false);
                    });
        })();
    </script>
</html>
