package example.myapp;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet; // ✅ Don't forget this import!
import java.sql.*;

@WebServlet("/ContactServlet") 
public class ContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Simple validation
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            message == null || message.trim().isEmpty()) {

            request.setAttribute("message", "All fields are required! Please fill in all the fields.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        // Sanitize inputs (basic HTML escape)
        name = name.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
        email = email.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
        message = message.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

        try (Connection conn = DBUtil.connect()) {

            if (conn == null) {
                request.setAttribute("message", "Database connection failed! Please try again later.");
                request.getRequestDispatcher("contact.jsp").forward(request, response);
                return;
            }

            // Insert into database
            String sql = "INSERT INTO contact_form (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, message);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                request.setAttribute("message", "Thank you! Your message has been submitted successfully. We will get back to you soon.");
            } else {
                request.setAttribute("message", "Oops! Submission failed. Please try again later.");
            }

            request.getRequestDispatcher("contact.jsp").forward(request, response);

        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            e.printStackTrace();  // Replace with logger in production
        }
    }
}