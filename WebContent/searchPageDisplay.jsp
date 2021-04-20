<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.IOException,java.io.PrintWriter,java.io.IOException,java.io.PrintWriter" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "jakarta.servlet.http.HttpServlet,jakarta.servlet.http.HttpServletRequest,jakarta.servlet.http.HttpServletResponse,jakarta.servlet.annotation.WebServlet,jakarta.servlet.http.HttpServlet" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <!-- Styles -->
    <link rel="stylesheet" href="searchPage.css">
  
    
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100&family=Ubuntu:wght@300&display=swap" rel="stylesheet">
    <!-- Font awesome -->
    <script src="https://kit.fontawesome.com/ae662ae996.js" crossorigin="anonymous"></script>
    <!--  script function -->

    <script src="form.js"></script>
    <title>Document</title>
</head>
<body>
            <%
            	String search_query = request.getParameter("search");
            	String url="jdbc:mysql://localhost:3306/PBL";
            	String username = "root";
            	String password = "";    <!--enter your sql password -->
                Connection connection = DriverManager.getConnection(url,username,password);
                Statement statement = connection.createStatement();
                String yowassup = "select * from tb_blood_camps where city ='"+ search_query+ "'";
                ResultSet resultset = statement.executeQuery(yowassup) ;
            %>
     
     <!-- Search Navigation Bar -->          
    <div class="search-header container-fluid">
        <div class="search-logo"><i class="fas fa-search-location fa-2x "></i></div>
        <div  class="header-element">
         
        	<form class="form-inline my-2 my-lg-0" action = "searchPageDisplay.jsp" method = "post">
            	<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name = "search">
            	<button class="btn btn-light my-2 my-sm-0" type="submit">Search</button>
         	</form>
        </div>
     </div>
     
<!-- To Fetch and Display Blood Camp details based on the city searched -->
    <div class="row">
    <div class="col col-lg-6">  
    <div class="info-container">
       <% while(resultset.next()){ %> 
        <div class="info">        
            <form class="form-container">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="exampleFormControlFile1" value = <%=resultset.getInt(1)+","+resultset.getString(3)+","+resultset.getString(4)+","+resultset.getString(2) %> readonly>
                </div>
              </form>

            <div>
              <button class="select-button btn btn-light my-2 my-sm-0" onclick="openform()" type="submit">Select</button>
            </div>
        </div>
         <% } %>
            
        </div>
    	</div>
  
  
<!-- To Display Registration From when a particular blood bank is selected -->    
        <div class="col col-lg-6">
        <div id="myform" class="fill-form">
            <div class="form-card card">
              	<div class="card-header">
                  <h1>User Information</h1>
              	</div>  
              	 
            	<form action ="register" method = "post"> 
<!-- Email Id Filed -->
                	<div class="form-group">
                  		<label for="exampleInputEmail1">Email</label>
                  		<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your email id" name = "email" required>
                	</div>
                	<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                
<!-- Name Filed -->
                	<div class="form-group">
                  		<label for="Name">Name</label>
                  		<input type="text" class="form-control" id="exampleInputtext" placeholder="Enter your Full Name" name = "name" required>
                	</div>
                
<!-- Age Filed -->
                	<div class="form-group">
                    	<label for="Age">Age</label>
                    	<input type="number" size="4"  name="age" min="18" required >
                	</div>
                  
<!-- Height Filed -->
                	<div class="form-group">
                    	<label for="Height">Height</label>
                    	<input type="number" step="any" size="4" id="exampleInputtext" placeholder="Enter your height in inches" name = "height" required>
                	</div>
                
<!-- Weight Filed -->
                	<div class="form-group">
                    	<label for="Weight">Weight</label>
                    	<input type="number" step="any"  id="exampleInputtext" placeholder="Enter you weight in kg" min="50" name = "weight" required >
                	</div>
                
<!-- Phone Filed -->
                	<div class="form-group">
                    	<label for="Phone_no">Phone</label>
                    	<input type="tel" pattern=".{10}" class="form-control" id="validationCustom08" placeholder="Enter you Mobile Number" oninput="check(this)" name = "phone" required>
                	</div>

<!-- Blood Camp id Filed -->
                	<div class="form-group">
                    	<label for="Bloodcamp_id">Bloodcamp_id</label>
                    	<input type="text" class="form-control" id="exampleInputtext" placeholder="Enter blood camp id"  name = "id" required>
                	</div>
                
                	<div class="form-button">
                		<button type="submit" class="form-button btn btn-primary btn-lg">Submit</button>
                		<button type="close" class="form-button btn btn-danger btn-lg" onclick="closeform()">Close</button>
                	</div>
              </form>

        	</div>
        
      	</div>
    	</div>
  </div>
</body>
</html>