<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>SmartHomeStore</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
#myLi>a:hover{
text-decoration:none;
color:black;
}
#myli{
list-style-type:none;
margin:0px;
padding:opx;
}

</style>
</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<span class="navbar-brand "><i class ="active1">SMART HOME STORE !</i></span>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="home"><span class="glyphicon glyphicon-home"></span>Home</a></li>
					<li><a href="contact"><i class="fa fa-address-book"
							aria-hidden="true"></i></a></li>
					<li><a href="admin/productList">Product List</a></li>
					<li><a href="admin/AdminData">Admin</a></li>
					<li class="dropdown"><a  class="dropdown-toggle" data-toggle="dropdown" href="#">Admin List<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/admin/productList">Product</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/supplierList">Supplier</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/categoryList">Category</a></li>
						</ul>
						</li>
						<form class="navbar-form navbar-left">
						<div class="input-group">
						<input type="text" id="myInput" class="form-control" placeholder="Search" name ="search">
						<div class="input-group-btn">
						<button id="searchbtn" type="submit" class="btn btn-default">
						<i class="glyphicon glyphicon-search"></i>
						</button>
						</div>
						</div>
						</form>
                       <li class="dropdown">
                       <a class="dropdown-toggle" data-toggle="dropdown" href="#">Category Choice<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:forEach var="catVal" items="${catList }">
								<li><a href="${pageContext.request.contextPath}/productCustList?cid=${catVal.cid }">${catVal.cname }</a></li>
							</c:forEach>
						</ul></li>
						<li><a href="cart"><i class="glyphicon glyphicon-shopping-cart"></i>Cart</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${pageContext.request.userPrincipal.name==null}">
				  <li><a href="${pageContext.request.contextPath}/goToRegister"><span
								class="glyphicon glyphicon-user"></span>Sign Up</a></li>
						<li><a href="${pageContext.request.contextPath}/goToLogin"><span
								class="glyphicon glyphicon-log-in"></span>Login</a></li>
					</c:if>
					<c:if test="${pageContext.request.userPrincipal.name!=null}">
						<li style="padding:5px; color:#f90606;"><a>Welcome:${pageContext.request.userPrincipal.name}</a></li>
						<li><a href="${pageContext.request.contextPath}/logout"> <span 
						class="glyphicon glyphicon-log-out"></span>Logout</a></li>
					</c:if>
				</ul>x
			</div>
		</div>
	</nav>


