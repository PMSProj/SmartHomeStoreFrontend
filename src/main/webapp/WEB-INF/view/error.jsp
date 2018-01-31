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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp" />
	<div class="container">
		<h2>Authentication Error!!</h2>
		<h3>
			Please Login Again or<a href="${pageContext.request.contextPath }/logPage">Login</a>
		</h3>
		<div class="item">
			<img class="img-rounded" class="img-responsive center-block" src="<c:url value="/resources/error.png"/>" style="width:50%"
				alt="error">
		</div>
	</div>

</body>
</html>