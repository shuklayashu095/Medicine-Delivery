package Medi.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class PlaceOrder extends HttpServlet {

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/medix";

    private static final String DB_USER =
            "root";

    private static final String DB_PASSWORD =
            "Yashukla@123";


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");


        try {

            int medicineId =
                    Integer.parseInt(
                            request.getParameter("medicineId")
                    );


            int quantity =
                    Integer.parseInt(
                            request.getParameter("quantity")
                    );


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


            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );


            try (
                Connection con =
                    DriverManager.getConnection(
                            DB_URL,
                            DB_USER,
                            DB_PASSWORD
                    )
            ) {


                // =========================================
                // GET MEDICINE DETAILS
                // =========================================

                String medicineSQL =
                        "SELECT name, price " +
                        "FROM medicine " +
                        "WHERE id = ?";


                String medicineName;

                BigDecimal price;


                try (
                    PreparedStatement ps =
                        con.prepareStatement(medicineSQL)
                ) {

                    ps.setInt(1, medicineId);


                    try (
                        ResultSet rs =
                            ps.executeQuery()
                    ) {

                        if (!rs.next()) {

                            response.sendError(
                                    404,
                                    "Medicine not found"
                            );

                            return;
                        }


                        medicineName =
                                rs.getString("name");

                        price =
                                rs.getBigDecimal("price");
                    }
                }


                // =========================================
                // CALCULATE TOTAL
                // =========================================

                BigDecimal totalAmount =
                        price.multiply(
                                BigDecimal.valueOf(quantity)
                        );


                // =========================================
                // INSERT ORDER
                // =========================================

                String insertSQL =
                        "INSERT INTO orders " +
                        "(medicine_id, medicine_name, quantity, " +
                        "price, total_amount, customer_name, " +
                        "mobile, address, city, pincode, " +
                        "payment_method, payment_status, order_status) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


                int orderId;


                try (
                    PreparedStatement ps =
                        con.prepareStatement(
                                insertSQL,
                                Statement.RETURN_GENERATED_KEYS
                        )
                ) {


                    ps.setInt(1, medicineId);

                    ps.setString(2, medicineName);

                    ps.setInt(3, quantity);

                    ps.setBigDecimal(4, price);

                    ps.setBigDecimal(5, totalAmount);

                    ps.setString(6, customerName);

                    ps.setString(7, mobile);

                    ps.setString(8, address);

                    ps.setString(9, city);

                    ps.setString(10, pincode);

                    ps.setString(11, paymentMethod);

                    // Existing table default
                    ps.setString(12, "PENDING");

                    // Existing table default
                    ps.setString(13, "PLACED");


                    ps.executeUpdate();


                    // =====================================
                    // GET GENERATED ORDER ID
                    // =====================================

                    try (
                        ResultSet keys =
                            ps.getGeneratedKeys()
                    ) {

                        if (keys.next()) {

                            orderId =
                                    keys.getInt(1);

                        } else {

                            throw new Exception(
                                    "Order ID not generated"
                            );
                        }
                    }
                }


                // =========================================
                // SEND DATA TO CONFIRMATION PAGE
                // =========================================

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

                request.setAttribute(
                        "customerName",
                        customerName
                );

                request.setAttribute(
                        "mobile",
                        mobile
                );

                request.setAttribute(
                        "address",
                        address
                );

                request.setAttribute(
                        "city",
                        city
                );

                request.setAttribute(
                        "pincode",
                        pincode
                );

                request.setAttribute(
                        "paymentMethod",
                        paymentMethod
                );


                // =========================================
                // OPEN CONFIRMATION PAGE
                // =========================================

                request.getRequestDispatcher(
                        "/OrderConfirmation.jsp"
                ).forward(
                        request,
                        response
                );
            }


        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to place order"
            );
        }
    }
}