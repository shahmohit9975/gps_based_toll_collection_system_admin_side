<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OTP Updated successfully</title>
<script>
	//alert('USER record Updated SUCCESSFULLY');
</script>
<script
	src='https://cdnjs.cloudflare.com/ajaxlibs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<Script>
	$(document).ready(function() {
		swal("welcome", "a", "b");
	});
</script>
</head>
<body>
	<%
		// 	RequestDispatcher rd = request.getRequestDispatcher("iframe.jsp");
		// 	rd.forward(request, response);
		//response.sendRedirect("iframe.jsp");
	%>
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
	<a href="iframe.jsp">Update Successfully</a>
</body>
</html>

