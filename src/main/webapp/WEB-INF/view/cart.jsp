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
	<table class="table table-hover" id="api" class="display" border="2"
		width="80" align="centre">
		<tr>
			<th>Product Name</th>
			<th>Product Quantity</th>
			<th>Product Price</th>
			<th>Product Image</th>
			<th>Sub Total</th>
			<th>Action</th>
		</tr>
		<c:if test="${empty cartInfo}">
			<tr>
				<td colspan="10" align="center">No record exists!!</td>
			</tr>
		</c:if>
		<c:forEach var="p" varStatus="st" items="${prodList}">
			<tr>
				<td><c:out value="${p.pname}"></c:out></td>
				<td><c:out value="${p.qty}"></c:out></td>
				<td><c:out value="${p.price}"></c:out></td>
				<td><c:out value="${p.stock}"></c:out></td>
				<td><img
					src="${pageContext.request.contextPath}/resources/${p.imgName}"
					height="50px" width="50px">
				<td><c:out value="${p.qty*p.pPrice}" /></td>
				<td class="span2"><c:set var="contextRoot"
						value="${pageContext.request.contextPath}"></c:set> 
				<a	class="btn btn-danger" role="button"
					href="<c:url value="/deletePCart/${p.pid}"/>">Delete</a></td>
			</tr>
		</c:forEach>
		<td>
		<c:set var="gtot" value="${gtot+p.pPrice*p.qty}"></c:set> 
		<span class="col-lg-9" align="right"><label>Grand Total</label> <c:out
					value="${gtot}" /></span></td>
		<tfoot>
			<td><a class="btn-btn-warning btn-lg"
				href="${pageContext.request.contextPath}/home">Continue Shopping</a>
			</td>
			<td><a class="btn btn-success btn-lg"
				href="${pageContext.request.contextPath}/checkout">CheckOut</a></td>
		</tfoot>
	</table>
</body>
</html>