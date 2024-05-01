<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirect</title>
<link rel="icon" type="image/x-icon" href="icon.webp">
 <link rel="stylesheet" type="text/css" href="./css/login.css">
 <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
<%@ page errorPage="Error.jsp" %>
<%@ page import="java.sql.*" %>

<%
	String userName = request.getParameter("username");
	String password = request.getParameter("password");
	String role = request.getParameter("role");
	
	//JDBC code
	
	try{
		//registering driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//create connection / tunnel
		String url = "jdbc:mysql://localhost:3306/Library";
		String user = "root";
		String pass = "H@rsH@2002";        //type your database password
		
		Connection con = DriverManager.getConnection(url,user,pass);
		
		//create query according to role
		String query = new String();
		if("staff".equals(role)){
			query = "select UserName,Password from Staff where UserName = (?)";
		}
		else{
			query = "select UserName,Password from Readers where UserName = (?)";
		}
		
		PreparedStatement pstmt = con.prepareStatement(query);
		
		pstmt.setString(1,userName);
		
		ResultSet set = pstmt.executeQuery();
		
		if(!set.next()){
			session.setAttribute("flag","2");
			response.sendRedirect("Error.jsp");
		}

		String uname = set.getString("UserName");
		String passWord = set.getString("Password");
		
		if(!password.equals(passWord)){
			session.setAttribute("flag","2");
			response.sendRedirect("Error.jsp");
		}
		
		else{
			session.setAttribute("USERNAME",userName);
			session.setAttribute("PASSWORD",password);
			session.setAttribute("ROLE",role);
			con.close();
			response.sendRedirect("LoggedIn.jsp");
		}	
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
%>

</body>
</html>