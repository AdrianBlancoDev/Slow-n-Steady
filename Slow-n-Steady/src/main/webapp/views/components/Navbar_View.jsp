<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./styles/navbar/navbar_Css.css"/>
        <title>NavBar</title>
    </head>
    <body>
        <nav id="nav" class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <img src="views/img/Logo4.jpg" class="imgCircle" alt=""/>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="./Projects">Projects</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page"  href="#">User Stories</a>
                      </li>        
                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Agile Board</a>
                      </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </body>
</html>
