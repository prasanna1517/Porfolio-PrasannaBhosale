<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Contact Us</title>
  <link rel="stylesheet" href="style.css"> 
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
  
  .alert {
  background-color: #f0fdf4;
  border-left: 4px solid #34d399;
  padding: 10px 15px;
  margin: 15px 0;
  color: #065f46;
  font-weight: bold;
  border-radius: 5px;
}
  </style>
</head>
<body>
  <nav>
    <a href="index.html">Home</a>
    <a href="work.html">Work</a>
    <a href="skills.html">Skills</a>
    <a href="contact.jsp">Contact</a>
  </nav>

  <div class="container contact-container">
    <h2>Contact Us</h2>

    <!-- ✅ Display success or error message -->
    <% String msg = (String) request.getAttribute("message");
       if (msg != null) { %>
      <div class="alert">
        <%= msg %>
      </div>
    <% } %>

    <form action="ContactServlet" method="post">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" placeholder="Your Name" required>

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" placeholder="Your Email" required>

      <label for="message">Message:</label>
      <textarea id="message" name="message" rows="4" placeholder="Write your message..." required></textarea>

      <button type="submit" class="btn">Send</button>
    </form>
  </div>

  <footer class="footer">
    <div class="footer-content">
      <p>Connect with me</p>
      <div class="social-icons">
        <a href="https://github.com/prasanna1517" target="_blank" class="icon github">
          <i class="bi bi-github"></i>
        </a>
        <a href="https://www.linkedin.com/in/prasanna-bhosale-065178242" target="_blank" class="icon linkedin">
          <i class="bi bi-linkedin"></i>
        </a>
        <a href="https://twitter.com/yourusername" target="_blank" class="icon twitter">
          <i class="bi bi-twitter"></i>
        </a>
        <a href="mailto:your@email.com" class="icon email">
          <i class="bi bi-envelope-fill"></i>
        </a>
      </div>
      <p class="copyright">© 2025 Prasanna Bhosale. All rights reserved.</p>
    </div>
  </footer>

</body>
</html>
