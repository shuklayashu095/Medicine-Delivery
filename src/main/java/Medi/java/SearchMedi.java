package Medi.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class SearchMedi extends HttpServlet {

    private static final String URL =
        "jdbc:mysql://localhost:3306/medix?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Kolkata";
    
    private static final String USER = "root";

    private static final String PASSWORD = "Yashukla@123";


    // =====================================================
    // MEDICINE CLASS
    // =====================================================

    public static class Medicine {

        private int id;
        private String name;
        private String genericName;
        private String brandName;
        private String manufacturer;
        private String dosageForm;
        private String strength;
        private String description;
        private String image;
        private double price;
        private boolean prescriptionRequired;


        public Medicine(
                int id,
                String name,
                String genericName,
                String brandName,
                String manufacturer,
                String dosageForm,
                String strength,
                String description,
                String image,
                double price,
                boolean prescriptionRequired) {

            this.id = id;
            this.name = name;
            this.genericName = genericName;
            this.brandName = brandName;
            this.manufacturer = manufacturer;
            this.dosageForm = dosageForm;
            this.strength = strength;
            this.description = description;
            this.image = image;
            this.price = price;
            this.prescriptionRequired = prescriptionRequired;
        }


        public int getId() {
            return id;
        }

        public String getName() {
            return name;
        }

        public String getGenericName() {
            return genericName;
        }

        public String getBrandName() {
            return brandName;
        }

        public String getManufacturer() {
            return manufacturer;
        }

        public String getDosageForm() {
            return dosageForm;
        }

        public String getStrength() {
            return strength;
        }

        public String getDescription() {
            return description;
        }

        public String getImage() {
            return image;
        }

        public double getPrice() {
            return price;
        }

        public boolean isPrescriptionRequired() {
            return prescriptionRequired;
        }
    }


    // =====================================================
    // GET
    // =====================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");


        List<Medicine> searchResults =
                new ArrayList<>();

        List<Medicine> relatedMedicines =
                new ArrayList<>();


        try {

            // ==========================================
            // MYSQL DRIVER
            // ==========================================

            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );


            // ==========================================
            // DATABASE CONNECTION
            // ==========================================

            try (Connection con =
                         DriverManager.getConnection(
                                 URL,
                                 USER,
                                 PASSWORD)) {


                // ==========================================
                // SEARCH
                // ==========================================

                if (name != null &&
                        !name.trim().isEmpty()) {


                    String sql =
                            "SELECT id, name, generic_name, brand_name, " +
                            "manufacturer, dosage_form, strength, " +
                            "description, image, price, prescription_required " +
                            "FROM medicine " +
                            "WHERE name LIKE ? " +
                            "OR generic_name LIKE ? " +
                            "OR brand_name LIKE ? " +
                            "ORDER BY name";


                    try (PreparedStatement ps =
                                 con.prepareStatement(sql)) {


                        String search =
                                "%" + name.trim() + "%";


                        ps.setString(1, search);
                        ps.setString(2, search);
                        ps.setString(3, search);


                        try (ResultSet rs =
                                     ps.executeQuery()) {


                            while (rs.next()) {

                                searchResults.add(
                                        createMedicine(rs)
                                );
                            }
                        }
                    }
                }


                // ==========================================
                // RANDOM MEDICINES
                // ==========================================

                String relatedSql =
                        "SELECT id, name, generic_name, brand_name, " +
                        "manufacturer, dosage_form, strength, " +
                        "description, image, price, prescription_required " +
                        "FROM medicine " +
                        "ORDER BY RAND() " +
                        "LIMIT 8";


                try (PreparedStatement ps =
                             con.prepareStatement(relatedSql);

                     ResultSet rs =
                             ps.executeQuery()) {


                    while (rs.next()) {

                        relatedMedicines.add(
                                createMedicine(rs)
                        );
                    }
                }
            }


            // ==========================================
            // SEND DATA TO JSP
            // ==========================================

            request.setAttribute(
                    "searchResults",
                    searchResults
            );


            request.setAttribute(
                    "relatedMedicines",
                    relatedMedicines
            );


            request.setAttribute(
                    "searchName",
                    name
            );


            // ==========================================
            // OPEN SEARCH RESULT PAGE
            // ==========================================

            request.getRequestDispatcher(
                    "/SearchResult.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Database error while searching medicine",
                    e
            );
        }
    }


    // =====================================================
    // CREATE MEDICINE OBJECT
    // =====================================================

    private Medicine createMedicine(
            ResultSet rs)
            throws SQLException {


        return new Medicine(

                rs.getInt("id"),

                rs.getString("name"),

                rs.getString("generic_name"),

                rs.getString("brand_name"),

                rs.getString("manufacturer"),

                rs.getString("dosage_form"),

                rs.getString("strength"),

                rs.getString("description"),

                rs.getString("image"),

                rs.getDouble("price"),

                rs.getBoolean("prescription_required")
        );
    }
}