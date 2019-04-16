<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>i_get_otp_for_update</title>
</head>
<body>


	<!-- 
i_get_update_otp.jsp?otp=${u.getOtp()}&isReturn=${u.getIsreturn()}&isPassed=${u.getIsPassed()}&check_file=2

 -->
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
	<%
		String otp = request.getParameter("otp");
		String isReturn = request.getParameter("isReturn");
		String isPassed = request.getParameter("isPassed");

		if (isReturn.equals("Yes")) {

			isReturn = "1";
		} else {

			isReturn = "0";

		}
		if (isPassed.equals("Not Passed Yet")) {

			isPassed = "0";
		} else if (isPassed.equals("Single Time Passed")) {

			isPassed = "1";

		} else {

			isPassed = "-1";

		}

		session.setAttribute("i_otp", otp);
		session.setAttribute("i_isReturn", isReturn);
		session.setAttribute("i_isPassed", isPassed);
		RequestDispatcher rd = request.getRequestDispatcher("i_get_otp_for_update");
		rd.forward(request, response);
	%>
</body>
</html>