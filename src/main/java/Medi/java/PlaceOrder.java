package Medi.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PlaceOrder extends HttpServlet {

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/MediX";

    private static final String DB_USER = "root";

    private static final String DB_PASSWORD =
            "Yashukla@123";

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String medicineIdParam =
                request.getParameter("medicineId");

        String quantityParam =
                request.getParameter("quantity");

        String customerName =
                request.getParameter("customerName");

        String mobile =
                request.getParameter("mobile");

        String address =
                request.getParameter("address");

        String city =
                request.getParameter("city");

        String pincode =
                request.getParameter("pincode");

        String paymentMethod =
                request.getParameter("paymentMethod");


        // ==========================================
        // VALIDATION
        // ==========================================

        if (medicineIdParam == null ||
            quantityParam == null ||
            customerName == null ||
            mobile == null ||
            address == null ||
            city == null ||
            pincode == null) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Required information is missing."
            );

            return;
        }


        int medicineId;

        int quantity;

        try {

            medicineId =
                    Integer.parseInt(
                            medicineIdParam
                    );

            quantity =
                    Integer.parseInt(
                            quantityParam
                    );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid quantity or medicine."
            );

            return;
        }


        if (quantity < 1 || quantity > 20) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid quantity."
            );

            return;
        }


        // ==========================================
        // KANPUR CHECK
        // ==========================================

        if (!"Kanpur".equalsIgnoreCase(city)) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Currently we deliver only in Kanpur."
            );

            return;
        }


        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );

            try (Connection con =
                         DriverManager.getConnection(
                                 DB_URL,
                                 DB_USER,
                                 DB_PASSWORD
                         )) {


                // ==================================
                // CHECK PINCODE
                // ==================================

                String serviceSQL =
                        "SELECT id FROM serviceable_pincode " +
                        "WHERE pincode = ? " +
                        "AND city = 'Kanpur' " +
                        "AND active = TRUE";

                try (PreparedStatement servicePS =
                             con.prepareStatement(
                                     serviceSQL
                             )) {

                    servicePS.setString(
                            1,
                            pincode
                    );

                    try (ResultSet rs =
                                 servicePS.executeQuery()) {

                        if (!rs.next()) {

                            response.setContentType(
                                    "text/html;charset=UTF-8"
                            );

                            response.getWriter().println(
                                    "<h2>Delivery unavailable</h2>"
                            );

                            response.getWriter().println(
                                    "<p>Sorry, we currently "
                                    + "do not deliver to this "
                                    + "pincode.</p>"
                            );

                            return;
                        }
                    }
                }


                // ==================================
                // GET MEDICINE
                // ==================================

                String medicineSQL =
                        "SELECT name, price " +
                        "FROM medicine " +
                        "WHERE id = ?";

                String medicineName;

                double price;

                try (PreparedStatement medicinePS =
                             con.prepareStatement(
                                     medicineSQL
                             )) {

                    medicinePS.setInt(
                            1,
                            medicineId
                    );

                    try (ResultSet rs =
                                 medicinePS.executeQuery()) {

                        if (!rs.next()) {

                            response.sendError(
                                    HttpServletResponse
                                        .SC_NOT_FOUND,
                                    "Medicine not found."
                            );

                            return;
                        }

                        medicineName =
                                rs.getString("name");

                        price =
                                rs.getDouble("price");
                    }
                }


                // ==================================
                // TOTAL
                // ==================================

                double totalAmount =
                        price * quantity;


                // ==================================
                // INSERT ORDER
                // ==================================

                String orderSQL =
                        "INSERT INTO orders " +
                        "(medicine_id, medicine_name, " +
                        "quantity, price, total_amount, " +
                        "customer_name, mobile, address, " +
                        "city, pincode, payment_method, " +
                        "payment_status, order_status) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                int orderId;

                try (PreparedStatement orderPS =
                             con.prepareStatement(
                                     orderSQL,
                                     java.sql.Statement
                                         .RETURN_GENERATED_KEYS
                             )) {

                    orderPS.setInt(
                            1,
                            medicineId
                    );

                    orderPS.setString(
                            2,
                            medicineName
                    );

                    orderPS.setInt(
                            3,
                            quantity
                    );

                    orderPS.setDouble(
                            4,
                            price
                    );

                    orderPS.setDouble(
                            5,
                            totalAmount
                    );

                    orderPS.setString(
                            6,
                            customerName
                    );

                    orderPS.setString(
                            7,
                            mobile
                    );

                    orderPS.setString(
                            8,
                            address
                    );

                    orderPS.setString(
                            9,
                            city
                    );

                    orderPS.setString(
                            10,
                            pincode
                    );

                    orderPS.setString(
                            11,
                            paymentMethod
                    );

                    orderPS.setString(
                            12,
                            "PENDING"
                    );

                    orderPS.setString(
                            13,
                            "PLACED"
                    );

                    orderPS.executeUpdate();


                    try (ResultSet keys =
                                 orderPS.getGeneratedKeys()) {

                        if (keys.next()) {

                            orderId =
                                    keys.getInt(1);

                        } else {

                            throw new Exception(
                                    "Order ID not generated."
                            );
                        }
                    }
                }


                // ==================================
                // SEND TO CONFIRMATION PAGE
                // ==================================

                request.setAttribute(
                        "orderId",
                        orderId
                );

                request.setAttribute(
                        "medicineName",
                        medicineName
                );

                request.setAttribute(
                        "quantity",
                        quantity
                );

                request.setAttribute(
                        "price",
                        price
                );

                request.setAttribute(
                        "totalAmount",
                        totalAmount
                );

                request.getRequestDispatcher(
                        "OrderConfirmation.jsp"
                ).forward(
                        request,
                        response
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse
                        .SC_INTERNAL_SERVER_ERROR,
                    "Unable to place order."
            );
        }
    }
}