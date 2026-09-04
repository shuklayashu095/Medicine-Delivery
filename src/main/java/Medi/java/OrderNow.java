package Medi.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderNow extends HttpServlet {

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/medix";

    private static final String DB_USER =
            "root";

    private static final String DB_PASSWORD =
            "Yashukla@123";

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int medicineId = Integer.parseInt(
                    request.getParameter("id")
            );

            // =========================================
            // CHECK LOGIN
            // =========================================

            HttpSession session =
                    request.getSession(false);

            if (session == null ||
                session.getAttribute("userId") == null) {

                /*
                 * User login nahi hai.
                 *
                 * Medicine ID ko preserve karke
                 * UserPage.jsp par bhej rahe hain.
                 */

                response.sendRedirect(
                        request.getContextPath()
                        + "/UserPage.jsp?loginRequired=true"
                        + "&medicineId=" + medicineId
                );

                return;
            }


            // =========================================
            // DATABASE
            // =========================================

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

                String sql =
                        "SELECT id, name, manufacturer, " +
                        "strength, image, price " +
                        "FROM medicine " +
                        "WHERE id = ?";

                try (
                    PreparedStatement ps =
                        con.prepareStatement(sql)
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


                        // =================================
                        // SEND MEDICINE DATA
                        // =================================

                        request.setAttribute(
                                "medicineId",
                                rs.getInt("id")
                        );

                        request.setAttribute(
                                "medicineName",
                                rs.getString("name")
                        );

                        request.setAttribute(
                                "manufacturer",
                                rs.getString("manufacturer")
                        );

                        request.setAttribute(
                                "strength",
                                rs.getString("strength")
                        );

                        request.setAttribute(
                                "image",
                                rs.getString("image")
                        );

                        request.setAttribute(
                                "price",
                                rs.getBigDecimal("price")
                        );


                        // =================================
                        // OPEN ORDER PAGE
                        // =================================

                        request.getRequestDispatcher(
                                "/OrderMedicine.jsp"
                        ).forward(
                                request,
                                response
                        );
                    }
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to open order page"
            );
        }
    }
}