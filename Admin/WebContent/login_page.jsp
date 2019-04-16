
<!-- 


$(document).ready(function() {
  setInterval(function() {
    cache_clear()
  }, 3000);
});

function cache_clear() {
  window.location.reload(true);
  // window.location.reload(); use this if you do not remove cache
}



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<p>Auto reload page and clear cache</p>


 -->



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- App favicon -->
<link rel="shortcut icon" href="images/favicons.ico">

<title>Admin Login Page</title>

<!-- App -->
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i"
	rel="stylesheet">

<!-- Icons Font -->
<link href="css/font-awesome.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">

</head>

<body class="bg-transparent">
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");

		String s = (String) session.getAttribute("main_admin");
		System.out.println("outer : " + s);

		// 		response.sendRedirect("toll_collector_login_page.jsp");

		if (session.getAttribute("main_admin") != null) {
	%>
	<jsp:include page="dashboard_admin.jsp" />
	<%
		} else if(session.getAttribute("toll_collector") != null)
		{
	%>
	<jsp:include page="toll_collector_home_page.jsp" />
	<% }
		else{
	%>
	<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">

				<div class="wrapper-page">

					<div class="account-pages">

						<div class="text-left logo-box p-b-0">
							<a href="login_page.jsp" class="logo text-left">Toll </a>
						</div>

						<div class="page-header">
							<h4>Sign in to your account</h4>
						</div>

						<div class="account-content">

							<form action="login_process" method="post">
								<div class="form-group ">
									<div class="col-xs-12">
										<input class="form-control" type="email" name="id"
											minlength="8" maxlength="30" required=""
											placeholder="Email Address"> <input type="hidden"
											name="user_type" value="main_admin">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<input class="form-control" type="password" minlength="6"
											maxlength="15" required="" name="password"
											placeholder="Password">
									</div>
								</div>


								<div class="form-group account-btn text-center m-t-25">
									<div class="col-xs-12">
										<div class="text-left m-t-15">
											<button class="btn btn-danger" type="submit" name="submit">Log
												In</button>
											<!-- <a href="register.php" class="btn
                                                    btn-default"><b>Sign Up</a> -->
										</div>
									</div>
								</div>

								<!-- <div class="form-group m-t-20">
                                            <div class="col-sm-12">
                                                <a href="forgot.php" class="text-muted"><i class="fa fa-lock m-r-5"></i> Forgot your password?</a>
                                            </div>
                                        </div> -->
							</form>

							<div class="clearfix"></div>
						</div>
					</div>

					<div class="row m-t-25">
						<div class="col-sm-12 text-center"></div>
					</div>

				</div>

				<!-- End wrapper -class -->

			</div>
		</div>
	</div>
	</section>


	<!-- js placed at the end of the document so the pages load faster -->
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<!-- jquery.easing.1.3.min -->
	<script src="js/jquery.easing.1.3.min.js"></script>

	<!-- Main js -->
	<script src="js/Main.js"></script>

</body>
</html>
<%
	}
%>