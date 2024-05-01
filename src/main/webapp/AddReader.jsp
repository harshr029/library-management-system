<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader register page</title>
</head>
<%@ page errorPage="Error.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<body>
<%
	//data got from form
	String firstName = request.getParameter("fname");
	String lastName = request.getParameter("lname");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String bookId = request.getParameter("bookId");
	// String bookTitle = request.getParameter("title");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String readerId = request.getParameter("redId");
	
	try {
		//Registering driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//Creating connection / tunnel
		String url = "jdbc:mysql://127.0.0.1:3306/Library";
		String username = "root";
		String pass = "H@rsH@2002";   //type your database password
		
		Connection con = DriverManager.getConnection(url,username,pass);  //connection
		
		//creating query 
		
		//Check book info given is right or not or if right then check available or not
		String check1 = "select CopiesAvailable from Books where BookId = (?)";
		PreparedStatement pstmt4 = con.prepareStatement(check1);
		pstmt4.setString(1,bookId);
		
		ResultSet copies = pstmt4.executeQuery();
		
		if(!copies.next() || copies.getInt("CopiesAvailable") == 0) {
			session.setAttribute("flag","5");
			response.sendRedirect("Error.jsp");
		}
		
	
		//checking reader is new or old
		String test = "select UserName from Readers where UserName = (?)";
		PreparedStatement checking = con.prepareStatement(test);
		checking.setString(1,readerId);
		ResultSet check = checking.executeQuery();
		
		if(!check.next()){
			String insertIntoReaders = "insert into Readers values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt1 = con.prepareStatement(insertIntoReaders);
			pstmt1.setString(1,readerId);
			pstmt1.setString(2,firstName);
			pstmt1.setString(3,lastName);
			pstmt1.setString(4,email);
			pstmt1.setString(5,null);
			pstmt1.setString(6,null);
			pstmt1.setString(7,null);
			pstmt1.setString(8,city);
			pstmt1.setString(9,state);
			
			pstmt1.executeUpdate();
			
			String insertIntoPhone = "insert into PhoneNo values (?,?)";
			PreparedStatement pstmt2 = con.prepareStatement(insertIntoPhone);
			pstmt2.setString(1,readerId);
			pstmt2.setString(2,phone);
			
			pstmt2.executeUpdate();
		}
	
		
		
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
		
		pstmt3.setString(1,readerId);
		pstmt3.setString(2,bookId);
		pstmt3.setString(3,issueDate);
		pstmt3.setString(4,returnDate);
		
		
		pstmt3.executeUpdate();
		
		//decreasing the copies count
		int newCopiesAva = copies.getInt("copiesAvailable") - 1;
		String update = "update Books set CopiesAvailable = (?) where BookId = (?)";
		PreparedStatement upd = con.prepareStatement(update);
		upd.setInt(1,newCopiesAva);
		upd.setString(2,bookId);
		
		upd.executeUpdate();
		
		
		con.close();
		response.sendRedirect("readers.jsp");
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>

</body>
</html>