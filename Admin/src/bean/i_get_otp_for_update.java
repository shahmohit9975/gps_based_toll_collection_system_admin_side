package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class i_get_otp_for_update
 */
public class i_get_otp_for_update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public i_get_otp_for_update() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/hrml");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		String i_otp = (String) session.getAttribute("i_otp");
		String i_isReturn = (String) session.getAttribute("i_isReturn");
		String i_isPassed = (String) session.getAttribute("i_isPassed");

		Connection con = null;
		Statement stmt = null;
		boolean status = false;
		try {

			con = ConnectionProvider.getCon();

		} catch (Exception e) {
			System.out.println("i_get_update_java servlet ");
			System.out.println("msg : " + e.getMessage());
		}
		if (Integer.parseInt(i_isPassed) == 0 && Integer.parseInt(i_isReturn) == 0) {
			String sql = "UPDATE transaction " + "SET isPassed = -1 WHERE otp=" + Integer.parseInt(i_otp);
			try {
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				status = true;

			} catch (SQLException e) {

				System.out.println("i_get_update_java servlet ");
				System.out.println("isPassed_value == 0 && isReturn_value == 0 msg : " + e.getMessage());
			}

			// -1
		} else if (Integer.parseInt(i_isPassed) == 0 && Integer.parseInt(i_isReturn) == 1) {
			String sql = "UPDATE transaction " + "SET isPassed = 1 WHERE otp=" + Integer.parseInt(i_otp);
			try {
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				status = true;

			} catch (SQLException e) {

				System.out.println("i_get_update_java servlet");
				System.out.println("isPassed_value == 0 && isReturn_value == 1 msg : " + e.getMessage());
			}

			// 1
		} else if (Integer.parseInt(i_isPassed) == 1 && Integer.parseInt(i_isReturn) == 1) {
			String sql = "UPDATE transaction " + "SET isPassed = -1 WHERE otp=" + Integer.parseInt(i_otp);
			try {
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				status = true;

			} catch (SQLException e) {

				System.out.println("i_get_update_java servlet ");
				System.out.println("isPassed_value == 1 && isReturn_value == 1 msg : " + e.getMessage());
			}

			// -1
		} else {

		}

		if (status) {
			session.removeAttribute("i_otp");
			session.removeAttribute("i_isReturn");
			session.removeAttribute("i_isPassed");
			out.println(
					"<html><head><script>alert('USER record Updated SUCCESSFULLY !!!');</script></head><body></html>");
			System.out.println("I user otp updated");
			session.setAttribute("page_refresh", "yes");

			out.println(
					"<script src='https://cdnjs.cloudflare.com/ajaxlibs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<Script>");
			out.println("$(document).ready(function(){");
			out.println("swal('welcome','a','b');");
			out.println("});");
			out.println("</script>");

			RequestDispatcher rd = request.getRequestDispatcher("i_otp_updated_successfully.jsp");
			rd.forward(request, response);
		} else {
			session.removeAttribute("i_otp");
			session.removeAttribute("i_isReturn");
			session.removeAttribute("i_isPassed");

			System.out.println("I user otp not updated");
			RequestDispatcher rd = request.getRequestDispatcher("iframe.jsp");
			rd.forward(request, response);
		}
	}

}
