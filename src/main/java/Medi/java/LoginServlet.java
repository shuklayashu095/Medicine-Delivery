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

public class LoginServlet extends HttpServlet {

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

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        if (username == null || password == null ||
            username.trim().isEmpty() ||
            password.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath() + "/UserPage.jsp?error=empty"
            );

            return;
        }

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

                /*
                 * Login email OR mobile se hoga
                 */
                String sql =
                        "SELECT user_id, name, email, mobile " +
                        "FROM users " +
                        "WHERE (email = ? OR mobile = ?) " +
                        "AND password = ?";

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

                            /*
                             * LOGIN SUCCESS
                             */

                            int userId =
                                    rs.getInt("user_id");

                            String name =
                                    rs.getString("name");

                            String email =
                                    rs.getString("email");

                            String mobile =
                                    rs.getString("mobile");


                            /*
                             * SESSION CREATE
                             */

                            HttpSession session =
                                    request.getSession();

                            session.setAttribute(
                                    "userId",
                                    userId
                            );

                            session.setAttribute(
                                    "userName",
                                    name
                            );

                            session.setAttribute(
                                    "userEmail",
                                    email
                            );

                            session.setAttribute(
                                    "userMobile",
                                    mobile
                            );


                            /*
                             * HOME PAGE
                             */

                            response.sendRedirect(
                                    request.getContextPath()
                                    + "/UserPage.jsp"
                            );

                        } else {

                            /*
                             * LOGIN FAILED
                             */

                            response.sendRedirect(
                                    request.getContextPath()
                                    + "/UserPage.jsp?error=invalid"
                            );
                        }
                    }
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Login failed"
            );
        }
    }
}