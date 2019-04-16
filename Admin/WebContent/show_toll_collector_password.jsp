<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Toll Authority Password</title>

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
	%>
	<jsp:include page="login_page.jsp" />
	<%
		} else {
	%>

	<%
		String email_id_for_show_password = request.getParameter("email_id");
	System.out.println("============> "+email_id_for_show_password);
			session.setAttribute("email_id_for_show_password", email_id_for_show_password);
	System.out.println("============> "+session.getAttribute("email_id_for_show_password"));
	%>
	<!-- Begin page -->
	<div id="main_class">
		<!-- Top Bar Start -->
		<div class="topbar">

			<!--Logo -->
			<div class="topbar-left">
				<div class="text-center">
					<a href="toll_collector_home_page.jsp" class="logo">Toll
						Collector</a>
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
								<h5 style="color: red;">
									<b>${sessionScope.main_admin}</b>
								</h5>
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
		<!-- ========== Left Sidebar Start ========== -->
		<div class="left side-menu">
			<div class="sidebar-inner">

				<div class="user-panel" id="sidebar-menu">
					<ul>
						<li class="has_sub"><a href="Generate_report.jsp"><i
								class="mdi mdi-bus-school"></i><span>Generate Report</span></a></li>

						<li class="has_sub"><a href="toll_collector_add.jsp"><i
								class="mdi mdi-account"></i><span>Add Toll Collectorr</span></a></li>

						<li class="has_sub"><a href="toll_price.jsp"><i
								class="md mdi mdi-clipboard"></i><span>Toll Price</span></a></li>
						<li class="has_sub"><a href="manage_toll.jsp"><i
								class="md mdi mdi-clipboard"></i><span>Manage Toll
									Collector</span></a></li>
						<!-- <li class="has_sub">
                                  <a href="user.php"><i class="mdi mdi-account"></i><span>Add Toll Collector</span></a>
                              </li>
        
                              <li class="has_sub">
                                  <a href="category.php"><i class="md mdi mdi-clipboard"></i><span>Category</span></a>
                              </li>
        
                              <li class="has_sub">
                                  <a href="request.php"><i class="mdi mdi-share"></i><span>Request</span></a>
                              </li>
        
                              <li class="has_sub">
                                  <a href="quotation.php"><i class="mdi mdi-comment-question-outline"></i><span>Quotation</span></a>
                              </li>
        
                              <li class="has_sub">
                                  <a href="order.php"><i class="mdi mdi-reorder-horizontal"></i><span>Order</span></a>
                              </li>
                              
                              <li class="has_sub">
                                  <a href="payment.php"><i class="mdi mdi-cash"></i><span>Payment</span></a>
                              </li>
        
                              <li class="has_sub">
                                  <a href="insurance.php"><i class="mdi mdi-account-card-details"></i><span>Insurance Details</span></a>
                              </li>
        
                              <li class="has_sub">
                                  <a href="offer.php"><i class="mdi mdi-orbit"></i><span>Offers</span></a>
                              </li>
                              -->

					</ul>

				</div>
			</div>
		</div>


		<!-- ========== Right Content Start ========== -->
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
										<h4 class="page-title m-t-20">Verify Your Password</h4>
									</div>

									<div class="m-t-30">
										<form action="toll_authority_check_password" method="post">
											<table class="table table-bordered m-t-30"
												style="width: 50%;">
												<thead class="thead-dark">
													<tr style="background-color: #f5f5f0;">
														<th scope="col"><input type="password"
															placeholder="ENTER YOUR PASSWORD" name="current_password"
															style="width: 100%; padding-left: 10px;" required>
														</th>



													</tr>

												</thead>

											</table>


											<table class="table table-bordered m-t-30"
												style="width: 50%;">
												<thead class="thead-dark">

													<tr style="background-color: #e0e0d1;">



														<!--<th scope="col">Status</th>-->
														<th scope="col"><input type="submit" value="CHECK"
															style="width: 100%;"></th>
													</tr>
												</thead>




											</table>
										</form>
									</div>

								</div>
							</div>
						</div>
					</div>
					<!-- Row Start -->


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
									<label for="name">Update Email</label> <input type="email"
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


				</div>
				<!-- End Container -->
			</div>
			<!-- End Content -->
		</div>


		<!-- End Content page -->



	</div>
	<!-- End Begin page -->


	<!-- include footer file -->
	<!-- <?php include 'include/footerjs.php' ?> -->

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!-- jquery.easing.1.3.min -->
	<script src="js/jquery.easing.1.3.min.js"></script>

	<!-- custombox.min js -->
	<script src="js/custombox.min.js"></script>
	<script src="js/legacy.min.js"></script>

	<!-- form validation -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.77/jquery.form-validator.min.js"></script>

	<!-- form validation -->
	<script src="js/bootstrap-confirmation.min.js"></script>

	<!-- Main js -->
	<script src="js/Main.js"></script>



	<script type="text/javascript">
		var editItemModal;
		$(".edit-package").on("click", function(ee) {
			$("#update-id").val($(this).data("user_id"));
			$("#update-email").val($(this).data("user_id"));
			$("#update-address").val($(this).data("user_address"));
			$("#update-mobile").val($(this).data("user_mobile"));
			$("#update-name").val($(this).data("user_name"));
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

		$.validate({
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
				$('input[name="password"]').displayPasswordStrength(
						optionalConfig);
			}
		});
	</script>

</body>
</html>
</body>

</html>
<%
	}
%>