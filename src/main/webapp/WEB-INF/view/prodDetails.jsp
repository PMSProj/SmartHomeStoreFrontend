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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<style type="text/css">
th{
 text-align:center;
 border-left:1px solid #59a5e5;
 background-color:#63b8ff;
}
table
{ 
border-top:1px solid #59a5e5;
background-color:#63b8ff;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp" />
	<div class="container">
	<div class="row">
	<div class="col-sm-4 item-photo">
	<img style="max-width:100% ; margin-top:30px;" src="${pageContext.request.contextPath }/resources/${p.imgName}"/>
	</div>
		<div class="col-sm-5" style="border:0px solid gray"></div>
	<h3>${p.pname}</h3>
	<h4>${p.pdescription }</h4>
	<h4>Rs. ${p.pPrice }</h4>
	<h4>${p.sName}</h4>
	<div class="section" style="padding-bottom:20px;">
	<form action="${pageContext.request.contextPath}/addToCart" method="post">
	<input type="hidden" value="${p.pid}" name="pid"/>
	<input type="hidden" value="${p.pPrice}" name="pPrice"/>
	<input type="hidden" value="${p.pname}" name="pname"/>
	<input type="hidden" value="${p.imgName}" name="imgName"/>
	<label>Qty</label><input type="number" class="form-control" name="pQty" required/>
	<br>
	<br>
	<input class="btn btn-warning btn-lg" type="submit" value="Add To Cart">
	<h6> <span style="color:red;" class="glyphicon-glyphicon-heart" style="cursor:pointer;"></span>Wish List</h6>
	</form>
     </div>
	</div>
	<hr>
	<div class="col-xs-9">
	<h3>ProductDetails</h3>
	<ul class="menu-items">
	<li>All appliances are sanctioned by BLRO of India</li>
	</ul>
	</div>
	<div class="col-xs-9">
	<br><hr>
	<h6>We are Authorized Company by Indian Government</h6>
	</div>
</div>
</body>
</html>