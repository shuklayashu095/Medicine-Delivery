package Medi.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginForm extends HttpServlet {

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

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        try {

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
                        "SELECT user_id, full_name, email, mobile "
                        + "FROM users "
                        + "WHERE (email = ? OR mobile = ?) "
                        + "AND password = ?";

                try (
                    PreparedStatement ps =
                            con.prepareStatement(sql)
                ) {

                    ps.setString(1, username);
                    ps.setString(2, username);
                    ps.setString(3, password);

                    try (
                        ResultSet rs =
                                ps.executeQuery()
                    ) {

                        if (rs.next()) {

                            HttpSession session =
                                    request.getSession();

                            // =================================
                            // SAVE USER IN SESSION
                            // =================================

                            session.setAttribute(
                                    "userId",
                                    rs.getInt("user_id")
                            );

                            session.setAttribute(
                                    "userName",
                                    rs.getString("full_name")
                            );

                            session.setAttribute(
                                    "userEmail",
                                    rs.getString("email")
                            );

                            session.setAttribute(
                                    "userMobile",
                                    rs.getString("mobile")
                            );

                            // =================================
                            // CHECK PENDING MEDICINE
                            // =================================

                            Object medicineId =
                                    session.getAttribute(
                                            "pendingMedicineId"
                                    );

                            if (medicineId != null) {

                                session.removeAttribute(
                                        "pendingMedicineId"
                                );

                                response.sendRedirect(
                                        request.getContextPath()
                                        + "/OrderNow?id="
                                        + medicineId
                                );

                            } else {

                                response.sendRedirect(
                                        request.getContextPath()
                                        + "/UserPage.jsp"
                                );
                            }

                        } else {

                            response.sendRedirect(
                                    request.getContextPath()
                                    + "/UserPage.jsp?login=failed"
                            );
                        }
                    }
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    500,
                    "Login failed"
            );
        }
    }
}