package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class toll_authority_check_password
 */
public class toll_authority_check_password extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public toll_authority_check_password() {
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
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String current_password = (String) request.getParameter("current_password");
		// String new_password = (String) request.getParameter("new_password");

		boolean status = false;
		try {
			Connection con = ConnectionProvider.getCon();
			ResultSet rs = null;
			PreparedStatement ps = null;

			ps = con.prepareStatement("select * from main_admin where email_id=? and password=?");
			// System.out.println(emailid + " ===========> " + password);
			ps.setString(1, (String) session.getAttribute("main_admin"));
			ps.setString(2, current_password);
			System.out.println(
					"email id" + (String) session.getAttribute("main_admin") + " password : " + current_password);
			rs = ps.executeQuery();
			status = rs.next();
			System.out.println("TOLL AUTHORITY PASSWORD STATUS :" + status);
			if (status) {
				// String query = "";
				// // , , , ,,, , , , ,,
				// ps = con.prepareStatement("update toll_collector set password=? where
				// email_id=?");
				// System.out.println("a");
				// ps.setString(1, "");
				// System.out.println("b");
				// ps.setString(2, (String) session.getAttribute("email_id_for_show_password"));
				// System.out.println("c");
				// ps.executeUpdate();
				// System.out.println("d");
				// System.out.println("PASSWORD CHANGE SUCCESSFULLY !!!");

				request.getRequestDispatcher("reset_toll_collector_password.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("toll_authority_password_not_matched.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
