<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
<%
String name = request.getParameter("name");
String password = request.getParameter("password");
String jdbcUrl = "jdbc:mysql://localhost:3306/login_register";
String dbUser = "root";
String dbPassword = "Vs_vishnu@";
Connection conn = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
    String sql = "INSERT INTO login_register(Name, Password) VALUES (?, ?)";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, name);
    ps.setString(2, password);
    int rowsInserted = ps.executeUpdate();
    if (rowsInserted > 0) {
        out.println("<h2>Register Successful</h2>");
    } else {
        out.println("<h2>Register Failed</h2>");
    }
} catch (Exception e) {
    out.println("Exception : " + e.getMessage());
} finally {
    try {
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException e) {
        out.println("Exception while closing connection: " + e.getMessage());
    }
}
%>
</body>
</html>