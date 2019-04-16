<%@page import="bean.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@page
	import="bean.UserDao,bean.*,java.util.*,java.text.SimpleDateFormat,java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- App favicon -->
<link rel="shortcut icon" href="image/favicons.ico">

<title>Generated Report</title>

<!-- App -->
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i"
	rel="stylesheet">

<!-- custombox.min -->
<link href="css/custombox.min.css" rel="stylesheet">

<!-- Icons Font -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/materialdesignicons.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<script>
	function printDiv(divName) {
		var printContents = document.getElementById(divName).innerHTML;
		var originalContents = document.body.innerHTML;

		document.body.innerHTML = printContents;

		window.print();

		document.body.innerHTML = originalContents;
	}
</script>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");

		String s = (String) session.getAttribute("main_admin");
		System.out.println("outer : " + s);

		// 		response.sendRedirect("toll_collector_login_page.jsp");

		if (session.getAttribute("main_admin") == null) {
			System.out.println("null part");

			response.sendRedirect("login_page.jsp");
		} else {
	%>


	<!-- Begin page -->
	<div id="main_class">

		<!-- <?php include 'include/topbar.php' ?> -->
		<!-- Top Bar Start -->
		<div class="topbar">

			<!--Logo -->
			<div class="topbar-left">
				<div class="text-center">
					<a href="manage_toll.jsp" class="logo">Toll Authority</a>
				</div>
			</div>
			<!-- End Logo -->

			<!-- Button mobile view to collapse sidebar menu -->
			<div class="navbar navbar-default" role="navigation">

				<div class="container">

					<!-- Header Part (Right Side) -->
					<ul class="nav navbar-nav navbar-right">

						<li class="dropdown user-box"><a href="#"
							class="dropdown-toggle profile" data-toggle="dropdown"
							aria-expanded="false">
								<h5>${sessionScope.main_admin}</h5>
						</a>

							<ul
								class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right user-list notify-list">
								<li><a href="main_admin_logout.jsp"><i
										class="ti-power-off m-r-5"></i>Logout</a></li>
							</ul></li>

					</ul>
					<!-- Header Part (Right Side) -->
				</div>
			</div>
			<!-- End Top -->

		</div>
		<!-- End Topbar -->
		<!-- <?php include 'include/sidebar.php' ?> -->

		<!-- ========== Left Sidebar Start ========== -->
		<div class="left side-menu">
			<div class="sidebar-inner">

				<div class="user-panel" id="sidebar-menu">
					<ul>
						<li class="has_sub"><a href="Generate_report.jsp"><i
								class="mdi mdi-bus-school"></i><span>Generate Report</span></a></li>

						<li class="has_sub"><a href="toll_collector_add.jsp"><i
								class="mdi mdi-account"></i><span>Add Toll Collector</span></a></li>

						<li class="has_sub"><a href="toll_price.jsp"><i
								class="md mdi mdi-clipboard"></i><span>Toll Price</span></a></li>
								<li class="has_sub"><a href="manage_toll.jsp"><i
								class="md mdi mdi-clipboard"></i><span>Manage Toll
									Collector</span></a></li>
				</div>
			</div>
		</div>



		<div class="content-page">
			<!-- Content Start -->
			<div class="content">
				<!-- Container Start -->
				<div class="container">

					<!-- Row Start -->
					<div class="row">
						<div class="col-xs-12">
							<div class="panel">
								<div class="panel-body">

									<div class="product-title-box">
										<h4 class="page-title m-t-20">Toll Details</h4>
										<br> <input type="button"
											onclick="printDiv('printableArea')" value="Print Records " />
										<br>
										<br>

									</div>
									<!-- Model Start -->


									<div id="custom-modal" class="modal-demo">
										<button type="button" class="close"
											onclick="Custombox.close();">
											<span>×</span><span class="sr-only">Close</span>
										</button>

										<h4 class="custom-modal-title">Add New</h4>

										<div class="custom-modal-text text-left">
											<form role="form" action="" method="post"
												enctype="multipart/form-data">
												<div class="form-group">
													<!-- <label for="name">Category Name</label> -->
													<input type="text" class="form-control"
														placeholder="Enter name" name="name">
												</div>

												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Enter Email" name="name">
												</div>

												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Enter Password" name="name">
												</div>

												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Enter Contact" name="name">
												</div>



												<div class="text-right">
													<button type="submit" class="btn btn-custom ">Save</button>
													<button type="button" class="btn btn-danger m-l-10"
														id="close-add-item">Cancel</button>
												</div>
											</form>
										</div>
										<!-- End custom-modal form -->
									</div>
									<!-- End Modal -->


									<div class="m-t-30" id="printableArea">
										<%
											SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
												Date date = new Date();
												out.println(formatter.format(date));
										%>
										<table class="table table-bordered m-t-30">
											<thead class="thead-dark">

												<tr>
													<th scope="col">Transaction Id</th>
													<th scope="col">Vehicle No</th>
													<th scope="col">Transaction Date</th>
													<th scope="col">Transaction Time</th>
													<th scope="col">Return Toll</th>
													<th scope="col">Valid</th>
													<th scope="col">OTP</th>
													<th scope="col">Passed Status</th>
												</tr>
											</thead>
											<%
												List<Transaction> list = (List<Transaction>) session.getAttribute("print_record");
													request.setAttribute("list", list);
											%>
											<tbody>


												<c:forEach items="${list}" var="u">
													<tr>
														<td>${u.getTransaction_id()}</td>
														<td>${u.getVehicle_no()}</td>
														<td>${u.getTransaction_date()}</td>
														<td>${u.getTransaction_time()}</td>
														<td>${u.getIsReturn()}</td>
														<td>${u.getIsValid()}</td>
														<td>${u.getOtp()}</td>
														<td>${u.getIsPassed()}</td>



													</tr>
												</c:forEach>



											</tbody>


										</table>

									</div>

								</div>
							</div>
						</div>
					</div>
					<!-- Model Start -->
					<div id="custom-modal" class="modal-demo " style="display: none;">
						<button type="button" class="close" onclick="Custombox.close();">
							<span>×</span><span class="sr-only">Close</span>
						</button>

						<h4 class="custom-modal-title">Add Item</h4>

						<div class="custom-modal-text text-left">
							<form role="form" action="#" method="ppst"
								enctype="multipart/form-data">
								<div class="form-group">
									<label for="name">Item Name</label> <input type="text"
										class="form-control" placeholder="Enter name" name="name">
								</div>

								<div class="text-right">
									<button type="submit" class="btn btn-custom ">Save</button>
									<button type="button" class="btn btn-danger m-l-10"
										onclick="Custombox.close();">Cancel</button>
								</div>

							</form>
						</div>
						<!-- End custom-modal form -->

					</div>
					<!-- End Modal -->
					<!-- Model Update Modal Start -->
					<div id="custom-modal_update" class="modal-demo">
						<h4 class="custom-modal-title">Update</h4>

						<div class="custom-modal-text text-left">
							<!-- <?PHP echo "PHP/update_user.php"; ?> -->
							<form role="form" action="toll_display.html" method="post"
								enctype="multipart/form-data">

								<div class="form-group">
									<label for="name">Update Email id</label> <input type="email"
										class="form-control" placeholder="Enter email" name="email"
										id="update-email"> <input type="hidden" value=""
										name="id" id="update-id">
								</div>

								<div class="form-group">
									<label for="name">Address</label> <input type="text"
										class="form-control" placeholder="Enter Address"
										name="address" id="update-address">
								</div>

								<div class="form-group">
									<label for="name">Mobile</label> <input type="text"
										class="form-control" placeholder="Enter Mobile" name="number"
										id="update-mobile">
								</div>

								<div class="form-group">
									<label for="name">Mobile</label> <input type="text"
										class="form-control" placeholder="Enter Mobile" name="number"
										id="update-mobile">
								</div>
								<div class="form-group">
									<label for="name">Mobile</label> <input type="text"
										class="form-control" placeholder="Enter Mobile" name="number"
										id="update-mobile">
								</div>

								<div class="form-group">
									<label for="name">Area name</label> <input type="text"
										class="form-control" placeholder="Enter area" name="area"
										id="update-name"> <input type="hidden" value="edit"
										name="edit">
								</div>



								<div class="text-right">
									<button type="submit" class="btn btn-custom ">Update</button>
									<button type="button" class="btn btn-danger m-l-10"
										id="close-update-item">Cancel</button>
								</div>
							</form>


						</div>
						<!-- End custom-modal form -->
					</div>
					<!-- End Modal -->
					<!-- End Begin page -->
					<!-- js placed at the end of the document so the pages load faster -->
					<script src="js/jquery-2.1.4.min.js"></script>
					<script src="js/bootstrap.min.js"></script>

					<!-- jquery.easing.1.3.min -->
					<script src="js/jquery.easing.1.3.min.js"></script>
					<!-- custombox.min js -->
					<script src="js/custombox.min.js"></script>
					<script src="js/legacy.min.js"></script>
					<!-- form validation -->
					<script src="js/bootstrap-confirmation.min.js"></script>

					<!-- form validation -->
					<script
						src="https://cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.77/jquery.form-validator.min.js"></script>

					<!-- Main js -->
					<script src="js/Main.js"></script>
					<script type="text/javascript">
						var editItemModal;
						$(".edit-package").on(
								"click",
								function(ee) {
									$("#update-id")
											.val($(this).data("user_id"));
									$("#update-email").val(
											$(this).data("user_id"));
									$("#update-address").val(
											$(this).data("user_address"));
									$("#update-mobile").val(
											$(this).data("user_mobile"));
									$("#update-name").val(
											$(this).data("user_name"));
									editItemModal = new Custombox.modal({
										content : {
											effect : 'fadein',
											target : '#custom-modal_update'
										}
									});
									editItemModal.open();
									return false;
								});
						$("#close-update-item").on("click", function(e) {
							Custombox.modal.closeAll();
						});

						//confirmation
						$('[data-toggle="confirmation"]').confirmation({
							placement : 'left'
						});
						$(document).on("ready", function(e) {
							$("#add-item").on("click", function(e) {
								new Custombox.modal({
									content : {
										effect : 'fadein',
										target : '#custom-modal'
									}
								}).open();
								return false;
							});

							$("#close-add-item").on("click", function(e) {
								Custombox.modal.closeAll();
							});

							//confirmation
							$('[data-toggle="confirmation"]').confirmation({
								placement : 'left'
							});
						});

						$
								.validate({
									modules : 'security',
									onModulesLoaded : function() {
										var optionalConfig = {
											fontSize : '8pt',
											padding : '2px',
											bad : 'Very bad',
											weak : 'Weak',
											good : 'Good',
											strong : 'Strong'
										};
										$('input[name="password"]')
												.displayPasswordStrength(
														optionalConfig);
									}
								});
					</script>
</body>
</html>
<%
	}
%>