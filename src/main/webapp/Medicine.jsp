<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Medi.java.SearchMedi.Medicine"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Medicines</title>

    <!-- Bootstrap -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

<div class="container py-4">

    <!-- ==========================================
         HEADER
         ========================================== -->

    <div class="d-flex justify-content-between
                align-items-center mb-4">

        <div>

            <h2 class="fw-bold mb-1">
                Medicines
            </h2>

            <p class="text-muted mb-0">

                Available medicines:
                ${totalRecords}

            </p>

        </div>

    </div>


    <!-- ==========================================
         ERROR
         ========================================== -->

    <% if (request.getAttribute("error") != null) { %>

        <div class="alert alert-danger">

            <%= request.getAttribute("error") %>

        </div>

    <% } %>


    <!-- ==========================================
         MEDICINE GRID
         ========================================== -->

    <div class="row g-4">

        <%
            List<Medicine> medicines =
                    (List<Medicine>)
                    request.getAttribute("medicines");

            if (medicines != null &&
                !medicines.isEmpty()) {

                for (Medicine medicine : medicines) {
        %>

        <div class="col-xl-3
                    col-lg-4
                    col-md-6
                    col-sm-6">

            <div class="card h-100 shadow-sm">

                <!-- IMAGE -->

                <div class="text-center p-3">

                    <%
                        String image =
                                medicine.getImage();

                        if (image != null &&
                            !image.trim().isEmpty()) {
                    %>

                        <img
                            src="<%= image %>"
                            class="img-fluid"
                            style="height:180px;
                                   object-fit:contain;"
                            alt="Medicine">

                    <%
                        } else {
                    %>

                        <div
                            class="d-flex
                                   justify-content-center
                                   align-items-center
                                   bg-light"
                            style="height:180px;">

                            <span class="text-muted">
                                No Image
                            </span>

                        </div>

                    <%
                        }
                    %>

                </div>


                <!-- DETAILS -->

                <div class="card-body">

                    <h5 class="card-title">

                        <%= medicine.getName() %>

                    </h5>


                    <% if (medicine.getGenericName()
                            != null) { %>

                        <p class="text-muted mb-1">

                            <small>
                                Generic:
                                <%= medicine.getGenericName() %>
                            </small>

                        </p>

                    <% } %>


                    <% if (medicine.getManufacturer()
                            != null) { %>

                        <p class="mb-1">

                            <small>

                                Manufacturer:
                                <%= medicine.getManufacturer() %>

                            </small>

                        </p>

                    <% } %>


                    <% if (medicine.getStrength()
                            != null) { %>

                        <p class="mb-2">

                            <small>

                                Strength:
                                <%= medicine.getStrength() %>

                            </small>

                        </p>

                    <% } %>


                    <h5 class="text-success">

                        ₹<%= String.format(
                                "%.2f",
                                medicine.getPrice()
                           ) %>

                    </h5>

                </div>


                <!-- BUTTON -->

                <div class="card-footer bg-white">

                    <button
                        class="btn btn-primary w-100">

                        View Medicine

                    </button>

                </div>

            </div>

        </div>

        <%
                }

            } else {
        %>

            <div class="col-12">

                <div class="alert alert-warning">

                    No medicines found.

                </div>

            </div>

        <%
            }
        %>

    </div>


    <!-- ==========================================
         PAGINATION
         ========================================== -->

    <%
        Integer currentPage =
                (Integer)
                request.getAttribute("currentPage");

        Integer totalPages =
                (Integer)
                request.getAttribute("totalPages");

        if (totalPages != null &&
            totalPages > 1) {
    %>

    <nav class="mt-5">

        <ul class="pagination
                   justify-content-center">


            <!-- PREVIOUS -->

            <% if (currentPage > 1) { %>

                <li class="page-item">

                    <a class="page-link"
                       href="SearchMedi?page=<%= currentPage - 1 %>">

                        Previous

                    </a>

                </li>

            <% } else { %>

                <li class="page-item disabled">

                    <span class="page-link">
                        Previous
                    </span>

                </li>

            <% } %>


            <!-- PAGE NUMBERS -->

            <%
                int startPage =
                        Math.max(
                            1,
                            currentPage - 2
                        );

                int endPage =
                        Math.min(
                            totalPages,
                            currentPage + 2
                        );

                for (int i = startPage;
                     i <= endPage;
                     i++) {
            %>

                <li class="page-item
                    <%= i == currentPage
                        ? "active"
                        : "" %>">

                    <a class="page-link"
                       href="SearchMedi?page=<%= i %>">

                        <%= i %>

                    </a>

                </li>

            <%
                }
            %>


            <!-- NEXT -->

            <% if (currentPage < totalPages) { %>

                <li class="page-item">

                    <a class="page-link"
                       href="SearchMedi?page=<%= currentPage + 1 %>">

                        Next

                    </a>

                </li>

            <% } else { %>

                <li class="page-item disabled">

                    <span class="page-link">
                        Next
                    </span>

                </li>

            <% } %>


        </ul>

    </nav>

    <% } %>


    <!-- PAGE INFORMATION -->

    <div class="text-center text-muted mt-3">

        Page
        ${currentPage}
        of
        ${totalPages}

    </div>

</div>

</body>

</html>