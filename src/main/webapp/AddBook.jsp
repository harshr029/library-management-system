<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book adding page</title>
</head>
<%@ page errorPage="Error.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<body>
<%
	//data got from form
	String publisherId = request.getParameter("pubId");
	String publisherName = request.getParameter("pubName");
	String bookId = request.getParameter("Bookid");
	String title = request.getParameter("title");
	int edition = Integer.parseInt(request.getParameter("edition"));
	String genre = request.getParameter("genre");
	String author = request.getParameter("author");
	int rentPrice = Integer.parseInt(request.getParameter("rentPrice"));
	int copies = Integer.parseInt(request.getParameter("copies"));
	String staffId = (String)session.getAttribute("USERNAME");
	
	try {
		//Registering driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//Creating connection / tunnel
		String url = "jdbc:mysql://127.0.0.1:3306/Library";
		String username = "root";
		String pass = "H@rsH@2002";   //type your database password
		
		Connection con = DriverManager.getConnection(url,username,pass);  //connection
		
		//creating query 
		
		String insertDataInBooks = "insert into Books values (?,?,?,?,?,?,?,?)";
		String insertDataInAuthors = "insert into Authors values (?,?)";
		
		
		PreparedStatement pstmt2 = con.prepareStatement(insertDataInBooks);
		PreparedStatement pstmt3 = con.prepareStatement(insertDataInAuthors);
		
		
		//checking publisher is new or old
		String test = "select PublisherId from Publishers where PublisherId = (?)";
		PreparedStatement checking = con.prepareStatement(test);
		checking.setString(1,publisherId);
		ResultSet check = checking.executeQuery();
		
		if(!check.next()){
			String insertDataInPublishers = "insert into Publishers values (?,?)";
			PreparedStatement pstmt1 = con.prepareStatement(insertDataInPublishers);
			pstmt1.setString(1,publisherId);
			pstmt1.setString(2,publisherName);
			
			pstmt1.executeUpdate();
		}
		
		pstmt2.setString(1,bookId);
		pstmt2.setString(2,title);
		pstmt2.setInt(3,edition);
		pstmt2.setString(4,genre);
		pstmt2.setInt(5,copies);
		pstmt2.setInt(6,rentPrice);
		pstmt2.setString(7,publisherId);
		pstmt2.setString(8,staffId);
		
		
		pstmt3.setString(1,bookId);
		pstmt3.setString(2,author);
		
		
		//firing queries
		pstmt2.executeUpdate();
		pstmt3.executeUpdate();
		
		con.close();
		response.sendRedirect("Books.jsp");
	}
	catch(SQLIntegrityConstraintViolationException err){
		session.setAttribute("flag","4");
		response.sendRedirect("Error.jsp");
	}
	catch(Exception e) {
		e.printStackTrace();
	}
%>

</body>
</html>