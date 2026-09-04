

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid">
    <div class="row g-0">

        <div class="col-md-2 position-fixed start-0 top-0 vh-100">
            <jsp:include page="extension/SideBar.jsp"/>
        </div>

        <div class="position-fixed top-0 start-0 w-100">
            <jsp:include page="extension/NavBar.jsp"/>

            <div class="container-fluid mt-3">
                Dashboard Content
            </div>
        </div>

    </div>
</div>
          <jsp:include page="extension/MainCont.jsp"/>
      
            <--<!-- footer  -->
<footer class="w-100">
    <jsp:include page="extension/Footer.jsp"/>
</footer>

          
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
