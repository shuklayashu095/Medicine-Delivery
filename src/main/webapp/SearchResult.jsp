package Medi.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SearchMedi extends HttpServlet {

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/MediX";

    private static final String DB_USER = "root";

    private static final String DB_PASSWORD =
            "Yashukla@123";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;

        String pageParam = request.getParameter("page");

        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        if (page < 1) {
            page = 1;
        }

        // Medicines per page
        int recordsPerPage = 20;

        int offset = (page - 1) * recordsPerPage;

        List<Medicine> medicines = new ArrayList<>();

        int totalRecords = 0;

        int totalPages = 0;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con =
                         DriverManager.getConnection(
                                 DB_URL,
                                 DB_USER,
                                 DB_PASSWORD
                         )) {

                // ==========================================
                // TOTAL MEDICINES
                // ==========================================

                String countSQL =
                        "SELECT COUNT(*) FROM medicine";

                try (PreparedStatement countPS =
                             con.prepareStatement(countSQL);
                     ResultSet rs = countPS.executeQuery()) {

                    if (rs.next()) {
                        totalRecords = rs.getInt(1);
                    }
                }

                totalPages =
                        (int) Math.ceil(
                                (double) totalRecords
                                        / recordsPerPage
                        );

                // ==========================================
                // CURRENT PAGE MEDICINES
                // ==========================================

                String sql =
                        "SELECT id, name, generic_name, " +
                        "brand_name, manufacturer, dosage_form, " +
                        "strength, description, image, price, " +
                        "prescription_required " +
                        "FROM medicine " +
                        "ORDER BY id DESC " +
                        "LIMIT ? OFFSET ?";

                try (PreparedStatement ps =
                             con.prepareStatement(sql)) {

                    ps.setInt(1, recordsPerPage);
                    ps.setInt(2, offset);

                    try (ResultSet rs =
                                 ps.executeQuery()) {

                        while (rs.next()) {

                            Medicine medicine =
                                    new Medicine();

                            medicine.setId(
                                    rs.getInt("id")
                            );

                            medicine.setName(
                                    rs.getString("name")
                            );

                            medicine.setGenericName(
                                    rs.getString("generic_name")
                            );

                            medicine.setBrandName(
                                    rs.getString("brand_name")
                            );

                            medicine.setManufacturer(
                                    rs.getString("manufacturer")
                            );

                            medicine.setDosageForm(
                                    rs.getString("dosage_form")
                            );

                            medicine.setStrength(
                                    rs.getString("strength")
                            );

                            medicine.setDescription(
                                    rs.getString("description")
                            );

                            medicine.setImage(
                                    rs.getString("image")
                            );

                            medicine.setPrice(
                                    rs.getDouble("price")
                            );

                            medicine.setPrescriptionRequired(
                                    rs.getBoolean(
                                            "prescription_required"
                                    )
                            );

                            medicines.add(medicine);
                        }
                    }
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    e.getMessage()
            );
        }

        // ==========================================
        // SEND DATA TO JSP
        // ==========================================

        request.setAttribute(
                "medicines",
                medicines
        );

        request.setAttribute(
                "currentPage",
                page
        );

        request.setAttribute(
                "totalPages",
                totalPages
        );

        request.setAttribute(
                "totalRecords",
                totalRecords
        );

        request.getRequestDispatcher(
                "Medicine.jsp"
        ).forward(
                request,
                response
        );
    }

    // ==================================================
    // MEDICINE MODEL
    // ==================================================

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

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getGenericName() {
            return genericName;
        }

        public void setGenericName(String genericName) {
            this.genericName = genericName;
        }

        public String getBrandName() {
            return brandName;
        }

        public void setBrandName(String brandName) {
            this.brandName = brandName;
        }

        public String getManufacturer() {
            return manufacturer;
        }

        public void setManufacturer(String manufacturer) {
            this.manufacturer = manufacturer;
        }

        public String getDosageForm() {
            return dosageForm;
        }

        public void setDosageForm(String dosageForm) {
            this.dosageForm = dosageForm;
        }

        public String getStrength() {
            return strength;
        }

        public void setStrength(String strength) {
            this.strength = strength;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public String getImage() {
            return image;
        }

        public void setImage(String image) {
            this.image = image;
        }

        public double getPrice() {
            return price;
        }

        public void setPrice(double price) {
            this.price = price;
        }

        public boolean isPrescriptionRequired() {
            return prescriptionRequired;
        }

        public void setPrescriptionRequired(
                boolean prescriptionRequired) {

            this.prescriptionRequired =
                    prescriptionRequired;
        }
    }
}