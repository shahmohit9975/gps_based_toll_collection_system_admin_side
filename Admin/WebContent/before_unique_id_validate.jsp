<%@page import="bean.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- App favicon -->
<link rel="shortcut icon" href="image/favicons.ico">

<title>User Vehicle Information</title>

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
// 		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
// 		response.setHeader("Pragma", "no-cache");
// 		response.setHeader("Expires", "0");

		String s = (String) session.getAttribute("toll_collector");
		System.out.println("outer : " + s);

		// 		response.sendRedirect("toll_collector_login_page.jsp");

		if (session.getAttribute("toll_collector") == null) {
			System.out.println("null part");

			response.sendRedirect("login_page.jsp");
		}
		else{
			
			%>
			<!-- Begin page -->
	<div id="main_class">
		<!-- Top Bar Start -->
		<div class="topbar">

			<!--Logo -->
			<div class="topbar-left">
				<div class="text-center">
					<a href="toll_collector_home_page.jsp" class="logo">Toll Collector</a>
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
								<h5>${sessionScope.toll_collector}</h5>
						</a>

							<ul
								class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right user-list notify-list">
							<li><a href="toll_collector_change_password.jsp"><i
										class="ti-power-off m-r-5"></i>Change Password</a></li>
								<li><a href="toll_collector_logout.jsp"><i
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
						<li class="has_sub"><a href="toll_collector_home_page.jsp"><i
								class="mdi mdi-bus-school"></i><span>Toll Display</span></a></li>



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
										<h4 class="page-title m-t-20">Toll Details</h4>
									</div>

									<div class="m-t-30">
										<form action="check" method="post">
											<table class="table table-bordered m-t-30">
												<thead class="thead-dark">
													<tr style="background-color: #ebebe0;">
														<th colspan="3" scope="col"><input type="text"
															placeholder="ENTER UNIQUE USER ID" name="id"
															style="width: 100%; padding-left: 10px;" required>
														</th>


														<!--<th scope="col">Status</th>-->
														<th scope="col"><input type="submit" value="check"
															style="width: 100%;"></th>
													</tr>

													<tr>
														<th scope="col">Transaction Id</th>
														<th scope="col">Vehicle No</th>
														<th scope="col">Plaza Id</th>

														<th scope="col">Payment Transaction Date</th>
														<th scope="col">payment Transaction Time</th>
														<th scope="col">Payment Status</th>
														<th scope="col">Return Valid</th>
														<th scope="col">OTP</th>
														<th scope="col">Can Go ?</th>



													</tr>
												</thead>
												<tbody>

													<tr>
														<%
															Connection con = ConnectionProvider.getCon();
															ResultSet rs = null;
															PreparedStatement ps = null;
															Statement stmt = null;
															boolean status = false;
															String id = (String) session.getAttribute("vehicle_unique_id_matched");
															//	String toll_plaza_id = (String) session.getAttribute("toll_id");

															//	select tra.toll_plaza_id from transaction as tra WHERE tra.otp=111111 
															//                                            select ma.toll_plaza_id from toll_collector as tc join main_admin as ma on (tc.admin_email_id=ma.email_id) where tc.email_id="a@gmail.com"

															//	ps = con.prepareStatement("select * from transaction where otp=? and isValid=1 and status=1");
															ps = con.prepareStatement("select tra.toll_plaza_id from transaction as tra WHERE tra.otp=? ");
															ps.setInt(1, Integer.parseInt(id));
															rs = ps.executeQuery();
															status = rs.next();
															int user_OTP_toll_plaza_id = rs.getInt(1);

															if (!status) {

																System.out.println("OTP is Invalid");
															} else {

																ps = con.prepareStatement(
																		"select ma.toll_plaza_id from toll_collector as tc join main_admin as ma on (tc.admin_email_id=ma.email_id) where tc.email_id=?");
																ps.setString(1, (String) session.getAttribute("toll_collector"));
																rs = ps.executeQuery();
																status = rs.next();
																int toll_collector_toll_plaza_id = rs.getInt(1);

																if (user_OTP_toll_plaza_id == toll_collector_toll_plaza_id) {

																	ps = con.prepareStatement("select * from transaction WHERE otp=?");
																	ps.setInt(1, Integer.parseInt(id));
																	rs = ps.executeQuery();

																	rs.next();
																	int isReturn_value = rs.getInt(10);
																	int isValid = rs.getInt(11);
																	int isPassed = rs.getInt(13);

																	System.out.println("valid++++++++++++++++++++++++++++");
																	System.out.println(rs.getInt(1));
																	System.out.println(rs.getString(4));
																	System.out.println(rs.getInt(5));
																	System.out.println(rs.getDate(6));
																	System.out.println(rs.getTime(7));
																	System.out.println(rs.getInt(8));
																	System.out.println(rs.getInt(9));
																	System.out.println(rs.getInt(10));
																	System.out.println(rs.getInt(11));
																	System.out.println(rs.getInt(12));
																	request.setAttribute("Transaction_Id", rs.getInt(1));
																	request.setAttribute("Vehicle_No", rs.getString(4));
																	request.setAttribute("Plaza_Id", rs.getInt(5));
																	request.setAttribute("Payment_Transaction_Date", rs.getDate(6));
																	request.setAttribute("payment_Transaction_Time", rs.getTime(7));
																	if (rs.getInt(8) == 1) {

																		request.setAttribute("Payment_Status", "Yes");
																	} else {

																		request.setAttribute("Payment_Status", "No");

																	}
																	if (rs.getInt(10) == 1) {

																		request.setAttribute("Return_Valid", "Yes");

																	} else {

																		request.setAttribute("Return_Valid", "No");

																	}

																	request.setAttribute("OTP", rs.getInt(12));
																	if (rs.getInt(13) == 0 || rs.getInt(13) == 1) {

																		request.setAttribute("isPassed", "Yes");
																		session.setAttribute("isPassed_value", rs.getInt(13));

																	} else {

																		request.setAttribute("isPassed", "No");

																	}

																	out.println("");
														%>
														<td>${ requestScope.Transaction_Id }</td>
														<td>${ requestScope.Vehicle_No }</td>
														<td>${ requestScope.Plaza_Id }</td>
														<td>${ requestScope.Payment_Transaction_Date }</td>
														<td>${ requestScope.payment_Transaction_Time }</td>
														<td>${ requestScope.Payment_Status }</td>
														<td>${ requestScope.Return_Valid }</td>

														<td>${ requestScope.OTP }</td>
														<td style="width: 8%;">${ requestScope.isPassed }</td>
														<%!static int otp;
	void setOTP(int otp1) {
		otp = otp1;
	}
	int getOTP() {

		return otp;
	}%>
														<%
															if (isPassed != -1 && isValid == 1) {
																		session.setAttribute("show_update_button", 1);
																		session.setAttribute("isReturn_value", isReturn_value);

																		setOTP((int) request.getAttribute("OTP"));
																	}

																} else {

																	System.out.println("this user's otp toll plaza not match with your toll plaza ");
														%>
														<jsp:forward
															page="user_toll_plaza_id_not_matched_with_toll_collector_toll_plaza_id.jsp"></jsp:forward>
														<%
															}
															}
														%>





													</tr>
												</tbody>
												</tbody>
											</table>

											<%
												try {

													if ((int) session.getAttribute("show_update_button") == 1) {
														session.setAttribute("show_update_button", 0);
											%>
											<!-- 																<tr> -->

											<!-- 																	<td>button</td> -->
											<!-- 																</tr> -->
											<button style="margin-left: 45%;">
												<h5 align="center">
													<a href="update_isPassed.jsp?otp=<%=getOTP()%>&check_file=1">UPDATE</a>
												</h5>
											</button>

											<%
												}
												} catch (Exception e) {

													System.out.println("+++++++++++++++++++++++++++++++++++");
													System.out.println("msg : " + e.getMessage());
												}
											%>


										</form>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- Row Start -->
					<iframe src="iframe.jsp" width="100%" height="300px"
						frameborder="1"></iframe>

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
							<form role="form" action="toll_collector_home_page.jsp"
								method="post" enctype="multipart/form-data">

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
			<% 
		}
	%>
	