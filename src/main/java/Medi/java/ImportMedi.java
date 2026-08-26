package Medi.java;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class ImportMedi extends HttpServlet {

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/MediX";

    private static final String DB_USER = "root";

    private static final String DB_PASSWORD =
            "Yashukla@123";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int inserted = 0;

        try {

            // =========================================
            // 1. API URL
            // =========================================

            String apiUrl =
                    "https://api.fda.gov/drug/label.json?limit=1000";

            URL url = new URL(apiUrl);

            HttpURLConnection connection =
                    (HttpURLConnection) url.openConnection();

            connection.setRequestMethod("GET");

            connection.setConnectTimeout(10000);
            connection.setReadTimeout(10000);

            // =========================================
            // 2. API response read
            // =========================================

            BufferedReader reader =
                    new BufferedReader(
                            new InputStreamReader(
                                    connection.getInputStream()
                            )
                    );

            StringBuilder jsonResponse =
                    new StringBuilder();

            String line;

            while ((line = reader.readLine()) != null) {
                jsonResponse.append(line);
            }

            reader.close();

            connection.disconnect();

            // =========================================
            // 3. JSON parse
            // =========================================

            ObjectMapper mapper = new ObjectMapper();

            JsonNode root =
                    mapper.readTree(jsonResponse.toString());

            JsonNode results =
                    root.get("results");

            if (results == null || !results.isArray()) {

                response.getWriter().println(
                        "<h3>No medicine data found.</h3>"
                );

                return;
            }

            // =========================================
            // 4. MySQL connection
            // =========================================

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con =
                    DriverManager.getConnection(
                            DB_URL,
                            DB_USER,
                            DB_PASSWORD
                    );

            // =========================================
            // 5. INSERT query
            // =========================================

            String sql =
                    "INSERT INTO medicine " +
                    "(name, generic_name, brand_name, " +
                    "manufacturer, dosage_form, strength, " +
                    "description, image, price, " +
                    "prescription_required) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            // =========================================
            // 6. Process each medicine
            // =========================================

            for (JsonNode medicine : results) {

                String name = getFirstValue(
                        medicine, "openfda", "brand_name");

                String genericName = getFirstValue(
                        medicine, "openfda", "generic_name");

                String brandName = getFirstValue(
                        medicine, "openfda", "brand_name");

                String manufacturer = getFirstValue(
                        medicine, "openfda", "manufacturer_name");

                String dosageForm = getFirstValue(
                        medicine, "openfda", "dosage_form");

                String strength = getFirstValue(
                        medicine, "openfda", "strength");

                String description = getFirstValue(
                        medicine, "description");

                // Agar brand name nahi mila
                // to generic name use karenge

                if (name == null || name.isEmpty()) {

                    name = genericName;
                }

                // Agar name hi nahi mila
                // to record skip

                if (name == null || name.isEmpty()) {
                    continue;
                }

                // =====================================
                // Set database values
                // =====================================

                ps.setString(1, name);

                ps.setString(2, genericName);

                ps.setString(3, brandName);

                ps.setString(4, manufacturer);

                ps.setString(5, dosageForm);

                ps.setString(6, strength);

                ps.setString(7, description);

                // API se image/price nahi le rahe
                ps.setString(8, null);

                ps.setDouble(9, 0.0);

                ps.setBoolean(10, false);

                ps.executeUpdate();

                inserted++;
            }

            ps.close();
            con.close();

            // =========================================
            // 7. Result
            // =========================================

            response.getWriter().println(
                    "<h2>Medicine Import Successful!</h2>"
            );

            response.getWriter().println(
                    "<h4>" + inserted +
                    " medicines saved in MySQL.</h4>"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h3>Error occurred:</h3>"
            );

            response.getWriter().println(
                    e.getMessage()
            );
        }
    }

    // =================================================
    // Helper method
    // =================================================

    private String getFirstValue(
            JsonNode node,
            String parent,
            String field) {

        JsonNode parentNode =
                node.get(parent);

        if (parentNode != null) {

            JsonNode fieldNode =
                    parentNode.get(field);

            if (fieldNode != null &&
                fieldNode.isArray() &&
                fieldNode.size() > 0) {

                return fieldNode.get(0).asText();
            }
        }

        return null;
    }

    private String getFirstValue(
            JsonNode node,
            String field) {

        JsonNode fieldNode =
                node.get(field);

        if (fieldNode != null &&
            fieldNode.isArray() &&
            fieldNode.size() > 0) {

            return fieldNode.get(0).asText();
        }

        return null;
    }
}