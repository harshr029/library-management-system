<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<body  class="bg-blue-500 select-none overflow-x-hidden">
<%
	String bookTitle = request.getParameter("title");
	String edition = request.getParameter("edition");
	String genre = request.getParameter("genre");
	
	String bookId = new String();
	String copiesAvailable = new String();
	int rentPrice = 0;
	String author = new String();

try{
	
	//JDBC code
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	//making connection / tunnel
	String url = "jdbc:mysql://127.0.0.1:3306/Library";
	String username = "root";
	String pass = "H@rsH@2002";        //type your database password
			
	Connection con = DriverManager.getConnection(url,username,pass);  //connection
	
	//query
	String query = "select * from Books natural join Authors where Title = (?) and Edition = (?) and Genre =(?)";
	PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.setString(1,bookTitle);
	pstmt.setString(2,edition);
	pstmt.setString(3,genre);
	
	ResultSet set = pstmt.executeQuery();
	
	if(!set.next()){
		session.setAttribute("flag","6");
		response.sendRedirect("Error.jsp");
	}
	
	bookId = set.getString("BookId");
	copiesAvailable = set.getString("CopiesAvailable");
	rentPrice = set.getInt("RentPrice");
	author = set.getString("Author");
	
	if(Integer.parseInt(copiesAvailable) == 0){
		session.setAttribute("flag", "6");
		response.sendRedirect("Error.jsp");
	}
	
	
	con.close();
	session.setAttribute("forIssue", bookId);
	session.setAttribute("copiesAva", copiesAvailable);
}catch(Exception e){
	e.printStackTrace();
}

%>

<div class="w-[80%] mx-auto mt-4 flex flex-col items-center gap-y-[20px]">
	
	<h1 class="font-bold text-5xl text-[#ccd]">Book Found</h1>
	
	<table class="w-[90%] text-center ml-[140px] h-[500px]">
		<tr class="text-3xl font-bold ">
			<td class="text-[#ccc]">Book Title</td>
			<td class="text-white"><%= bookTitle %> </td>
		</tr>
		
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Book Id</td>
			<td class="text-white"><%= bookId %> </td>
		</tr>
		
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Edition</td>
			<td class="text-white"><%= edition %> </td>
		</tr>
		
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Genre</td>
			<td class="text-white"><%= genre %> </td>
		</tr>
		
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Author</td>
			<td class="text-white"><%= author %> </td>
		</tr>
		
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Available copies</td>
			<td class="text-white"><%= copiesAvailable %> </td>
		</tr>
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Price for rent</td>
			<td class="text-white"><%= rentPrice %> </td>
		</tr>
</table>


<a href="issue.jsp" class="mt-[10px] font-bold bg-white text-black text-3xl text-bold p-[10px] rounded-lg">Issue this book</a>

</div>

</body>
</html>