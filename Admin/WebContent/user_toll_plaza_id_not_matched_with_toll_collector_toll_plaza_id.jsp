<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>this user is not valid for this toll plaza</title>
<script>

alert("this user is not valid for this toll plaza!!!");
</script>
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
	%>
<jsp:include page="toll_collector_home_page.jsp" />
</body>
</html>

