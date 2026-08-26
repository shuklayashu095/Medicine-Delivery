

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">

        <meta name="viewport"
              content="width=device-width, initial-scale=1.0">

        <title>HealthCare 24/7</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
              rel="stylesheet">

        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
              rel="stylesheet">

    </head>
    <!-- ================= LOGIN POPUP ================= -->

    <div class="modal fade"
         id="loginModal"
         tabindex="-1"
         aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered">

            <div class="modal-content rounded-4 border-0 shadow">


                <!-- Header -->

                <div class="modal-header">

                    <div>

                        <h4 class="modal-title fw-bold">
                            Welcome Back
                        </h4>

                        <p class="text-muted mb-0">
                            Login to HealthCare 24/7
                        </p>

                    </div>

                    <button type="button"
                            class="btn-close"
                            id="closeLoginBtn">
                    </button>

                </div>


                <!-- Body -->

                <div class="modal-body p-4">


                    <!-- Google -->

                    <button type="button"
                            class="btn btn-outline-dark w-100 py-2">

                        <i class="bi bi-google me-2"></i>

                        Continue with Google

                    </button>


                    <!-- Divider -->

                    <div class="d-flex align-items-center my-4">

                        <hr class="flex-grow-1">

                        <span class="px-3 text-muted">
                            OR
                        </span>

                        <hr class="flex-grow-1">

                    </div>


                    <!-- Manual Login -->

                    <form action="login"
                          method="post">


                        <div class="mb-3">

                            <label class="form-label fw-semibold">

                                Email or Mobile Number

                            </label>

                            <div class="input-group">

                                <span class="input-group-text">

                                    <i class="bi bi-person"></i>

                                </span>

                                <input type="text"
                                       name="username"
                                       class="form-control"
                                       placeholder="Enter email or mobile"
                                       required>

                            </div>

                        </div>


                        <div class="mb-3">

                            <label class="form-label fw-semibold">

                                Password

                            </label>

                            <div class="input-group">

                                <span class="input-group-text">

                                    <i class="bi bi-lock"></i>

                                </span>

                                <input type="password"
                                       name="password"
                                       id="loginPassword"
                                       class="form-control"
                                       placeholder="Enter password"
                                       required>

                                <button type="button"
                                        class="btn btn-outline-secondary"
                                        id="showPasswordBtn">

                                    <i class="bi bi-eye"
                                       id="passwordIcon"></i>

                                </button>

                            </div>

                        </div>


                        <div class="d-flex justify-content-between mb-4">

                            <div class="form-check">

                                <input type="checkbox"
                                       class="form-check-input"
                                       id="rememberMe">

                                <label class="form-check-label"
                                       for="rememberMe">

                                    Remember me

                                </label>

                            </div>


                            <a href="#"
                               class="text-primary text-decoration-none">

                                Forgot Password?

                            </a>

                        </div>


                        <button type="submit"
                                class="btn btn-primary w-100 py-2">

                            <i class="bi bi-box-arrow-in-right me-2"></i>

                            Login

                        </button>

                    </form>


                    <div class="text-center mt-4">

                        <span class="text-muted">

                            Don't have an account?

                        </span>

                        <a href="register.jsp"
                           class="text-primary fw-semibold
                           text-decoration-none">

                            Create Account

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <!-- js code for the poppup -->
    <script>

        document.addEventListener("DOMContentLoaded", function () {


            // Login button

            const loginBtn =
                    document.getElementById("loginBtn");


            // Login modal

            const loginModalElement =
                    document.getElementById("loginModal");


            // Close button

            const closeLoginBtn =
                    document.getElementById("closeLoginBtn");


            // Bootstrap Modal object

            const loginModal =
                    new bootstrap.Modal(loginModalElement);


            // Login button click

            loginBtn.addEventListener("click", function () {

                loginModal.show();

            });


            // Close button

            closeLoginBtn.addEventListener("click", function () {

                loginModal.hide();

            });


            // Password show/hide

            const showPasswordBtn =
                    document.getElementById("showPasswordBtn");


            const password =
                    document.getElementById("loginPassword");


            const passwordIcon =
                    document.getElementById("passwordIcon");


            showPasswordBtn.addEventListener("click", function () {

                if (password.type === "password") {

                    password.type = "text";

                    passwordIcon.classList.remove("bi-eye");

                    passwordIcon.classList.add("bi-eye-slash");

                } else {

                    password.type = "password";

                    passwordIcon.classList.remove("bi-eye-slash");

                    passwordIcon.classList.add("bi-eye");

                }

            });


        });

    </script>
    <body class="bg-light">


        <!-- ================================================= -->
        <!-- TOP NAVBAR -->
        <!-- ================================================= -->

        <nav class="navbar navbar-expand-lg bg-white border-bottom sticky-top">
            <div class="container mt-3">



                <!-- Logo -->

                <a class="navbar-brand fw-bold fs-4 text-primary"
                   href="#">

                    Health<span class="text-success">Care</span>
                    <span class="text-dark">24/7</span>

                </a>


                <!-- Search -->

                <div class="input-group">

                    <span class="input-group-text bg-light border-end-0">

                        <i class="bi bi-search"></i>

                    </span>


                    <input type="text"
                           id="medicineSearch"
                           class="form-control bg-light border-start-0"
                           placeholder="Search medicines...">


                    <button type="button"
                            class="btn btn-primary"
                            onclick="searchMedicine()">

                        <i class="bi bi-search"></i>

                    </button>

                </div>
                <!-- Location -->

                <div class="d-none d-lg-flex align-items-center me-4">

                    <i class="bi bi-geo-alt-fill text-primary fs-5 me-2"></i>

                    <div>

                        <small class="text-muted">
                            Deliver to
                        </small>

                        <div class="fw-semibold">
                            Select Location
                        </div>

                    </div>

                </div>


                <!-- Login -->

                <!-- Login -->

                <button type="button"
                        class="btn btn-outline-primary me-2"
                        id="loginBtn">

                    <i class="bi bi-person me-1"></i>

                    Login

                </button>


                <!-- Cart -->

                <button class="btn btn-light position-relative">

                    <i class="bi bi-cart3 fs-5"></i>

                    <span class="position-absolute top-0 start-100 translate-middle
                          badge rounded-pill bg-danger">

                        0

                    </span>

                </button>

            </div>

        </nav>



        <!-- ================================================= -->
        <!-- NAVIGATION MENU -->
        <!-- ================================================= -->

        <nav class="navbar navbar-expand-lg bg-white border-bottom">

            <div class="container">

                <div class="navbar-nav mx-auto">

                    <a class="nav-link px-4 fw-semibold text-primary"
                       href="#">

                        <i class="bi bi-house me-1"></i>
                        Home

                    </a>


                    <a class="nav-link px-4"
                       href="#doctors">

                        <i class="bi bi-person-video3 me-1"></i>
                        Consult Doctors

                    </a>


                    <a class="nav-link px-4"
                       href="#medicines">

                        <i class="bi bi-capsule me-1"></i>
                        Medicines

                    </a>


                    <a class="nav-link px-4"
                       href="#">

                        <i class="bi bi-eyedropper me-1"></i>
                        Lab Tests

                    </a>


                    <a class="nav-link px-4"
                       href="#">

                        <i class="bi bi-hospital me-1"></i>
                        Hospitals

                    </a>


                    <a class="nav-link px-4"
                       href="#offers">

                        <i class="bi bi-tag me-1"></i>
                        Offers

                    </a>

                </div>

            </div>

        </nav>



        <!-- ================================================= -->
        <!-- HERO SECTION -->
        <!-- ================================================= -->

        <section class="bg-info-subtle py-5">

            <div class="container">

                <div class="row align-items-center g-4">

                    <!-- Left -->

                    <div class="col-lg-7">

                        <span class="badge bg-primary-subtle text-primary
                              px-3 py-2 mb-3">

                            Trusted Healthcare Platform

                        </span>


                        <h1 class="display-5 fw-bold text-dark">

                            Complete Healthcare
                            <br>

                            <span class="text-primary">
                                At Your Fingertips
                            </span>

                        </h1>


                        <p class="lead text-secondary mt-3">

                            Consult doctors, order medicines,
                            book lab tests and manage your
                            healthcare from one place.

                        </p>


                        <div class="d-flex gap-2 flex-wrap mt-4">

                            <button class="btn btn-primary btn-lg">

                                <i class="bi bi-person-video3 me-2"></i>

                                Consult Doctor

                            </button>


                            <button class="btn btn-outline-primary btn-lg">

                                <i class="bi bi-capsule me-2"></i>

                                Order Medicines

                            </button>
                            <!-- WhatsApp -->

                            <a href="https://wa.me/919876543210?text=Hello%20HealthCare%2024%2F7%2C%20I%20need%20help"
                               target="_blank"
                               class="position-fixed bottom-0 end-0
                               mb-4 me-4
                               btn btn-success
                               rounded-circle
                               shadow-lg
                               d-flex align-items-center
                               justify-content-center"
                               style="width:60px; height:60px; z-index:1050;"
                               title="Chat with us on WhatsApp">

                                <i class="bi bi-whatsapp fs-3"></i>

                            </a>


                        </div>

                    </div>


                    <!-- Right -->

                    <div class="col-lg-5">

                        <div class="bg-white rounded-4 shadow-sm p-5 text-center">

                            <i class="bi bi-heart-pulse text-primary display-1"></i>

                            <h4 class="fw-bold mt-3">
                                Your Health Matters
                            </h4>

                            <p class="text-muted mb-0">

                                Professional healthcare
                                whenever you need it.

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </section>



        <!-- ================================================= -->
        <!-- QUICK SERVICES -->
        <!-- ================================================= -->

        <section class="py-5">

            <div class="container">

                <div class="d-flex justify-content-between
                     align-items-center mb-4">

                    <h2 class="fw-bold mb-0">
                        Healthcare Services
                    </h2>

                    <a href="#" class="text-primary text-decoration-none">
                        View All
                    </a>

                </div>


                <div class="row g-4">


                    <!-- Doctor -->

                    <div class="col-6 col-md-4 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="bg-primary-subtle
                                     rounded-circle
                                     d-inline-flex
                                     align-items-center
                                     justify-content-center
                                     p-3 mb-3">

                                    <i class="bi bi-person-video3
                                       text-primary fs-2"></i>

                                </div>


                                <h5 class="fw-bold">
                                    Consult Doctor
                                </h5>


                                <p class="text-muted small">

                                    Talk to qualified doctors
                                    online.

                                </p>


                                <button class="btn btn-outline-primary btn-sm">

                                    Consult Now

                                </button>

                            </div>

                        </div>

                    </div>



                    <!-- Medicines -->

                    <div class="col-6 col-md-4 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="bg-success-subtle
                                     rounded-circle
                                     d-inline-flex
                                     align-items-center
                                     justify-content-center
                                     p-3 mb-3">

                                    <i class="bi bi-capsule
                                       text-success fs-2"></i>

                                </div>


                                <h5 class="fw-bold">
                                    Order Medicines
                                </h5>


                                <p class="text-muted small">

                                    Get medicines delivered
                                    to your home.

                                </p>


                                <a href="${pageContext.request.contextPath}/SearchMedi"
                                   class="btn btn-primary w-100">

                                    <i class="bi bi-cart-plus me-1"></i>
                                    Order Now

                                </a>

                            </div>

                        </div>

                    </div>



                    <!-- Lab -->

                    <div class="col-6 col-md-4 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="bg-warning-subtle
                                     rounded-circle
                                     d-inline-flex
                                     align-items-center
                                     justify-content-center
                                     p-3 mb-3">

                                    <i class="bi bi-eyedropper
                                       text-warning fs-2"></i>

                                </div>


                                <h5 class="fw-bold">
                                    Lab Tests
                                </h5>


                                <p class="text-muted small">

                                    Book diagnostic tests
                                    from home.

                                </p>


                                <button class="btn btn-outline-warning btn-sm">

                                    Book Test

                                </button>

                            </div>

                        </div>

                    </div>



                    <!-- Appointment -->

                    <div class="col-6 col-md-4 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body text-center p-4">

                                <div class="bg-danger-subtle
                                     rounded-circle
                                     d-inline-flex
                                     align-items-center
                                     justify-content-center
                                     p-3 mb-3">

                                    <i class="bi bi-calendar-check
                                       text-danger fs-2"></i>

                                </div>


                                <h5 class="fw-bold">
                                    Appointments
                                </h5>


                                <p class="text-muted small">

                                    Schedule your hospital
                                    visit.

                                </p>


                                <button class="btn btn-outline-danger btn-sm">

                                    Book Now

                                </button>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>



        <!-- ================================================= -->
        <!-- DOCTORS -->
        <!-- ================================================= -->

        <section id="doctors"
                 class="py-5 bg-white">

            <div class="container">

                <div class="d-flex justify-content-between
                     align-items-center mb-4">

                    <h2 class="fw-bold mb-0">
                        Consult Top Doctors
                    </h2>

                    <a href="#" class="text-primary text-decoration-none">
                        View All
                    </a>

                </div>


                <div class="row g-4">


                    <!-- Doctor 1 -->

                    <div class="col-md-6 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body">

                                <div class="text-center">

                                    <div class="bg-primary-subtle
                                         rounded-circle
                                         d-inline-flex
                                         p-4">

                                        <i class="bi bi-person
                                           text-primary display-6"></i>

                                    </div>

                                </div>


                                <h5 class="fw-bold mt-3">
                                    Dr. Rahul Sharma
                                </h5>


                                <p class="text-muted mb-1">
                                    General Physician
                                </p>


                                <small class="text-secondary">

                                    <i class="bi bi-award"></i>
                                    12 Years Experience

                                </small>


                                <div class="text-warning mt-2">
                                    ★★★★★
                                </div>


                                <button class="btn btn-primary
                                        w-100 mt-3">

                                    Consult Now

                                </button>

                            </div>

                        </div>

                    </div>



                    <!-- Doctor 2 -->

                    <div class="col-md-6 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body">

                                <div class="text-center">

                                    <div class="bg-danger-subtle
                                         rounded-circle
                                         d-inline-flex
                                         p-4">

                                        <i class="bi bi-person
                                           text-danger display-6"></i>

                                    </div>

                                </div>


                                <h5 class="fw-bold mt-3">
                                    Dr. Priya Singh
                                </h5>


                                <p class="text-muted mb-1">
                                    Dermatologist
                                </p>


                                <small class="text-secondary">

                                    <i class="bi bi-award"></i>
                                    10 Years Experience

                                </small>


                                <div class="text-warning mt-2">
                                    ★★★★★
                                </div>


                                <button class="btn btn-primary
                                        w-100 mt-3">

                                    Consult Now

                                </button>

                            </div>

                        </div>

                    </div>



                    <!-- Doctor 3 -->

                    <div class="col-md-6 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body">

                                <div class="text-center">

                                    <div class="bg-success-subtle
                                         rounded-circle
                                         d-inline-flex
                                         p-4">

                                        <i class="bi bi-person
                                           text-success display-6"></i>

                                    </div>

                                </div>


                                <h5 class="fw-bold mt-3">
                                    Dr. Amit Verma
                                </h5>


                                <p class="text-muted mb-1">
                                    Cardiologist
                                </p>


                                <small class="text-secondary">

                                    <i class="bi bi-award"></i>
                                    15 Years Experience

                                </small>


                                <div class="text-warning mt-2">
                                    ★★★★★
                                </div>


                                <button class="btn btn-primary
                                        w-100 mt-3">

                                    Consult Now

                                </button>

                            </div>

                        </div>

                    </div>



                    <!-- Doctor 4 -->

                    <div class="col-md-6 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body">

                                <div class="text-center">

                                    <div class="bg-warning-subtle
                                         rounded-circle
                                         d-inline-flex
                                         p-4">

                                        <i class="bi bi-person
                                           text-warning display-6"></i>

                                    </div>

                                </div>


                                <h5 class="fw-bold mt-3">
                                    Dr. Neha Gupta
                                </h5>


                                <p class="text-muted mb-1">
                                    Pediatrician
                                </p>


                                <small class="text-secondary">

                                    <i class="bi bi-award"></i>
                                    8 Years Experience

                                </small>


                                <div class="text-warning mt-2">
                                    ★★★★★
                                </div>


                                <button class="btn btn-primary
                                        w-100 mt-3">

                                    Consult Now

                                </button>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>



        <!-- ================================================= -->
        <!-- MEDICINES -->
        <!-- ================================================= -->

        <section id="medicines"
                 class="py-5">

            <div class="container">

                <div class="d-flex justify-content-between
                     align-items-center mb-4">

                    <h2 class="fw-bold mb-0">
                        Popular Medicines
                    </h2>

                    <a href="${pageContext.request.contextPath}/SearchMedi"
                       class="btn btn-primary">
                        View All
                    </a>

                </div>


                <div class="row g-4">


                    <!-- Medicine -->

                    <div class="col-6 col-md-4 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body">

                                <div class="bg-light rounded-3
                                     p-4 text-center">

                                    <i class="bi bi-capsule
                                       text-success display-4"></i>

                                </div>


                                <h6 class="fw-bold mt-3">
                                    Vitamin C Tablets
                                </h6>


                                <small class="text-muted">
                                    60 Tablets
                                </small>


                                <div class="mt-2">

                                    <span class="fw-bold">
                                        ₹199
                                    </span>

                                    <span class="text-muted
                                          text-decoration-line-through
                                          small ms-2">

                                        ₹249

                                    </span>

                                </div>


                                <button class="btn btn-primary
                                        btn-sm w-100 mt-3">

                                    <i class="bi bi-cart-plus"></i>

                                    Add to Cart

                                </button>

                            </div>

                        </div>

                    </div>



                    <!-- Medicine -->

                    <div class="col-6 col-md-4 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body">

                                <div class="bg-light rounded-3
                                     p-4 text-center">

                                    <i class="bi bi-capsule
                                       text-success display-4"></i>

                                </div>


                                <h6 class="fw-bold mt-3">
                                    Multivitamin Tablets
                                </h6>


                                <small class="text-muted">
                                    30 Tablets
                                </small>


                                <div class="mt-2">

                                    <span class="fw-bold">
                                        ₹299
                                    </span>

                                    <span class="text-muted
                                          text-decoration-line-through
                                          small ms-2">

                                        ₹350

                                    </span>

                                </div>


                                <button class="btn btn-primary
                                        btn-sm w-100 mt-3">

                                    <i class="bi bi-cart-plus"></i>

                                    Add to Cart

                                </button>

                            </div>

                        </div>

                    </div>



                    <!-- Medicine -->

                    <div class="col-6 col-md-4 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body">

                                <div class="bg-light rounded-3
                                     p-4 text-center">

                                    <i class="bi bi-capsule
                                       text-success display-4"></i>

                                </div>


                                <h6 class="fw-bold mt-3">
                                    Calcium Tablets
                                </h6>


                                <small class="text-muted">
                                    30 Tablets
                                </small>


                                <div class="mt-2">

                                    <span class="fw-bold">
                                        ₹179
                                    </span>

                                    <span class="text-muted
                                          text-decoration-line-through
                                          small ms-2">

                                        ₹220

                                    </span>

                                </div>


                                <button class="btn btn-primary
                                        btn-sm w-100 mt-3">

                                    <i class="bi bi-cart-plus"></i>

                                    Add to Cart

                                </button>

                            </div>

                        </div>

                    </div>



                    <!-- Medicine -->

                    <div class="col-6 col-md-4 col-lg-3">

                        <div class="card border-0 shadow-sm h-100">

                            <div class="card-body">

                                <div class="bg-light rounded-3
                                     p-4 text-center">

                                    <i class="bi bi-capsule
                                       text-success display-4"></i>

                                </div>


                                <h6 class="fw-bold mt-3">
                                    Iron Tablets
                                </h6>


                                <small class="text-muted">
                                    30 Tablets
                                </small>


                                <div class="mt-2">

                                    <span class="fw-bold">
                                        ₹149
                                    </span>

                                    <span class="text-muted
                                          text-decoration-line-through
                                          small ms-2">

                                        ₹190

                                    </span>

                                </div>


                                <button class="btn btn-primary
                                        btn-sm w-100 mt-3">

                                    <i class="bi bi-cart-plus"></i>

                                    Add to Cart

                                </button>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>



        <!-- ================================================= -->
        <!-- OFFER -->
        <!-- ================================================= -->

        <section id="offers"
                 class="py-5">

            <div class="container">

                <div class="bg-primary text-white
                     rounded-4 p-5 shadow-sm">

                    <div class="row align-items-center">

                        <div class="col-md-8">

                            <span class="badge bg-white text-primary mb-3">

                                SPECIAL OFFER

                            </span>


                            <h2 class="fw-bold">

                                Get 20% OFF on your
                                first medicine order

                            </h2>


                            <p class="mb-0">

                                Order medicines online and
                                get them delivered to your home.

                            </p>

                        </div>


                        <div class="col-md-4 text-md-end mt-4 mt-md-0">

                            <button class="btn btn-light
                                    btn-lg text-primary">

                                Order Now

                            </button>

                        </div>

                    </div>

                </div>

            </div>

        </section>



        <!-- ================================================= -->
        <!-- FOOTER -->
        <!-- ================================================= -->

        <footer class="bg-dark text-white pt-5 pb-3">

            <div class="container">

                <div class="row g-4">


                    <div class="col-md-4">

                        <h4 class="fw-bold">

                            Health<span class="text-success">
                                Care
                            </span>

                            24/7

                        </h4>


                        <p class="text-secondary">

                            Your trusted healthcare partner
                            for medicines, consultations
                            and diagnostic services.

                        </p>

                    </div>


                    <div class="col-md-2">

                        <h6 class="fw-bold">
                            Services
                        </h6>

                        <a href="#doctors"
                           class="d-block text-secondary
                           text-decoration-none mb-2">

                            Doctor Consultation

                        </a>


                        <a href="#medicines"
                           class="d-block text-secondary
                           text-decoration-none mb-2">

                            Medicines

                        </a>


                        <a href="#"
                           class="d-block text-secondary
                           text-decoration-none mb-2">

                            Lab Tests

                        </a>

                    </div>


                    <div class="col-md-2">

                        <h6 class="fw-bold">
                            Company
                        </h6>

                        <a href="#"
                           class="d-block text-secondary
                           text-decoration-none mb-2">

                            About Us

                        </a>


                        <a href="#"
                           class="d-block text-secondary
                           text-decoration-none mb-2">

                            Contact Us

                        </a>


                        <a href="#"
                           class="d-block text-secondary
                           text-decoration-none mb-2">

                            Privacy Policy

                        </a>

                    </div>


                    <div class="col-md-4">

                        <h6 class="fw-bold">
                            Contact Us
                        </h6>


                        <p class="text-secondary mb-2">

                            <i class="bi bi-telephone me-2"></i>

                            1800-000-000

                        </p>


                        <p class="text-secondary mb-2">

                            <i class="bi bi-envelope me-2"></i>

                            support@healthcare.com

                        </p>


                        <div class="mt-3">

                            <i class="bi bi-facebook fs-4 me-3"></i>

                            <i class="bi bi-instagram fs-4 me-3"></i>

                            <i class="bi bi-twitter-x fs-4 me-3"></i>

                            <i class="bi bi-youtube fs-4"></i>

                        </div>

                    </div>

                </div>


                <hr class="border-secondary mt-4">


                <div class="text-center text-secondary small">

                    © 2026 HealthCare 24/7.
                    All Rights Reserved.

                </div>

            </div>

        </footer>



        <!-- Bootstrap JS -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">

        </script>
        <script>

            function searchMedicine() {

                const input =
                        document.getElementById("medicineSearch");

                const name =
                        input.value.trim();

                // Empty search
                if (name === "") {

                    alert("Please enter medicine name.");

                    input.focus();

                    return;
                }

                // Search Result Page par redirect
                window.location.href =
                        "SearchResult.jsp?name=" +
                        encodeURIComponent(name);
            }


        // Enter key se bhi search
            document.addEventListener("DOMContentLoaded", function () {

                const input =
                        document.getElementById("medicineSearch");

                input.addEventListener("keypress", function (event) {

                    if (event.key === "Enter") {

                        searchMedicine();

                    }

                });

            });

        </script>    </body>
</html>
