<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>toll_amount_updated_successfully</title>
<SCRIPT LANGUAGE="javascript">
	function window_onload() {

		alert("Record Updated  !!!");

	}
</SCRIPT>
</head>
<body onload="window_onload();">
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");

		String s = (String) session.getAttribute("main_admin");
		System.out.println("outer : " + s);

		// 		response.sendRedirect("toll_collector_login_page.jsp");

		if (session.getAttribute("main_admin") == null) {
			System.out.println("null part");

			%>
			<jsp:include page="login_page.jsp" />
			<% 
			response.sendRedirect("login_page.jsp");
		} else {
	%>


	<jsp:include page="toll_price.jsp" />

</body>
</html>
<%
	}
%>