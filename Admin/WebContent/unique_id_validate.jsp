<%@page import="bean.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>unique_id_validate</title>
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
		<b>unique_id_validate</b>
	<%
		Connection con = ConnectionProvider.getCon();
		ResultSet rs = null;
		PreparedStatement ps = null;
		Statement stmt = null;
		boolean status = false;
		String id = (String) session.getAttribute("vehicle_unique_id_matched");
		//	String toll_plaza_id = (String) session.getAttribute("toll_id");

		ps = con.prepareStatement("select * from transaction where otp=? and isValid=1 and status=1");
		//System.out.println(bean.getId() + " ===========> " + bean.getPassword());
		ps.setInt(1, Integer.parseInt(id));
		//ps.setInt(2, Integer.parseInt(toll_plaza_id));

		rs = ps.executeQuery();
		status = rs.next();

		if (status) {
			int isReturn = rs.getInt(10);
			int isPassed = rs.getInt(13);

			if (isReturn == 0 && isPassed == 0) {

				stmt = con.createStatement();
				String sql = "UPDATE transaction " + "SET isPassed = -1 WHERE otp=" + Integer.parseInt(id);
				stmt.executeUpdate(sql);

				// extract all the records
				// to see the updated records
				sql = "SELECT transaction_id, vehicle_no, isPassed FROM transaction";
				rs = stmt.executeQuery(sql);

				//while (rs.next()) {
				//Retrieve by column name
				rs.next();
				int transaction_id = rs.getInt("transaction_id");
				String vehicle_no = rs.getString("vehicle_no");
				int isPased = rs.getInt("isPassed");

				//Display values
				System.out.print("transaction_id: " + id);

				System.out.print(", vehicle_no: " + vehicle_no);
				System.out.println(", isPassed: " + isPased);
				out.println("<br>STATUS UPDATED : -1");
				out.println(" <script>alert('STATUS UPDATED : -1');</script>");
				//}

				// -1
			} else if (isReturn == 1 && isPassed == 0) {

				stmt = con.createStatement();
				String sql = "UPDATE transaction " + "SET isPassed = 1 WHERE otp=" + Integer.parseInt(id);
				stmt.executeUpdate(sql);

				// extract all the records
				// to see the updated records
				sql = "SELECT transaction_id, vehicle_no, isPassed FROM transaction";
				rs = stmt.executeQuery(sql);
				rs.next();
				//while (rs.next()) {
				//Retrieve by column name
				int transaction_id = rs.getInt("transaction_id");
				String vehicle_no = rs.getString("vehicle_no");
				int isPased = rs.getInt("isPassed");

				//Display values
				System.out.print("transaction_id: " + id);

				System.out.print(", vehicle_no: " + vehicle_no);
				System.out.println(", isPassed: " + isPased);
				out.println("<br>STATUS UPDATED : 1 ");
				out.println(" <script>alert('STATUS UPDATED : 1');</script>");
				//}
				// 1

			} else if (isReturn == 1 && isPassed == 1) {

				stmt = con.createStatement();
				String sql = "UPDATE transaction " + "SET isPassed = -1 WHERE otp=" + Integer.parseInt(id);
				stmt.executeUpdate(sql);

				// extract all the records
				// to see the updated records
				sql = "SELECT transaction_id, vehicle_no, isPassed FROM transaction";
				rs = stmt.executeQuery(sql);

				//while (rs.next()) {
				//Retrieve by column name
				rs.next();
				int transaction_id = rs.getInt("transaction_id");
				String vehicle_no = rs.getString("vehicle_no");
				int isPased = rs.getInt("isPassed");

				//Display values
				System.out.print("transaction_id: " + id);

				System.out.print(", vehicle_no: " + vehicle_no);
				System.out.println(", isPassed: " + isPased);

				out.println("<br>STATUS UPDATED : -1");
				out.println(" <script>alert('STATUS UPDATED : -1');</script>");
				//}
				// -1

			} else if ((isReturn == 1 || isReturn == 0) && isPassed == -1) {
				//out.println("<br>expired !!!!!!<br><br>");
				out.println(" <script>alert('Expired !!!');</script>");
				// not valid

			} else {

				out.println(" UNIQUE_ID_VALIDATE : else part");
			}
			//out.println(" <script>alert('Success !!!');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("toll_collector_home_page.jsp");
			rd.include(request, response);

		} else {

			out.println("<br>*** NOT VALID ***");
			out.println(" <script>alert('*** NOT VALID ***');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("toll_collector_home_page.jsp");
			rd.include(request, response);

		}

		//con.close();
	%>
</body>
</html>
	<%
		}
	%>
