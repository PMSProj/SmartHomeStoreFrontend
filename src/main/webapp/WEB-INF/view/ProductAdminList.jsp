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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
<div class="fluid-container table-responsive">
<h2>Product List for Admin</h2>
<table class="table table-hover" id="api" class="display" border="2" width="80" align="center">
<thead>
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
<th class="span2">Action</th>
</tr>
</thead>
<tbody>
<c:if test="${empty prodList}">
<tr>
<td colspan="10" align="center">No record exists</td>
</tr>
</c:if>
<c:forEach var="p" varStatus="st" items="${prodList}">
<tr>
<th scope="row"><c:out value="${st.count}"></c:out></th>
<td><c:out value="${p.pid}"></c:out></td>
<td><c:out value="${p.pname}"></c:out></td>
<td><c:out value="${p.supplier.sName}"></c:out></td>
<td><c:out value="${p.category.cname}"></c:out></td>
<td class="span3"><c:out value="${p.pdescription }"></c:out></td>
<td><c:out value="${p.pPrice}"></c:out></td>
<td><c:out value="${p.stock}"></c:out></td>
<td><img src="${pageContext.request.contextPath}/resources/${p.imgName}" height="50px" width="50px" alt="${p.imgName}">
</td>
<td><c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<td class="span4">
<a class="btn btn-info" role="button" href="<c:out value="${contextRoot}"/>/admin/updateProd?id=<c:out value="${p.pid }"></c:out>"><span class="glyphicon glyphicon-pencil" style="color:red"></span></a>
<a class="btn btn-danger" role="button" href="<c:url value="/admin/deleteProd/${p.pid}"/>"><span class="glyphicon glyphicon-remove" style="color:red"></span></a>
</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>