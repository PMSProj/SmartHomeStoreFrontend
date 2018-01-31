<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!Doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;  charset=ISO-8859-1">
<title>Modal</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>	
	<jsp:include page="/WEB-INF/view/header.jsp" />
	<div class="container">
	<div class="modal fade bs-example-modal-sm" tabindex="1" role="dialog" 
	aria-labelledby="myModal" aria-hidden="true" id="onload">
	<div class="modal-dialog modal-lg">
	<div class="modal-content">
	<button type="button" class="close" data-dismiss="modal"></button>
	</div>
	<div class="modal-body"><span>Added Successfully!!</span></div>
	<div class="modal-footer">
	<a href="AdminData" class="btn-btn-primary" role="button">Back</a>
	</div>
	</div>
	</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function()
		{
		$('#onload').modal('show');});
	</script>
</body>
</html>