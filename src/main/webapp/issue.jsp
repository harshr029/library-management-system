<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Landing Page</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<body class="bg-[#172554] h-[100vh] w-[100vw] overflow-hidden select-none">
<%
	String forIssue = (String)session.getAttribute("forIssue");
	int copies = Integer.parseInt((String)session.getAttribute("copiesAva"));
	
	String userName = (String)session.getAttribute("USERNAME");
	
try {
	//Registering driver
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	//Creating connection / tunnel
	String url = "jdbc:mysql://127.0.0.1:3306/Library";
	String username = "root";
	String pass = "H@rsH@2002";       //type your database password
	
	Connection con = DriverManager.getConnection(url,username,pass);  //connection
	
	//creating query 
	
	//count decrease for book
	copies = copies - 1;
	String query = "update Books set CopiesAvailable = (?) where BookId = (?)";
	PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.setInt(1,copies);
	pstmt.setString(2,forIssue);
	
	pstmt.executeUpdate();
	
	
	String insertIntoRecord = "insert into Record(UserName,BookId,IssueDate,ReturnDate) values (?,?,STR_TO_DATE(?,'%d-%m-%Y'),STR_TO_DATE(?,'%d-%m-%Y'))";
	
	PreparedStatement pstmt3 = con.prepareStatement(insertIntoRecord);
	
	//Getting date for record
	
	String getIssueDate = "select date_format(sysdate(), '%d-%m-%Y') as date from DUAL";
	String getReturnDate = "select date_format(curdate() + 25, '%d-%m-%Y') as date from DUAL";
	Statement stmt1 = con.createStatement();
	Statement stmt2 = con.createStatement();
	ResultSet date1 = stmt1.executeQuery(getIssueDate);
	ResultSet date2 = stmt2.executeQuery(getReturnDate);
	date1.next();
	date2.next();
	
	String issueDate = date1.getString("date");
	String returnDate = date2.getString("date");
	
	pstmt3.setString(1,userName);
	pstmt3.setString(2,forIssue);
	pstmt3.setString(3,issueDate);
	pstmt3.setString(4,returnDate);
	
	pstmt3.executeUpdate();
	
	
	
	con.close();
}
	catch(Exception e){
		e.printStackTrace();
	}	
%>

<div class="w-[80%] mx-auto flex justify-center items-center">
<h1 class="font-bold text-5xl text-[#ccc]">Book Issued Successfully</h1>
</div>

</body>
</html>