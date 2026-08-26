<%-- 
    Document   : MainCont
    Created on : Aug 3, 2026, 10:36:57 PM
    Author     : yashu
--%>

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
<div class="col-md-10 ms-auto pt-5">

    <div class="container-fluid py-4">

        <!-- ================= SUMMARY CARDS ================= -->
        <div class="row g-3 mb-3">

            <!-- Total Orders -->
            <div class="col-xl col-md-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex align-items-center">

                            <div class="rounded-circle bg-primary-subtle p-3 me-3">
                                <i class="bi bi-bag text-primary fs-4"></i>
                            </div>

                            <div>
                                <small class="text-muted">Total Orders</small>
                                <h3 class="mb-1">1,248</h3>
                                <small class="text-success">
                                    <i class="bi bi-arrow-up"></i> 18.5%
                                </small>
                                <small class="text-muted"> from last month</small>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


            <!-- Total Sales -->
            <div class="col-xl col-md-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">

                        <div class="d-flex align-items-center">

                            <div class="rounded-circle bg-success-subtle p-3 me-3">
                                <span class="text-success fs-3">₹</span>
                            </div>

                            <div>
                                <small class="text-muted">Total Sales</small>
                                <h3 class="mb-1">₹2,45,680</h3>
                                <small class="text-success">
                                    <i class="bi bi-arrow-up"></i> 21.4%
                                </small>
                                <small class="text-muted"> from last month</small>
                            </div>

                        </div>

                    </div>
                </div>
            </div>


            <!-- Users -->
            <div class="col-xl col-md-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">

                        <div class="d-flex align-items-center">

                            <div class="rounded-circle bg-primary-subtle p-3 me-3">
                                <i class="bi bi-people text-primary fs-4"></i>
                            </div>

                            <div>
                                <small class="text-muted">Users</small>
                                <h3 class="mb-1">3,742</h3>
                                <small class="text-success">
                                    <i class="bi bi-arrow-up"></i> 12.6%
                                </small>
                                <small class="text-muted"> from last month</small>
                            </div>

                        </div>

                    </div>
                </div>
            </div>


            <!-- Doctors -->
            <div class="col-xl col-md-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">

                        <div class="d-flex align-items-center">

                            <div class="rounded-circle bg-warning-subtle p-3 me-3">
                                <i class="bi bi-heart-pulse text-warning fs-4"></i>
                            </div>

                            <div>
                                <small class="text-muted">Doctors</small>
                                <h3 class="mb-1">86</h3>
                                <small class="text-success">
                                    <i class="bi bi-arrow-up"></i> 8.3%
                                </small>
                                <small class="text-muted"> from last month</small>
                            </div>

                        </div>

                    </div>
                </div>
            </div>


            <!-- Delivery -->
            <div class="col-xl col-md-6">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">

                        <div class="d-flex align-items-center">

                            <div class="rounded-circle bg-danger-subtle p-3 me-3">
                                <i class="bi bi-bicycle text-danger fs-4"></i>
                            </div>

                            <div>
                                <small class="text-muted">Delivery Partners</small>
                                <h3 class="mb-1">120</h3>
                                <small class="text-success">
                                    <i class="bi bi-arrow-up"></i> 15.7%
                                </small>
                                <small class="text-muted"> from last month</small>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </div>


        <!-- ================= CHART + APPOINTMENTS ================= -->

        <div class="row g-3 mb-3">

            <!-- Order Overview -->
            <div class="col-lg-5">

                <div class="card border-0 shadow-sm h-100">

                    <div class="card-body">

                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="mb-0">Order Overview</h5>

                            <select class="form-select form-select-sm w-auto">
                                <option>Last 7 Days</option>
                                <option>Last 30 Days</option>
                                <option>This Year</option>
                            </select>
                        </div>

                        <div style="height:280px;">
                            <canvas id="orderChart"></canvas>
                        </div>

                    </div>

                </div>

            </div>


            <!-- Order Status -->
            <div class="col-lg-4">

                <div class="card border-0 shadow-sm h-100">

                    <div class="card-body">

                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="mb-0">Order Status</h5>

                            <select class="form-select form-select-sm w-auto">
                                <option>This Month</option>
                                <option>Last Month</option>
                            </select>
                        </div>

                        <div style="height:280px;">
                            <canvas id="statusChart"></canvas>
                        </div>

                    </div>

                </div>

            </div>


            <!-- Today's Appointments -->
            <div class="col-lg-3">

                <div class="card border-0 shadow-sm h-100">

                    <div class="card-body">

                        <div class="d-flex justify-content-between mb-3">
                            <h5 class="mb-0">Today's Appointments</h5>
                            <a href="#" class="text-primary text-decoration-none small">
                                View All
                            </a>
                        </div>


                        <!-- Doctor 1 -->
                        <div class="d-flex align-items-center justify-content-between bg-light rounded p-2 mb-2">

                            <div class="d-flex align-items-center">
                                <div class="rounded-circle bg-primary text-white p-2 me-2">
                                    <i class="bi bi-person"></i>
                                </div>

                                <div>
                                    <strong class="small">Dr. Rahul Verma</strong>
                                    <div class="text-muted small">Cardiologist</div>
                                </div>
                            </div>

                            <span class="badge bg-success-subtle text-success">
                                10:00 AM
                            </span>

                        </div>


                        <!-- Doctor 2 -->
                        <div class="d-flex align-items-center justify-content-between bg-light rounded p-2 mb-2">

                            <div class="d-flex align-items-center">
                                <div class="rounded-circle bg-danger text-white p-2 me-2">
                                    <i class="bi bi-person"></i>
                                </div>

                                <div>
                                    <strong class="small">Dr. Priya Sharma</strong>
                                    <div class="text-muted small">Dermatologist</div>
                                </div>
                            </div>

                            <span class="badge bg-success-subtle text-success">
                                11:30 AM
                            </span>

                        </div>


                        <!-- Doctor 3 -->
                        <div class="d-flex align-items-center justify-content-between bg-light rounded p-2 mb-2">

                            <div class="d-flex align-items-center">
                                <div class="rounded-circle bg-warning text-white p-2 me-2">
                                    <i class="bi bi-person"></i>
                                </div>

                                <div>
                                    <strong class="small">Dr. Amit Singh</strong>
                                    <div class="text-muted small">Neurologist</div>
                                </div>
                            </div>

                            <span class="badge bg-success-subtle text-success">
                                02:00 PM
                            </span>

                        </div>


                        <!-- Doctor 4 -->
                        <div class="d-flex align-items-center justify-content-between bg-light rounded p-2">

                            <div class="d-flex align-items-center">
                                <div class="rounded-circle bg-info text-white p-2 me-2">
                                    <i class="bi bi-person"></i>
                                </div>

                                <div>
                                    <strong class="small">Dr. Neha Patel</strong>
                                    <div class="text-muted small">Pediatrician</div>
                                </div>
                            </div>

                            <span class="badge bg-success-subtle text-success">
                                04:30 PM
                            </span>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- ================= BOTTOM SECTION ================= -->

        <div class="row g-3">


            <!-- Recent Orders -->
            <div class="col-lg-4">

                <div class="card border-0 shadow-sm">

                    <div class="card-body p-0">

                        <div class="d-flex justify-content-between align-items-center p-3">
                            <h5 class="mb-0">Recent Orders</h5>
                            <a href="#" class="text-primary text-decoration-none small">
                                View All
                            </a>
                        </div>

                        <div class="table-responsive">

                            <table class="table table-hover align-middle mb-0">

                                <thead class="table-light">
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Customer</th>
                                        <th>Amount</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <tr>
                                        <td>#ORD1248</td>
                                        <td>Rahul Sharma</td>
                                        <td>₹1,280</td>
                                        <td>
                                            <span class="badge bg-success-subtle text-success">
                                                Delivered
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>#ORD1247</td>
                                        <td>Priya Gupta</td>
                                        <td>₹890</td>
                                        <td>
                                            <span class="badge bg-info-subtle text-info">
                                                Out for Delivery
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>#ORD1246</td>
                                        <td>Amit Kumar</td>
                                        <td>₹1,450</td>
                                        <td>
                                            <span class="badge bg-primary-subtle text-primary">
                                                Packed
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>#ORD1245</td>
                                        <td>Neha Verma</td>
                                        <td>₹560</td>
                                        <td>
                                            <span class="badge bg-warning-subtle text-warning">
                                                Confirmed
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>#ORD1244</td>
                                        <td>Suresh Patil</td>
                                        <td>₹1,100</td>
                                        <td>
                                            <span class="badge bg-danger-subtle text-danger">
                                                Pending
                                            </span>
                                        </td>
                                    </tr>

                                </tbody>

                            </table>

                        </div>

                    </div>

                </div>

            </div>


            <!-- Recent Users -->
            <div class="col-lg-4">

                <div class="card border-0 shadow-sm">

                    <div class="card-body p-0">

                        <div class="d-flex justify-content-between align-items-center p-3">
                            <h5 class="mb-0">Recent Users</h5>

                            <a href="#" class="text-primary text-decoration-none small">
                                View All
                            </a>
                        </div>

                        <div class="table-responsive">

                            <table class="table table-hover align-middle mb-0">

                                <thead class="table-light">
                                    <tr>
                                        <th>User</th>
                                        <th>Email</th>
                                        <th>Joined On</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <tr>
                                        <td>Rahul Sharma</td>
                                        <td>rahul@gmail.com</td>
                                        <td>01 Jun 2025</td>
                                    </tr>

                                    <tr>
                                        <td>Priya Gupta</td>
                                        <td>priya@gmail.com</td>
                                        <td>01 Jun 2025</td>
                                    </tr>

                                    <tr>
                                        <td>Amit Kumar</td>
                                        <td>amit@gmail.com</td>
                                        <td>31 May 2025</td>
                                    </tr>

                                    <tr>
                                        <td>Neha Verma</td>
                                        <td>neha@gmail.com</td>
                                        <td>31 May 2025</td>
                                    </tr>

                                    <tr>
                                        <td>Suresh Patil</td>
                                        <td>suresh@gmail.com</td>
                                        <td>30 May 2025</td>
                                    </tr>

                                </tbody>

                            </table>

                        </div>

                    </div>

                </div>

            </div>


            <!-- Right Side -->
            <div class="col-lg-4">


                <!-- Live Consultations -->
                <div class="card border-0 shadow-sm mb-3">

                    <div class="card-body">

                        <div class="d-flex justify-content-between mb-3">
                            <h5 class="mb-0">Live Consultations</h5>

                            <a href="#" class="text-primary text-decoration-none small">
                                View All
                            </a>
                        </div>

                        <div class="bg-success-subtle rounded p-3">

                            <h3 class="text-success mb-0">2</h3>

                            <span class="text-success">
                                Consultations in Progress
                            </span>

                        </div>

                    </div>

                </div>


                <!-- Top Medicines -->
                <div class="card border-0 shadow-sm">

                    <div class="card-body p-0">

                        <div class="d-flex justify-content-between align-items-center p-3">
                            <h5 class="mb-0">Top Medicines</h5>

                            <a href="#" class="text-primary text-decoration-none small">
                                View All
                            </a>
                        </div>

                        <table class="table table-hover align-middle mb-0">

                            <thead class="table-light">
                                <tr>
                                    <th>Medicine</th>
                                    <th>Sales</th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr>
                                    <td>Paracetamol 650mg</td>
                                    <td>1,256</td>
                                </tr>

                                <tr>
                                    <td>Amoxicillin 500mg</td>
                                    <td>950</td>
                                </tr>

                                <tr>
                                    <td>Vitamin D3 60K</td>
                                    <td>875</td>
                                </tr>

                                <tr>
                                    <td>Azithromycin 500mg</td>
                                    <td>720</td>
                                </tr>

                                <tr>
                                    <td>Cetirizine 10mg</td>
                                    <td>610</td>
                                </tr>

                            </tbody>

                        </table>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

    // ================= ORDER OVERVIEW =================

    const orderCtx = document.getElementById('orderChart');

    new Chart(orderCtx, {

        type: 'line',

        data: {
            labels: [
                'May 26',
                'May 27',
                'May 28',
                'May 29',
                'May 30',
                'May 31',
                'Jun 01'
            ],

            datasets: [

                {
                    label: 'Orders',

                    data: [
                        50,
                        85,
                        92,
                        140,
                        105,
                        138,
                        160
                    ],

                    borderWidth: 2,
                    tension: 0.4,
                    fill: false
                },

                {
                    label: 'Revenue',

                    data: [
                        30,
                        55,
                        62,
                        70,
                        58,
                        78,
                        88
                    ],

                    borderWidth: 2,
                    tension: 0.4,
                    fill: false
                }

            ]
        },

        options: {

            responsive: true,

            maintainAspectRatio: false,

            plugins: {
                legend: {
                    position: 'top'
                }
            },

            scales: {
                y: {
                    beginAtZero: true
                }
            }

        }

    });


    // ================= ORDER STATUS =================

    const statusCtx = document.getElementById('statusChart');

    new Chart(statusCtx, {

        type: 'doughnut',

        data: {

            labels: [
                'Pending',
                'Confirmed',
                'Packed',
                'Out for Delivery',
                'Delivered'
            ],

            datasets: [{

                data: [
                    210,
                    320,
                    180,
                    310,
                    228
                ],

                borderWidth: 2
            }]

        },

        options: {

            responsive: true,

            maintainAspectRatio: false,

            cutout: '60%',

            plugins: {

                legend: {
                    position: 'right'
                }

            }

        }

    });

</script>
    </body>
</html>
