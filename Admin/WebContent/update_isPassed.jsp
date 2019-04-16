

<%@page import="bean.UserDao"%>
<jsp:useBean id="u" class="bean.User"></jsp:useBean>
<jsp:setProperty property="otp" param="otp" name="u" />
<%
// 	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
// 	response.setHeader("Pragma", "no-cache");
// 	response.setHeader("Expires", "0");

	String s1 = (String) session.getAttribute("toll_collector");
	System.out.println("outer : " + s1);

	// 		response.sendRedirect("toll_collector_login_page.jsp");

	if (session.getAttribute("toll_collector") == null) {
		System.out.println("null part");

		RequestDispatcher rd = request.getRequestDispatcher("login_page.jsp");
		rd.forward(request, response);
	} else {
%>
<%
	int status = 0;
		String s = request.getParameter("otp");
		System.out.println("MY OTP :" + s);

		if ((Integer.parseInt(request.getParameter("check_file"))) == 2) {
			//update_isPassed.jsp?otp=${u.getOtp()}&isReturn=${u.getIsreturn()}&isPassed=${u.getIsPassed()}&check_file=2
			status = UserDao.update_isPassed(u, Integer.parseInt(request.getParameter("isReturn")),
					Integer.parseInt(request.getParameter("isPassed")));

		} else {
			status = UserDao.update_isPassed(u, (int) session.getAttribute("isReturn_value"),
					(int) session.getAttribute("isPassed_value"));
		}

		if (status == 1) {
			session.setAttribute("isPassed_value", -1);

		} else if (status == 2) {

			session.setAttribute("isPassed_value", 1);
		} else if (status == 3) {

			session.setAttribute("isPassed_value", -1);
		} else {

		}

		if ((status == 1 || status == 2 || status == 3)
				&& (Integer.parseInt(request.getParameter("check_file"))) == 2) {
			session.setAttribute("page_refresh", "yes");
%>
<jsp:forward page="check">
	<jsp:param name="id" value="${ param.otp }  " />
</jsp:forward>
<%
	} else {
%>
<jsp:forward page="check">
	<jsp:param name="id"
		value=" ${ sessionScope.vehicle_unique_id_matched }" />
</jsp:forward>
<%
	}
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^STATUS : " + status);
%>



<%
	}
%>
