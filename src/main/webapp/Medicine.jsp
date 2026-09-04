<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Medi.java.SearchMedi.Medicine"%>

<!DOCTYPE html>

<html>

    <head>

        <meta charset="UTF-8">

        <meta name="viewport"
              content="width=device-width, initial-scale=1">

        <title>Search Medicine</title>

        <!-- Bootstrap -->

        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

    </head>


    <body class="bg-light">


        <!-- ==========================================
             NAVBAR
             ========================================== -->

        <nav class="navbar navbar-dark bg-primary">

            <div class="container">

                <a class="navbar-brand"
                   href="#">

                    MediX

                </a>

            </div>

        </nav>


        <!-- ==========================================
             MAIN CONTAINER
             ========================================== -->

        <div class="container py-5">


            <h2 class="text-center mb-4">

                Search Medicine

            </h2>


            <!-- ==========================================
                 SEARCH BAR
                 ========================================== -->

            <form
                action="${pageContext.request.contextPath}/SearchMedi"
                method="get"
                class="mb-5">

                <div class="input-group">

                    <input
                        type="text"
                        name="name"
                        class="form-control form-control-lg"
                        placeholder="Enter medicine name..."
                        value="${search}"
                        required>

                    <button
                        type="submit"
                        class="btn btn-primary">

                        Search

                    </button>

                </div>

            </form>


            <!-- ==========================================
                 MESSAGE
                 ========================================== -->

            <%
                String message
                        = (String) request.getAttribute("message");
            %>


            <% if (message != null) {%>

            <div class="alert alert-warning text-center">

                <%= message%>

            </div>

            <% } %>


            <!-- ==========================================
                 MEDICINE LIST
                 ========================================== -->

            <%
                List<Medicine> medicines
                        = (List<Medicine>) request.getAttribute("medicines");
            %>


            <% if (medicines != null && !medicines.isEmpty()) { %>


            <div class="row">


                <% for (Medicine medicine : medicines) { %>


                <div class="col-md-4 col-lg-3 mb-4">


                    <div class="card h-100 shadow-sm">


                        <!-- IMAGE -->

                        <%
                            String image
                                    = medicine.getImage();
                        %>


                        <% if (image != null
                                    && !image.trim().isEmpty()) {%>


                        <img
                            src="<%= image%>"
                            class="card-img-top p-3"
                            style="height:200px; object-fit:contain;"
                            alt="Medicine">


                        <% } else { %>


                        <div
                            class="d-flex align-items-center justify-content-center bg-light"
                            style="height:200px;">

                            <span class="text-muted">

                                No Image

                            </span>

                        </div>


                        <% }%>


                        <!-- CARD BODY -->

                        <div class="card-body">


                            <h5 class="card-title">

                                <%= medicine.getName()%>

                            </h5>


                            <% if (medicine.getGenericName()
                                        != null) {%>

                            <p class="text-muted mb-1">

                                <%= medicine.getGenericName()%>

                            </p>

                            <% } %>


                            <% if (medicine.getBrandName()
                                        != null) {%>

                            <p class="mb-1">

                                <strong>Brand:</strong>

                                <%= medicine.getBrandName()%>

                            </p>

                            <% } %>


                            <% if (medicine.getStrength()
                                        != null) {%>

                            <p class="mb-1">

                                <strong>Strength:</strong>

                                <%= medicine.getStrength()%>

                            </p>

                            <% }%>


                            <h5 class="text-success mt-3">

                                ₹ <%= medicine.getPrice()%>

                            </h5>


                        </div>


                        <!-- CARD FOOTER -->

                        <div class="card-footer bg-white">


                            <a
                                href="${pageContext.request.contextPath}/OrderNow?id=<%= medicine.getId()%>"
                                class="btn btn-primary w-100">

                                Buy Now

                            </a>


                        </div>


                    </div>


                </div>


                <% } %>


            </div>


            <% }%>


        </div>


        <!-- Bootstrap JS -->

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
        </script>


    </body>

</html>