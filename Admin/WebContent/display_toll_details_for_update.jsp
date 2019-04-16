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
<title>Display Toll Details</title>
</head>
<body>
	<%
		String toll_collector = (String) session.getAttribute("main_admin");
		//List<User> list = UserDao.getAllRecords(toll_collector);

		List<Toll> list = UserDao.get_All_Toll_Details(toll_collector);
		request.setAttribute("list", list);
	%>
	<h1>Display Toll Details</h1>
	<form action="get_and_update_toll_amount" method="post">
		<table border="1" width="90%">
			<tr>
				<th>Journy Type</th>
				<th>Two wheeler</th>
				<th>Four wheeler</th>
				<th>Six wheeler</th>
				<th>Bus</th>
				<th>Truck</th>
				<th>HCM</th>
			</tr>

			<c:forEach items="${list}" var="t">
				<tr>
					<th>Single</th>

					<td><input type="text" value="${t.getTwo_one()}"
						name="two_one" style="width: 100%;"></td>
					<td><input type="text" value="${t.getFour_one()}"
						name="four_one" style="width: 100%;"></td>
					<td><input type="text" value="${t.getSix_one()}"
						name="six_one" style="width: 100%;"></td>
					<td><input type="text" value="${t.getBus_one()}"
						name="bus_one" style="width: 100%;"></td>
					<td><input type="text" value="${t.getTruck_one()}"
						name="truck_one" style="width: 100%;"></td>
					<td><input type="text" value="${t.getHcm_one()}"
						name="hcm_one" style="width: 100%;"></td>


				</tr>

				<tr>
					<th>Return</th>
					<td><input type="text" value="${t.getTwo_return()}"
						name="two_return" style="width: 100%;"></td>
					<td><input type="text" value="${t.getFour_return()}"
						name="four_return" style="width: 100%;"></td>
					<td><input type="text" value="${t.getSix_return()}"
						name="six_return" style="width: 100%;"></td>
					<td><input type="text" value="${t.getBus_return()}"
						name="bus_return" style="width: 100%;"></td>
					<td><input type="text" value="${t.getTruck_return()}"
						name="truck_return" style="width: 100%;"></td>
					<td><input type="text" value="${t.getHcm_return()}"
						name="hcm_return" style="width: 100%;"></td>

				</tr>
			</c:forEach>
		</table>
		<input type="submit" value="UPDATE" />
	</form>
</body>
</html>