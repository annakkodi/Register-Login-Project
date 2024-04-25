<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<% 
String user_id=request.getParameter("usr");
String pwd=request.getParameter("pwd");
Class.forName("com.Mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhast/test");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select");
if(rs.next())
{
	if(rs.getString(2).equals(pwd))
	{
		out.println("welcome---");
	}
	else
	{
		out.print("Invalid password try again achi");
	}
}
	

%>

</body>
</html>