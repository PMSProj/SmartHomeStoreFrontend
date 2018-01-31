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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp" />
	<div class="container"></div>
	<h1>Smart Home Store</h1>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active">
				<img src="<c:url value="/resources/referigerator.jpg"/>"
					class="img-responsive center-block" alt="referigerator"
					style="width: 100%;" />
					
			</div>
			
			<div class="item">
				<img src="<c:url value="/resources/img.jpg"/>"
					class="img-responsive center-block" alt="airconditioner"
					style="width: 100%;" />
			</div>
			<div class="item">
				<img src="<c:url value="/resources/wifiac.jpg"/>"
					class="img-responsive center-block" alt="wifiairconditioner"
					style="width: 100%;" />
			</div>

			<div class="item">
				<img src="<c:url value="/resources/img2.jpg"/>"
					class="img-responsive center-block" alt="smartHomeappliances"
					style="width: 100%;" />
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
 <jsp:include page="/WEB-INF/view/footer.jsp" />
</body>
</html>
