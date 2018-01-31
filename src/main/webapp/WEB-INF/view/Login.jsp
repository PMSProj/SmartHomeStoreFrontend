<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Smart Home Store</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 </head>
<body>
  <jsp:include page="/WEB-INF/view/header.jsp" />
  <div class="container" align="center"> 
<h2>Welcome to Login Page</h2>
<form action="${pageContext.request.contextPath}/Login" class="form-signin" method="post">
<h4><label>Email:</label></h4>
<input type="text" name="username" class="login-box" required/>
<h4>
<label>Password:</label></h4>
<input type="password" name="password" class="login-box" required/>
<br><br>
<button class="btn btn-lg btn-primary" type="submit">Login</button>
<button class="btn btn-lg btn-primary" type="reset">Cancel</button>
</form>
</div>
</body>
</html>