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

public class OrderNow extends HttpServlet {

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/MediX";

    private static final String DB_USER = "root";

    private static final String DB_PASSWORD =
            "Yashukla@123";

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String idParam =
                request.getParameter("id");

        if (idParam == null || idParam.isBlank()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Medicine ID is missing."
            );

            return;
        }

        int medicineId;

        try {

            medicineId =
                    Integer.parseInt(idParam);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid medicine ID."
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

                String sql =
                        "SELECT id, name, price, image, " +
                        "manufacturer, strength " +
                        "FROM medicine " +
                        "WHERE id = ?";

                try (PreparedStatement ps =
                             con.prepareStatement(sql)) {

                    ps.setInt(1, medicineId);

                    try (ResultSet rs =
                                 ps.executeQuery()) {

                        if (rs.next()) {

                            request.setAttribute(
                                    "medicineId",
                                    rs.getInt("id")
                            );

                            request.setAttribute(
                                    "medicineName",
                                    rs.getString("name")
                            );

                            request.setAttribute(
                                    "price",
                                    rs.getDouble("price")
                            );

                            request.setAttribute(
                                    "image",
                                    rs.getString("image")
                            );

                            request.setAttribute(
                                    "manufacturer",
                                    rs.getString(
                                            "manufacturer"
                                    )
                            );

                            request.setAttribute(
                                    "strength",
                                    rs.getString(
                                            "strength"
                                    )
                            );

                            request.getRequestDispatcher(
                                    "OrderMedicine.jsp"
                            ).forward(
                                    request,
                                    response
                            );

                        } else {

                            response.sendError(
                                    HttpServletResponse.SC_NOT_FOUND,
                                    "Medicine not found."
                            );
                        }
                    }
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Database error."
            );
        }
    }
}