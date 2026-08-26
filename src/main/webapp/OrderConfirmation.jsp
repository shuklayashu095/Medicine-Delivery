<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Order Confirmed</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-md-7">

            <div class="card shadow text-center">

                <div class="card-body p-5">

                    <div class="display-4 text-success mb-3">

                        ✓

                    </div>

                    <h2 class="fw-bold">

                        Order Placed Successfully!

                    </h2>

                    <p class="text-muted">

                        Thank you for ordering from us.

                    </p>


                    <hr>


                    <div class="text-start">

                        <p>
                            <strong>Order ID:</strong>
                            #${orderId}
                        </p>

                        <p>
                            <strong>Medicine:</strong>
                            ${medicineName}
                        </p>

                        <p>
                            <strong>Quantity:</strong>
                            ${quantity}
                        </p>

                        <p>
                            <strong>Price:</strong>
                            ₹${price}
                        </p>

                        <p>
                            <strong>Total:</strong>
                            ₹${totalAmount}
                        </p>

                        <p>
                            <strong>Payment:</strong>
                            Cash on Delivery
                        </p>

                        <p>
                            <strong>Status:</strong>

                            <span class="badge bg-warning text-dark">
                                Order Placed
                            </span>

                        </p>

                    </div>


                    <a
                        href="${pageContext.request.contextPath}/SearchMedi"
                        class="btn btn-primary mt-3">

                        Continue Shopping

                    </a>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>