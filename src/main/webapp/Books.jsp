<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='en'>

<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE-edge'>
    <meta name='viewport' content='width=device-width,initial-scale=1.0'>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="./css/main.css">
    <title>Books Record</title>
</head>
<%@ page import="java.sql.*" %>
<body class="bg-blue-500 select-none overflow-x-hidden">

<%
	if(session.getAttribute("USERNAME") == null){
		response.sendRedirect("login.html");
	}
%>

    <h1 class="font-bold text-6xl text-violet-950 flex justify-center items-center mt-5">RECORD OF BOOKS</h1>
    <form action="AddBook.jsp" method="post" class="m-9 text-pink-950 w-[90%] mx-auto">
        <div class="m-5 flex w-[100%] justify-between ">
       	<div class="w-[45%] flex justify-between items-center">
            <label for="title" class="text-2xl">Title of Book : </label>
            <input  type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="title" id="title" required>
            </div>
            <div class="w-[45%] flex justify-between items-center">
            <label for="Bookid" class="text-2xl"> Book ID : </label>
            <input type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="Bookid" id="Bookid" required>
            </div>
        </div>
        
        <div class="m-5 flex w-[100%] justify-between">
       	<div class="w-[45%] flex justify-between items-center">
            <label for="edition" class="text-2xl">Edition : </label>
            <input  type="number" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="edition" id="edition" required>
            </div>
            <div class="w-[45%] flex justify-between items-center">
            <label for="genre" class="text-2xl">Genre : </label>
            <input type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="genre" id="genre" required>
            </div>
        </div>
        
        <div class="m-5 flex w-[100%] justify-between">
       	<div class="w-[45%] flex justify-between items-center">
            <label for="author" class="text-2xl">Author : </label>
            <input  type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="author" id="author" required>
            </div>
            <div class="w-[45%] flex justify-between items-center">
            <label for="rentPrice" class="text-2xl">Rent Price : </label>
            <input type="number" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="rentPrice" id="rentPrice" required>
            </div>
        </div>
        
        <div class="m-5 flex w-[100%] justify-between">
       	<div class="w-[45%] flex justify-between items-center">
            <label for="pubId" class="text-2xl">Publisher ID : </label>
            <input  type="text" class="w-[70%] rounded-lg bg-[#ccc] pl-5 pr-5" name="pubId" id="pubId" required>
            </div>
        </div>
        
        <div class="m-5 flex w-[100%] justify-between">
        <div class="w-[60%] flex justify-between items-center">
            <label for="pubName" class="text-2xl">Publisher Name : </label>
            <input type="text" class="w-[58%] rounded-lg bg-[#ccc] pl-5 pr-5" name="pubName" id="pubName" required>
            </div>
        </div>
        <div class="m-5 flex w-[100%] justify-between">
       	<div class="w-[60%] flex items-center gap-x-2 justify-between">
            <label for="copies" class="text-2xl">Available Copies in Library : </label>
            <input  type="number" class="w-[58%] rounded-lg bg-[#ccc] pl-5 pr-5" name="copies" id="copies" required>
            </div>
        </div>

        <div class="ml-5">
            <input type="submit" class="text-white cursor-pointer bg-gradient-to-br from-purple-600 to-blue-500 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2" value="Add this book">
        </div>
        
    </form>
    <div class="flex items-center justify-evenly">
        <input type="search" class="w-6/12 h-10 rounded-lg pl-5 pr-5 " placeholder="Search for any book in our library">
        <button type="button"
            class="text-white bg-gradient-to-r from-purple-500 to-pink-500 hover:bg-gradient-to-l focus:ring-4 focus:outline-none focus:ring-purple-200 dark:focus:ring-purple-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">SEARCH
            FOR BOOK</button>
    </div>

	
    <table class="w-[100%] mt-10 border-8 border-cyan-500 text-center text-white font-bold">
        <tr class="text-black font-bolder">
            <th>Book id</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Edition</th>
            <th>Genre</th>
            <th>Copies</th>
        </tr>
    <%
	//Getting info of all the books in Library
	try{
	//JDBC code
		
	//register driver
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	//making tunnel
	String url = "jdbc:mysql://localhost:3306/Library";
	String user = "root";
	String pass = "H@rsH@2002";    //type your database password
	
	Connection con = DriverManager.getConnection(url,user,pass);
	
	//creating query
	String query = "select * from Books natural join Authors";
	Statement stmt = con.createStatement();
	
	//fire query
	ResultSet set = stmt.executeQuery(query);
	
	String bookId = new String();
	String title = new String();
	String author = new String();
	String price = new String();
	String edition = new String();
	String genre = new String();
	String copies = new String();
	
	while(set.next()){
		bookId = set.getString("BookId");
		title = set.getString("Title");
		author = set.getString("Author");
		price = set.getString("RentPrice");
		edition = set.getString("Edition");
		genre = set.getString("Genre");
		copies = set.getString("CopiesAvailable");
		
		out.print("<tr> <td>"+bookId+"</td><td>"+title+"</td><td>"+author+"</td><td>"+price+"</td><td>"+edition+"</td><td>"+genre+"</td><td>"+copies+"</td> </tr>");
	}
	
	con.close();
	
}catch(Exception e){
	e.printStackTrace();
}
		
	%>
    </table>
</body>

</html>