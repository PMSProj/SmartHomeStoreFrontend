<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>SmartHomeStore</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Admin</title>
<style>
.roundedcorners{
border-radius:5px;
}
*{
  font-family:"Cambria",Cambria;
  font-weight:normal;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/header.jsp" />
	<div class="container">
		<br>
		<div class="page-header">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="panel with-nav-tabs panel-primary">
							<div class="panel-heading">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab1" data-toggle="tab" class="roundedcorners"><span id="t1">Supplier</span></a></li>
									<li><a href="#tab2" data-toggle="tab"class="roundedcorners"><span id="t1">Category</span></a></li>
									<li><a href="#tab3" data-toggle="tab" class="roundedcorners"><span id="t1">Product</span></a></li>
								</ul>
							</div>
							<div class="panel-body" style="margin-left:5px;">
								<div class="tab-content">
									<div class="tab-pane fade in active" id="tab1">
										<form method="post" action="<c:url value="/admin/saveSupp"></c:url>" class="form-signin">
											<span id="reauth-email" class="reauth-email"></span>
											<h4 class="input-title">Supplier Id</h4>
											<br> <input class="form-control" type="number"
												name="sid" required />
											<h4 class="input-title">Supplier Name</h4>
											<br> <input class="form-control" type="text"
												name="sname" required /> <br>
											<button class="btn btn-lg btn-primary" type="submit">Save</button>
											<button class="btn btn-lg btn-warning" type="reset">Cancel</button>
										</form>
									</div>
									<div class="tab-pane fade" id="tab2">
										<form method="post" action="<c:url value="/admin/saveCat" ></c:url>"class="form-signin">
											<span id="reauth-email" class="reauth-email"></span>
											<h4 class="input-title">Category Id</h4>
											<br> <input class="form-control" type="number"
												name="cid" required />

											<h4 class="input-title">Category Name</h4>
											<br> <input class="form-control" type="text"
												name="cname" required /> <br>
											<br>
											<button class="btn btn-lg btn-primary" type="submit">Save</button>
											<button class="btn btn-lg btn-warning" type="reset">Cancel</button>
										</form>

									</div>

									<div class="tab-pane fade" id="tab3">
										<form method="post" action="<c:url value="/admin/saveProduct"/>"
											class="form-signin" enctype="multipart/form-data">
											<span id="reauth-email" class="reauth-email"></span>
											<h4 class="input-title">Product Id</h4>
											<br> <input class="form-control" type="number"
												name="pid" required />

											<h4 class="input-title">Product Name</h4>
											<br> <input class="form-control" type="text"
												name="pname" required /><br>
											<h4 class="input-title">Product Description</h4>
											<br> <input class="form-control" type="text"
												name="pdescription" required /><br>

											<h4 class="input-title">Product Price</h4>
											<br> <input class="form-control" type="number"
												name="pPrice" required /><br>

											<h4 class="input-title">Product Stock</h4>
											<br> <input class="form-control" type="number"
												name="Stock" required /><br>
											<div class="form-group">
												<table>
													<tr>
														<td><h4>Select Supplier</h4></td>
														<td><select class="form-control" name="pSupplier"
															required="required">
																<option value="">Select Supplier</option>
																<c:forEach items="${satList }" var="sat">
																	<option value="${sat.sid}">${sat.sName}</option>
																</c:forEach>
														</select></td>
													</tr>
												</table>
											</div>
											<br>
											<div class="form-group">
												<table>
													<tr>
														<td><h4>Select Category</h4></td>
														<td><select class="form-control" name="pCategory"
															required="required">
																<option value="">Select Category</option>
																<c:forEach items="${catList }" var="cat">
																	<option value="${cat.cid}">${cat.cname}</option>
																</c:forEach>
														</select></td>
													</tr>
												</table>
											</div>
											  <div class="fileinput fileinput-new" data-provider="fileinput">
											      
											          <h4>product Image</h4>
											           <input class="form-control" type="file" name="file" accept="resource/*">
											      </div>
											      <br>
											      <br>     
											     									  
											   <button class="btn btn-lg btn-primary" type="submit">Save</button>
											   <button class="btn btn-lg btn-warning" type="reset">Cancel</button>
											</form>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
       </div>
</body>
</html>



