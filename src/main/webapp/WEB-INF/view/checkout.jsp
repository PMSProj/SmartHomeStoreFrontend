<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>SmartHomeStore</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp" />
	<div class="container">
	<div class="row">
	<div class="col-xs-6" jumbotron">
	<div class="head">
	<label>Customer Shipping Details</label>
	</div>
	<div class="outer">
	<div class="well" style="width:100%">
	<form action="${pageContext.request.contextPath}/OrderProcess" method="post">
	<c:set var="gtot" value="0"></c:set>
	<c:forEach var="c" items="${cart}">
	<c:set var="gtot"  value="${gtot+c.price*c.qty}"></c:set>
	</c:forEach>
	<div class="well">
	<table>
	<tr>
	<td colspan="3">Name</td><td>${user.name}</td>
	</tr>
	<tr>
	<td colspan="3">Email</td><td>${user.email}</td>
	</tr>
	<tr>
	<td colspan="3">Address</td><td>${user.address}</td>
	</tr>
	<tr>
	<td colspan="3">Phone</td><td>${user.phone}</td>
	</tr>
	</table>
	<div class="outer">
	<h3>Enter Payment Details</h3>
	<br>
	<label>Select Payment</label>
	<select name="payment">
	<option  value="COD">Cash on delivery</option>
	<option value="Net">Net Banking</option>
	</select><br><br>
	<div>
	Name:<input type="text" name="name on card">
	Card Number:<input type="number" name ="card number">
	<input type="hidden" name="total" value="${gtot}">
	</div>
	</div>
	<input type="submit" value="PROCEED" style="width:75%" class="btn btn-danger">
	</div>
	</form>
	
	</div></div>
	
	
	</div>
	</div>
	</div>
</body>
</html>