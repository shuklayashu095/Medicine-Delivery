<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <title>Add Medicine</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
          rel="stylesheet">

</head>

<body class="bg-light">


<div class="container py-5">

    <div class="row justify-content-center">

        <div class="col-lg-7">

            <div class="card border-0 shadow">

                <div class="card-header bg-primary text-white">

                    <h4 class="mb-0">

                        <i class="bi bi-capsule me-2"></i>

                        Add New Medicine

                    </h4>

                </div>


                <div class="card-body p-4">

                    <form action="addMedicine"
                          method="post"
                          enctype="multipart/form-data">


                        <!-- Medicine Name -->

                        <div class="mb-3">

                            <label class="form-label fw-semibold">

                                Medicine Name

                            </label>

                            <input type="text"
                                   name="name"
                                   class="form-control"
                                   placeholder="Enter medicine name"
                                   required>

                        </div>


                        <!-- Category -->

                        <div class="mb-3">

                            <label class="form-label fw-semibold">

                                Category

                            </label>

                            <select name="category"
                                    class="form-select"
                                    required>

                                <option value="">
                                    Select Category
                                </option>

                                <option value="Pain Relief">
                                    Pain Relief
                                </option>

                                <option value="Fever">
                                    Fever
                                </option>

                                <option value="Cold & Cough">
                                    Cold & Cough
                                </option>

                                <option value="Vitamins">
                                    Vitamins
                                </option>

                                <option value="Diabetes">
                                    Diabetes
                                </option>

                                <option value="Other">
                                    Other
                                </option>

                            </select>

                        </div>


                        <!-- Price -->

                        <div class="mb-3">

                            <label class="form-label fw-semibold">

                                Price

                            </label>

                            <div class="input-group">

                                <span class="input-group-text">
                                    ₹
                                </span>

                                <input type="number"
                                       name="price"
                                       class="form-control"
                                       placeholder="Enter price"
                                       step="0.01"
                                       required>

                            </div>

                        </div>


                        <!-- Description -->

                        <div class="mb-3">

                            <label class="form-label fw-semibold">

                                Description

                            </label>

                            <textarea name="description"
                                      class="form-control"
                                      rows="3"
                                      placeholder="Enter medicine description"
                                      required></textarea>

                        </div>


                        <!-- Image -->

                        <div class="mb-4">

                            <label class="form-label fw-semibold">

                                Medicine Image

                            </label>

                            <input type="file"
                                   name="image"
                                   class="form-control"
                                   accept="image/*"
                                   required>

                            <div class="form-text">

                                JPG, JPEG, PNG images only.

                            </div>

                        </div>


                        <!-- Submit -->

                        <div class="d-grid">

                            <button type="submit"
                                    class="btn btn-primary btn-lg">

                                <i class="bi bi-plus-circle me-2"></i>

                                Add Medicine

                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>


</body>

</html>