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
	<c:url value="/updateProduct" var="pro"></c:url>
		<form method="post" action="productUpdate" enctype="multipart/form-data">
											<span id="reauth-email" class="reauth-email"></span>
											<h4 class="input-title">Product Id</h4>
											<input type="hidden" name="pid" value="${prod.pid }">

											<h4 class="input-title">Product Name</h4>
											<br> 
											<input value="${prod.name}" type="text" name="pName" required/><br>
											
											<h4 class="input-title">Product Description</h4>
											<br> <input value="${prod.description}" type="text"
												name="pdescription" required /><br>

											<h4 class="input-title">Product Price</h4>
											<br> <input value="${prod.price}" type="number"
												name="pPrice" required /><br>

											<h4 class="input-title">Product Stock</h4>
											<br> <input class="${prod.stock }" type="number"
												name="pStock" required /><br>
											<div class="form-group">
												<table>
													<tr>
														<td>Select Supplier</td>
														<td><select class="form-control" name="pSupplier"
															required="required">
																<option value="">Select Supplier</option>
																<c:forEach items="${satList }" var="sat">
																	<option value="${sat.sid}">${sat.sname}</option>
																</c:forEach>
														</select></td>
													</tr>
												</table>
											</div>
											<div class="form-group">
												<table>
													<tr>
														<td><h4>Select Category</h4></td>
														<td><select class="form-control" name="pCategory"
															required="required">
																<option value="">Select Category</option>
																<c:forEach items="${cList }" var="cat">
																	<option value="${cat.cid}">cat.cname</option>
																</c:forEach>
														</select></td>
													</tr>
												</table>
											</div>
											 <div class="fileinput fileinput-new" data-provider="fileinput">
											      
											          <h4>product Image</h4>
											         <td>  <input class="form-control" type="file" name="file" accept="resource/*"></td>
											      </div>
											      <br>
											      <br>     
											     									  
											   <button class="btn btn-lg btn-primary" type="submit">Update</button>
											   <button class="btn btn-lg btn-warning" type="reset">Cancel</button>
											</form>
									</div>
</body>
</html>