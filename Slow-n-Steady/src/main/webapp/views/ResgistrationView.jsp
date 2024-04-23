<%-- 
    Document   : Resgistration
    Created on : 21 abr 2024, 19:38:33
    Author     : ivan-
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
        </style>
    </head>
    <body>
        <section class="h-100 gradient-form" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                    <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                        <h4 class="mb-4">[Eslogan]></h4>
                                        <p class="small mb-0">[Descripcion de la aplicacion]</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">

                                        <div class="text-center">
                                            <img src="./img/Logo4.jpg"
                                                 style="width: 185px;" alt="logo">
                                            <h4 class="mt-1 mb-5 pb-1">Slow and Steady</h4>
                                        </div>

                                        <form method="POST" action="./login">
                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input id="user" class="form-control"
                                                       placeholder="User name" name="user"/>
                                            </div>
                                            
                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="email" id="email" class="form-control"
                                                       placeholder="Email" name="email"/>
                                            </div>

                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="password" id="password" class="form-control" name="password" />
                                            </div>
                                            <div class="d-flex align-items-center justify-content-center pb-4">
                                                <button type="submit" formaction="./register" class="btn">Sign in</button>
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
</html>
