<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<html lang="en">
<head>
<meta http-equiv="content-Type" content="text/html; charset=ISO-8859-1">
<title>Smart Home Store</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
  <jsp:include page="/WEB-INF/view/header.jsp" />
<div class="container"> 
<h2>Registration Form</h2>
<div class="col-sm-8" style="background-color:lavender;">
<div class="row">

<form:form modelAttribute="user" action="saveRegister" method="POST">
<div class="form-group">
<form:errors path="name" cssClass="err"></form:errors><br>
<label>Name:</label>
<form:input path="name" type="text" class="form-control" placeholder="Enter your name"/>
 </div>

<div class="form-group">
<label>Email:</label>
<form:input path="email" type="text" class="form-control" placeholder="Enter your email"/>
 </div>
 
<div class="form-group">
<label>Password:</label>
<form:input path="password" type="password" class="form-control" placeholder="Enter the password"/>
</div>


<div class="form-group">
<label>Address:</label>
<form:input path="address" type="text" class="form-control" placeholder="Enter the address"/>
</div>

<div class="form-group">
<label>Contact Number:</label>
<form:input path="contactnumber" type="number" class="form-control" placeholder="Enter the contact number"/>
</div>
<br><br>
<button type="submit" class="btn btn-lg  btn-info">Register</button>
<button type="reset" class="btn btn-lg  btn-info">Reset</button>

</form:form>

</div>
</div>
</div>
</body>
</html>