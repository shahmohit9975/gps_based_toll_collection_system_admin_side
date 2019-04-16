<%@page import="bean.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Toll Collector</title>
</head>
<body>
	<%
		// 		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		// 		response.setHeader("Pragma", "no-cache");
		// 		response.setHeader("Expires", "0");

		String s = (String) session.getAttribute("main_admin");
		System.out.println("outer : " + s);

		// 		response.sendRedirect("toll_collector_login_page.jsp");

		if (session.getAttribute("main_admin") == null) {
			System.out.println("null part");

			response.sendRedirect("login_page.jsp");
		} else {
	%>
</body>
<%
	String email_id = (String) request.getParameter("email_id");
		System.out.println("email id :" + email_id);
		try {

			//Connection con = ConnectionProvider.getCon();

			Connection con = ConnectionProvider.getCon();
			ResultSet rs = null;
			PreparedStatement ps = null;
			Statement stmt = null;

			System.out.println("1");
			String sql = "DELETE FROM toll_collector " + "WHERE email_id ='"+email_id+"'";
			System.out.println("2");
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			System.out.println("3");

			System.out.println(email_id + " Deleted !!!");
			RequestDispatcher rd = request.getRequestDispatcher("toll_collector_deleted_successfully.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			System.out.println("exception in delete toll collector jsp");
			System.out.println("msg : " + e.getMessage());
			e.printStackTrace();

		}
%>
</html>
<%
	}
%>