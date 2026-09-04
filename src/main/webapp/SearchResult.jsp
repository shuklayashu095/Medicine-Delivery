<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="Medi.java.SearchMedi.Medicine"%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Search Medicines</title>


    <!-- Bootstrap -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">


    <!-- Bootstrap Icons -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">

</head>


<body class="bg-light">


<!-- ===================================================== -->
<!-- NAVBAR -->
<!-- ===================================================== -->

<nav class="navbar navbar-expand-lg bg-white border-bottom sticky-top">

    <div class="container">

        <a class="navbar-brand fw-bold fs-4 text-primary"
           href="index.jsp">

            Health<span class="text-success">Care</span>
            <span class="text-dark">24/7</span>

        </a>


        <!-- SEARCH BAR -->

        <form
            action="${pageContext.request.contextPath}/SearchMedi"
            method="get"
            class="d-flex flex-grow-1 mx-4">

            <div class="input-group">

                <span class="input-group-text bg-light">

                    <i class="bi bi-search"></i>

                </span>


                <input
                    type="text"
                    name="name"
                    value="<%= request.getAttribute("searchName") != null
                            ? request.getAttribute("searchName")
                            : "" %>"
                    class="form-control bg-light"
                    placeholder="Search medicines..."
                    required>


                <button
                    type="submit"
                    class="btn btn-primary">

                    <i class="bi bi-search me-1"></i>

                    Search

                </button>

            </div>

        </form>


        <!-- CART -->

        <button class="btn btn-light position-relative">

            <i class="bi bi-cart3 fs-5"></i>

            <span
                class="position-absolute top-0 start-100
                       translate-middle badge rounded-pill bg-danger">

                0

            </span>

        </button>

    </div>

</nav>



<!-- ===================================================== -->
<!-- MAIN -->
<!-- ===================================================== -->

<div class="container py-5">


<%
    List<Medicine> searchResults =
            (List<Medicine>) request.getAttribute("searchResults");

    List<Medicine> relatedMedicines =
            (List<Medicine>) request.getAttribute("relatedMedicines");

    String searchName =
            (String) request.getAttribute("searchName");
%>



<!-- ===================================================== -->
<!-- SEARCH RESULT -->
<!-- ===================================================== -->

<div class="mb-4">

    <h2 class="fw-bold">

        Search Results

    </h2>


    <%
        if (searchName != null && !searchName.trim().isEmpty()) {
    %>

        <p class="text-muted">

            Results for:
            <strong>
                <%= searchName %>
            </strong>

        </p>

    <%
        }
    %>

</div>



<%
    if (searchResults != null &&
        !searchResults.isEmpty()) {
%>


<!-- ===================================================== -->
<!-- MEDICINE RESULTS -->
<!-- ===================================================== -->

<div class="row g-4">


<%
    for (Medicine medicine : searchResults) {
%>


<div class="col-12 col-md-6 col-lg-4">

    <div class="card border-0 shadow-sm h-100">


        <!-- IMAGE -->

        <div class="bg-white text-center p-4">

            <%
                if (medicine.getImage() != null &&
                    !medicine.getImage().trim().isEmpty()) {
            %>

                <img
                    src="<%= medicine.getImage() %>"
                    class="img-fluid"
                    style="height:220px; object-fit:contain;"
                    alt="<%= medicine.getName() %>">

            <%
                } else {
            %>

                <i
                    class="bi bi-capsule text-success"
                    style="font-size:100px;">
                </i>

            <%
                }
            %>

        </div>



        <!-- DETAILS -->

        <div class="card-body">


            <h4 class="fw-bold">

                <%= medicine.getName() %>

            </h4>


            <p class="text-muted">

                <%= medicine.getDescription() != null
                    ? medicine.getDescription()
                    : "Medicine details available." %>

            </p>


            <%
                if (medicine.getManufacturer() != null &&
                    !medicine.getManufacturer().trim().isEmpty()) {
            %>

            <p class="mb-2">

                <strong>Manufacturer:</strong>

                <%= medicine.getManufacturer() %>

            </p>

            <%
                }
            %>


            <!-- PRICE -->

            <h4 class="text-success fw-bold">

                ₹<%= medicine.getPrice() %>

            </h4>



            <!-- BUTTONS -->

            <div class="d-flex gap-2 mt-3">

                <button
                    class="btn btn-outline-primary flex-grow-1">

                    <i class="bi bi-cart-plus"></i>

                    Add to Cart

                </button>


                <a
                    href="${pageContext.request.contextPath}/OrderNow?id=<%= medicine.getId() %>"
                    class="btn btn-primary flex-grow-1">

                    Buy Now

                </a>

            </div>

        </div>

    </div>

</div>


<%
    }
%>


</div>


<%
    } else {
%>


<!-- ===================================================== -->
<!-- NOT FOUND -->
<!-- ===================================================== -->

<div class="alert alert-warning text-center py-4">

    <i class="bi bi-exclamation-circle fs-3"></i>

    <h4 class="fw-bold mt-2">

        Medicine Not Found

    </h4>

    <p class="mb-0">

        We couldn't find
        <strong><%= searchName %></strong>
        in our database.

    </p>

</div>


<%
    }
%>



<!-- ===================================================== -->
<!-- RELATED MEDICINES -->
<!-- ===================================================== -->

<div class="mt-5">


    <h2 class="fw-bold mb-4">

        <i class="bi bi-capsule text-success me-2"></i>

        You May Also Like

    </h2>



    <div class="row g-4">


<%
    if (relatedMedicines != null) {

        for (Medicine medicine : relatedMedicines) {
%>


<div class="col-6 col-md-4 col-lg-3">


    <div class="card border-0 shadow-sm h-100">


        <!-- IMAGE -->

        <div class="bg-white rounded-top text-center p-4">

            <%
                if (medicine.getImage() != null &&
                    !medicine.getImage().trim().isEmpty()) {
            %>

                <img
                    src="<%= medicine.getImage() %>"
                    class="img-fluid"
                    style="height:150px; object-fit:contain;"
                    alt="<%= medicine.getName() %>">

            <%
                } else {
            %>

                <i
                    class="bi bi-capsule text-success"
                    style="font-size:70px;">
                </i>

            <%
                }
            %>

        </div>



        <!-- DETAILS -->

        <div class="card-body">


            <h6 class="fw-bold">

                <%= medicine.getName() %>

            </h6>


            <p class="text-muted small mb-2">

                <%= medicine.getDescription() != null
                    ? medicine.getDescription()
                    : "Medicine" %>

            </p>


            <h5 class="fw-bold text-success">

                ₹<%= medicine.getPrice() %>

            </h5>


            <a
                href="${pageContext.request.contextPath}/OrderNow?id=<%= medicine.getId() %>"
                class="btn btn-primary btn-sm w-100 mt-2">

                Buy Now

            </a>

        </div>

    </div>

</div>


<%
        }
    }
%>


    </div>

</div>


</div>



<!-- ===================================================== -->
<!-- FOOTER -->
<!-- ===================================================== -->

<footer class="bg-dark text-white py-4 mt-5">

    <div class="container text-center">

        <h5 class="fw-bold">

            Health<span class="text-success">Care</span> 24/7

        </h5>

        <p class="text-secondary mb-0">

            Your trusted healthcare partner.

        </p>

    </div>

</footer>



<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>