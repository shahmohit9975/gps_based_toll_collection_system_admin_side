<%@page import="bean.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@page import="bean.UserDao,bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- App favicon -->
<link rel="shortcut icon" href="image/favicons.ico">

<title>Live DB</title>

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
<meta http-equiv="refresh" content="5" />
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
		} else {
	%>
	<div class="m-t-30">
		<%
			String toll_collector = (String) session.getAttribute("toll_collector");
				//List<User> list = UserDao.getAllRecords(toll_collector);

				List<User> list = UserDao.getAllRecords(toll_collector);
				request.setAttribute("list", list);
		%>
		<table class="table table-bordered m-t-30">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Transaction_id</th>
					<th scope="col">Vehicle No</th>
<!-- 					<th scope="col">Plaza Id</th> -->
					<th scope="col">Payment Transaction Date</th>
					<th scope="col">payment Transaction Time</th>
<!-- 					<th scope="col">Payment Status</th> -->
					<th scope="col">Return Valid</th>
					<th scope="col">Status</th>
					<th scope="col">OTP</th>
					<th scope="col">Update</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="u">
					<tr>
						<td>${u.getTransaction_id()}</td>
						<td>${u.getVehicle_no()}</td>
						<%-- 						<td>${u.getToll_plaza_id()}</td> --%>
						<td>${u.getTransaction_date()}</td>
						<td>${u.getTransaction_time()}</td>
						<%-- 						<td>${u.getStatus()}</td> --%>
						<td>${u.getIsreturn()}</td>
						<td>${u.getIsPassed()}</td>
						<td>${u.getOtp()}</td>

						<td><a
							href="i_get_otp_for_update.jsp?otp=${u.getOtp()}&isReturn=${u.getIsreturn()}&isPassed=${u.getIsPassed()}&check_file=2">UPDATE</a></td>

					</tr>
				</c:forEach>
				<!-- 				<tr> -->

				<!-- 					<td>Em</td> -->
				<!-- 					<td>adsf</td> -->
				<!-- 					<td>985478251</td> -->
				<!-- 					<td>customer</td> -->
				<!-- 					<td>asdf</td> -->
				<!-- 					<td><a href="" class="btn btn-default btn-icon edit-package" -->
				<!-- 						data-user_id="abs@gmail.com" data-user_address="asdf" -->
				<!-- 						data-user_mobile="985478251" data-user_name="asdf"> <i -->
				<!-- 							class="mdi mdi-pencil-box"></i> -->
				<!-- 					</a><a href='dashboard.html' data-toggle="confirmation" -->
				<!-- 						class='btn btn-danger _delete btn-icon' /> <i -->
				<!-- 						class='mdi mdi-delete'></i></td> -->
				<!-- 				</tr> -->
			</tbody>

			</tbody>
		</table>
	</div>
</body>
</html>
<%
	}
%>
