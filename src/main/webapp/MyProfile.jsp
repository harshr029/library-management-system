<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile: 
<%= session.getAttribute("USERNAME") %>
</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<%@ page import="java.sql.*" %>
<body class="bg-[#172554] h-[100vh] w-[100vw] overflow-x-hidden select-none">

<%
	if(session.getAttribute("USERNAME") == null){
		response.sendRedirect("login.html");
	}

	String userName = (String)session.getAttribute("USERNAME");
	String role = (String)session.getAttribute("ROLE");
	
	String firstName = new String();
	String lastName = new String();
	String email = new String();
	String houseNo = new String();
	String street = new String();
	String city = new String();
	String state = new String();
	String phoneNo = new String();

	ResultSet setBooks = null;
	Connection con = null;

	//JDBC code
	try{
		
	//registering driver
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	//making connection / tunnel
	String url = "jdbc:mysql://localhost:3306/Library";
	String user = "root";
	String pass = "H@rsH@2002";        //type your database password
	
	con = DriverManager.getConnection(url,user,pass);
	
	//creating query according to role
	String query = new String();
	if("reader".equals(role)){
		query = "select * from Readers natural join PhoneNo where UserName = (?)";
	}
	else{
		query = "select * from Staff natural join Staff_PhoneNo where UserName = (?)";
	}
	
	//Statement for query
	PreparedStatement pstmt = con.prepareStatement(query);
	
	pstmt.setString(1, userName);
	//fire query
	ResultSet set = pstmt.executeQuery();
	
	//process data
	set.next();
	
	firstName = set.getString("FirstName");
	lastName = set.getString("LastName");
	email = set.getString("Email");
	houseNo = set.getString("HouseNo");
	street = set.getString("Street");
	city = set.getString("City");
	state = set.getString("State");
	phoneNo = set.getString("PhoneNo");
	
	
	//information of books
	String books = "select BookId,Title,date_format(IssueDate, '%d-%m-%Y') as IssueDate,date_format(ReturnDate, '%d-%m-%Y') as ReturnDate,Fine from Books natural join Record where userName = (?)";
	PreparedStatement books1 = con.prepareStatement(books);
	books1.setString(1,userName);
	setBooks = books1.executeQuery();
	

	}catch(Exception e){
		e.printStackTrace();
	}
			
	
%>

<div class="w-[80%] mx-auto mt-4 flex flex-col items-center gap-y-[20px]">
	
	<h1 class="font-bold text-5xl text-[#ccd]">Your Details</h1>
	
	<table class="w-[90%] text-center ml-[140px] h-[500px] text-3xl font-bold text-white">
		<tr class="text-3xl font-bold ">
			<td class="text-[#ccc]">First Name</td>
			<td class="text-white"><%= firstName %> </td>
		</tr>
		
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Last Name</td>
			<td class="text-white"><%= lastName %> </td>
		</tr>
		
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Email ID</td>
			<td class="text-white"><%= email %> </td>
		</tr>
		
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Phone Number</td>
			<td class="text-white"><%= phoneNo %> </td>
		</tr>
		
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Address</td>
			<td class="text-white"><% out.print(houseNo+", "+street+", <br>"+city+", "+state+", India"); %> </td>
		</tr>
		
		<tr class="text-3xl font-bold">
			<td class="text-[#ccc]">Role</td>
			<td class="text-white"><%= role %> </td>
		</tr>
		</table>
		
		
		<h1 class="text-4xl font-bold text-[#ccd]">Issued Books</h1>
		
		<table class="w-[100%] mt-10 border-8 border-cyan-500 text-center text-white font-bold">
        <tr class="text-[#ccc] font-bolder text-xl">
            
            <th>Book id</th>
            <th>Title</th>
            <th>Issue date</th>
            <th>Return Date</th>
           
        </tr>
		
		
		<%
	
				while(setBooks.next()){
					String bookId = setBooks.getString("BookId");
					String title = setBooks.getString("Title");
					String issueDate = setBooks.getString("IssueDate");
					String returnDate = setBooks.getString("ReturnDate");
					
					out.print("<tr> <td>"+bookId+"</td><td>"+title+"</td><td>"+issueDate+"</td><td>"+returnDate+"</td></tr>");
				}
		
		con.close();
		%>

</table>

</div>



</body>
</html>