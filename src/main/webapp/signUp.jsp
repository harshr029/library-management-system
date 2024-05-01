<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signed Up</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&family=Pacifico&display=swap" rel="stylesheet">
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="./css/signup1.css">
</head>

<body class="select-none">
<%@ page errorPage="Error.jsp" %>
<%@ page import="java.sql.*" %>

<%
//session.setAttribute("UserName", uname);
//session.setAttribute("Password", pass);
//session.setAttribute("Role",role);
//session.setAttribute("Status", null);

	String userName = request.getParameter("uname");
	String firstName = request.getParameter("fname");
	String lastName = request.getParameter("lname");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String houseNo = request.getParameter("hnumber");
	String street = request.getParameter("street");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String phoneNo = (String)request.getParameter("phone");
	String role = request.getParameter("role");
	
	//jdbc code
	try {
			//Registering driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Creating connection / tunnel
			String url = "jdbc:mysql://127.0.0.1:3306/Library";
			String username = "root";
			String pass = "H@rsH@2002";        //type your database password
			
			Connection con = DriverManager.getConnection(url,username,pass);  //connection
			
			//creating query according to role
			String insertDataInUser = new String();
			String insertDataInPhone = new String();
			if("reader".equals(role)){
				String check1 = "select UserName from Staff where UserName = (?)";
				PreparedStatement ch = con.prepareStatement(check1);
				ch.setString(1,userName);
				ResultSet set = ch.executeQuery();
				if(set.next()){
					session.setAttribute("flag","1");
					response.sendRedirect("Error.jsp");
				}
				
				else{
				insertDataInUser = "insert into Readers values(?,?,?,?,?,?,?,?,?)";
				insertDataInPhone = "insert into PhoneNo values(?,?)";
				}
			}
			else{
				String check1 = "select UserName from Readers where UserName = (?)";
				PreparedStatement ch = con.prepareStatement(check1);
				ch.setString(1,userName);
				ResultSet set = ch.executeQuery();
				if(set.next()){
					session.setAttribute("flag","1");
					response.sendRedirect("Error.jsp");
				}
				else{
				insertDataInUser = "insert into Staff values(?,?,?,?,?,?,?,?,?)";
				insertDataInPhone = "insert into Staff_PhoneNo values(?,?)";
				}
			}
			
			//String q = "insert into user values(?,?,?,?)";
			PreparedStatement pstmt1 = con.prepareStatement(insertDataInUser);
			PreparedStatement pstmt2 = con.prepareStatement(insertDataInPhone);
			 
			pstmt1.setString(1,userName);
			pstmt1.setString(2,firstName);
			pstmt1.setString(3,lastName);
			pstmt1.setString(4,email);
			pstmt1.setString(5,password);
			pstmt1.setString(6,houseNo);
			pstmt1.setString(7,street);
			pstmt1.setString(8,city);
			pstmt1.setString(9,state);
		
			pstmt2.setString(1,userName);
			pstmt2.setString(2,phoneNo);
			
			
			//firing queries
			pstmt1.executeUpdate();
			pstmt2.executeUpdate();
			
			
			//Statement stmt = con.createStatement();
			
			//fire query
			//stmt.executeUpdate(q);
			
			//closing the connection
			con.close();
		}
		catch(SQLIntegrityConstraintViolationException err){
			session.setAttribute("flag", "1");
			response.sendRedirect("Error.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
%>

<div class="outer-box flex justify-center items-center">

<div class="w-[50%] h-[75%] text-white flex flex-col items-center justify-center gap-y-[5px]">
		<h1 class="text-5xl">Sign Up Successful</h1>
		<br>
		<h1 class="text-4xl">Please log in from here</h1>
		<a href="login.html" class="mt-[10px] bg-white text-black text-3xl text-bold p-[10px] rounded-lg">Log in</a>
	</div>
        
        <div class="circle c1"></div>
        <div class="circle c2"></div>
    </div>
</body>
</html>