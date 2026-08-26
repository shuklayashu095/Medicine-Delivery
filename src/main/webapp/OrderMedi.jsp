<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Order Medicine</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-lg-8">

            <div class="card shadow">

                <div class="card-body p-4">

                    <h2 class="fw-bold mb-4">
                        Order Medicine
                    </h2>


                    <!-- MEDICINE -->

                    <div class="row mb-4">

                        <div class="col-md-4 text-center">

                            <%
                                String image =
                                    (String) request.getAttribute(
                                        "image"
                                    );

                                if (image != null &&
                                    !image.isBlank()) {
                            %>

                                <img
                                    src="<%= image %>"
                                    class="img-fluid"
                                    style="height:180px;
                                           object-fit:contain;">

                            <%
                                } else {
                            %>

                                <div
                                    class="bg-light
                                           d-flex
                                           justify-content-center
                                           align-items-center"
                                    style="height:180px;">

                                    No Image

                                </div>

                            <%
                                }
                            %>

                        </div>


                        <div class="col-md-8">

                            <h4>
                                ${medicineName}
                            </h4>

                            <p>
                                Manufacturer:
                                ${manufacturer}
                            </p>

                            <p>
                                Strength:
                                ${strength}
                            </p>

                            <h4 class="text-success">

                                ₹${price}

                            </h4>

                        </div>

                    </div>


                    <hr>


                    <!-- ORDER FORM -->

                    <form
                        action="${pageContext.request.contextPath}/PlaceOrder"
                        method="post">


                        <input
                            type="hidden"
                            name="medicineId"
                            value="${medicineId}">


                        <!-- QUANTITY -->

                        <div class="mb-3">

                            <label class="form-label fw-bold">

                                Quantity

                            </label>

                            <input
                                type="number"
                                name="quantity"
                                class="form-control"
                                value="1"
                                min="1"
                                max="20"
                                required>

                        </div>


                        <!-- NAME -->

                        <div class="mb-3">

                            <label class="form-label fw-bold">

                                Full Name

                            </label>

                            <input
                                type="text"
                                name="customerName"
                                class="form-control"
                                required>

                        </div>


                        <!-- MOBILE -->

                        <div class="mb-3">

                            <label class="form-label fw-bold">

                                Mobile Number

                            </label>

                            <input
                                type="tel"
                                name="mobile"
                                class="form-control"
                                pattern="[6-9][0-9]{9}"
                                maxlength="10"
                                required>

                        </div>


                        <!-- ADDRESS -->

                        <div class="mb-3">

                            <label class="form-label fw-bold">

                                Delivery Address

                            </label>

                            <textarea
                                name="address"
                                class="form-control"
                                rows="3"
                                required></textarea>

                        </div>


                        <!-- CITY -->

                        <div class="mb-3">

                            <label class="form-label fw-bold">

                                City

                            </label>

                            <input
                                type="text"
                                name="city"
                                class="form-control"
                                value="Kanpur"
                                readonly>

                        </div>


                        <!-- PINCODE -->

                        <div class="mb-4">

                            <label class="form-label fw-bold">

                                Pincode

                            </label>

                            <input
                                type="text"
                                name="pincode"
                                class="form-control"
                                pattern="[0-9]{6}"
                                maxlength="6"
                                required>

                            <div class="form-text">

                                Currently available only in
                                Kanpur service areas.

                            </div>

                        </div>


                        <!-- PAYMENT -->

                        <div class="mb-4">

                            <label class="form-label fw-bold">

                                Payment Method

                            </label>

                            <select
                                name="paymentMethod"
                                class="form-select"
                                required>

                                <option value="COD">

                                    Cash on Delivery

                                </option>

                            </select>

                        </div>


                        <button
                            type="submit"
                            class="btn btn-primary
                                   btn-lg w-100">

                            Continue to Order

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>