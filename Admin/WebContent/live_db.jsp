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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<meta http-equiv="refresh" content="5" />
</head>
<body>
	<h1>Users List</h1>
	<%
		String toll_collector = (String) session.getAttribute("toll_collector");
		//List<User> list = UserDao.getAllRecords(toll_collector);

		List<User> list = UserDao.getAllRecords(toll_collector);
		request.setAttribute("list", list);
	%>
	
	<table border="1" width="90%">
		<tr>
			<th>Transaction_id</th>
			<th>Vehicle No</th>
			<th>Plaza Id</th>
			<th>Payment Transaction Date</th>
			<th>payment Transaction Time</th>
			<th>Payment Status</th>
			<th>Return Valid</th>
			<th>OTP</th>
			<th>Update</th>

		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getTransaction_id()}</td>
				<td>${u.getVehicle_no()}</td>
				<td>${u.getToll_plaza_id()}</td>
				<td>${u.getTransaction_date()}</td>
				<td>${u.getTransaction_time()}</td>
				<td>${u.getStatus()}</td>
				<td>${u.getIsreturn()}</td>
				<td>${u.getOtp()}</td>
				
				<td><a href="update_isPassed.jsp?otp=${u.getOtp()}">UPDATE</a></td>

			</tr>
		</c:forEach>
	</table>

</body>
</html>