<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>SmartHomeStore</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
<link  rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</head>
<body>

<jsp:include page="/WEB-INF/view/header.jsp"></jsp:include>
<div class="container">
<h2>Category List for Admin</h2>
<table class="table table-hover" id="api" class="display" border="1" width="80" align="center">
 <tr>
 <th>Sl No</th>
 <th>CID</th>
 <th>CName</th>
 <th class="span2"> Action</th>
 </tr>
 <c:if test="${empty catList }">
 <tr>
 <td colspan="10" align="center">No record exists!!</td>
 </tr>
 </c:if>
 <c:forEach var="p" varStatus="st" items="${catList}">
 <tr>
 <td><c:out value="${st.count}"></c:out></td>
  <td><c:out value="${p.cid}"></c:out></td>
   <td><c:out value="${p.cname}"></c:out></td>
   <td class="span4">
   <c:set var="contextRoot" value="${pageContext.request.contextPath }"></c:set>
 <a class ="btn btn-info" role="button" href="${contextRoot}/admin/Edit">Edit</a>
  <a class ="btn btn-danger" role="button" href="${contextRoot}/admin/Delete">Delete</a>
  </td>
  </tr>
 </c:forEach>
 
 
 </table>
 </div>  

</body>
</html>