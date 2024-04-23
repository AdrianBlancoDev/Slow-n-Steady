<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="import" href="./Navbar_View.jsp"/>
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
        <script>
      $(function() {
         $("#includeHtml").load("views/components/Navbar_View.jsp");
      });
   </script>
    </head>
    <body>
<div id="includeHtml"></div>



        <h1>Hello tasks view!</h1>
    </body>
</html>
