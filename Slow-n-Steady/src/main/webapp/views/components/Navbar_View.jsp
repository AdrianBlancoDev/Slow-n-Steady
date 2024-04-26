<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./styles/navbar/navbar_Css.css"/>
        <title>NavBar</title>
    </head>
    <body>
        <!--Navbar 2.0 -->
        <div class="container-fluid-md">
            <nav class="bg-image navbar border-bottom border-success border-4 border-opacity-50">
                <div class="container-fluid-md ms-4">
                    <div class="row align-items-center">
                        <div class="col col-md-1">
                            <img src="views/img/Logo4.jpg" class="imgCircle" alt=""/>
                        </div>
                        <div class="col-md-10 d-none d-md-block">
                            <nav class="navbar navbar-expand-lg">
                                <div class="container" id="navbarSupportedContent">
                                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                        <li class="nav-item p-2">
                                            <a class="btn btn-dark bg-gradient" aria-current="page" href="./Projects">Projects</a>
                                        </li>
                                        <li class="nav-item p-2">
                                            <a class="btn btn-dark bg-gradient" aria-current="page" href="./UserStories">User Stories</a>
                                        </li>        
                                        <li class="nav-item p-2">
                                            <a class="btn btn-dark bg-gradient" aria-current="page" href="./AgileBoard">Agile Board</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                        <!-- Offcanvas -->
                        <div class="col col-md-1">
                            <button class="navbar-toggler dropdown-button border border-4 border-black" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="bg-image offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                                <div class="offcanvas-header">
                                    <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Username</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                </div>
                                <div class="offcanvas-body">
                                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                                        <li class="nav-item p-2">
                                            <a class="btn btn-dark bg-gradient" aria-current="page" href="./Projects">Home</a>
                                        </li>
                                        <li class="nav-item p-2">
                                            <button class="btn btn-dark bg-gradient" href="#">Profile</button>
                                        </li>
                                        <li class="nav-item p-2 d-md-none">
                                            <a class="btn btn-dark bg-gradient" aria-current="page" href="./Projects">Projects</a>
                                        </li>
                                        <li class="nav-item p-2 d-md-none">
                                            <a class="btn btn-dark bg-gradient" aria-current="page" href="./UserStories">User Stories</a>
                                        </li>        
                                        <li class="nav-item p-2 d-md-none">
                                            <a class="btn btn-dark bg-gradient" aria-current="page" href="./AgileBoard">Agile Board</a>
                                        </li>
                                        <li class="nav-item dropdown p-2">
                                            <button class="btn btn-dark bg-gradient dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                Dropdown
                                            </button>
                                            <ul class="dropdown-menu text-bg-dark">
                                                <li><button class="dropdown-item btn btn-dark text-light custom-btn" href="#">Action</button></li>
                                                <li><button class="dropdown-item btn btn-dark text-light custom-btn" href="#">Another action</button></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><button class="dropdown-item btn btn-dark text-light custom-btn" href="#">Something else here</button></li>
                                            </ul>
                                        </li>
                                        <li class="nav-item p-2 ">
                                            <a type="button" class="btn btn-outline-* p-0 fw-bold text-decoration-underline" data-bs-toggle="modal" data-bs-target="#presentacionModal">About Us</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Modal para la presentacion -->
        <div class="modal fade" id="presentacionModal">
            <div class="modal-dialog modal-dialog-centered modal-fullscreen">
                <div class="modal-content bg-image-modal">
                    <!-- Modal Header -->
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div id="carouselExample" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="views/carousel/" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="views/carousel/" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="views/carousel/" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="views/carousel/" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="views/carousel/" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="views/carousel/" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
