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
		<h2>Product List For Admin</h2>
		<table class="table table-hover" id="api" class="display" border="2" width="80" align="centre">
			<tr>
				<th>Sl No</th>
				<th>PID</th>
				<th>Product Name</th>
				<th>Product Supplier</th>
				<th>Product Category</th>
				<th>Description</th>
				<th>Stock</th>
				<th>Price</th>
				<th>Image</th>
				<th>Action</th>
			</tr>
			<c:if test="${empty prodList}">
				<tr>
					<td colspan="10" align="center">No record exists!!</td>
				</tr>
			</c:if>
			<c:forEach var="p" varStatus="st" items="${prodList}">
				<tr>
					<td><c:out value="${st.count}"></c:out></td>
					<td><c:out value="${p.pid}"></c:out></td>
					<td><c:out value="${p.pname}"></c:out></td>
					<td><c:out value="${p.supplier.sName}"></c:out></td>
					<td><c:out value="${p.category.cname}"></c:out></td>
					<td class="span3"><c:out value="${p.pdescription }"></c:out></td>
					<td><c:out value="${p.pPrice}"></c:out></td>
					<td><c:out value="${p.stock}"></c:out></td>
					<td><img
						src="${pageContext.request.contextPath}/resources/${p.imgName}"
						height="50px" width="50px">
					<td class="span2"><c:set var="contextRoot"
							value="${pageContext.request.contextPath}"></c:set> <a
						class="btn btn-info" role="button"
						href="<c:url value="/prodDetails/${p.pid}"/>">Details</a> }</td>
				</tr>
			</c:forEach>


		</table>

	</div>
</body>
</html>