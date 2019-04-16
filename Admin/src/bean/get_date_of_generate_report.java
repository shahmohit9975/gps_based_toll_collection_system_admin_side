package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class get_date_of_generate_report
 */
public class get_date_of_generate_report extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public get_date_of_generate_report() {
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

		String date_from = request.getParameter("date_from");
		String date_to = request.getParameter("date_to");
		String filter_type = request.getParameter("filter_type");

		Connection con = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Transaction> list = new ArrayList<Transaction>();
		try {

			con = ConnectionProvider.getCon();

		} catch (Exception e) {
			System.out.println("get_date_of_generate_report 1 servlet ");
			System.out.println("msg : " + e.getMessage());
		}
		try {
			int main_admin_toll_id = (int) session.getAttribute("main_admin_toll_id");
			String sql1 = "select * from transaction where toll_plaza_id=? and transaction_date BETWEEN   CAST('"
					+ date_from + "' AS DATE) AND  CAST('" + date_to + "' AS DATE)";
			String sql2 = "select * from transaction where toll_plaza_id=? and isPassed!=0 and transaction_date BETWEEN   CAST('"
					+ date_from + "' AS DATE) AND  CAST('" + date_to + "' AS DATE)";
			String sql3 = "select * from transaction where toll_plaza_id=? and isPassed=0 and transaction_date BETWEEN   CAST('"
					+ date_from + "' AS DATE) AND  CAST('" + date_to + "' AS DATE)";
			if (filter_type.equals("ALL")) {

				ps = con.prepareStatement(sql1);

			} else if (filter_type.equals("PASSED_VEHICLES")) {

				ps = con.prepareStatement(sql2);

			}
			// NOT_PASSED_VEHICLES
			else {

				ps = con.prepareStatement(sql3);

			}
			System.out.println(" toll_plaza id -> " + main_admin_toll_id);
			ps.setInt(1, main_admin_toll_id);

			rs = ps.executeQuery();

			while (rs.next()) {

				Transaction t = new Transaction();
				t.setTransaction_id(rs.getInt(1));
				t.setVehicle_no(rs.getString(4));
				t.setTransaction_date(rs.getDate(6));
				t.setTransaction_time(rs.getTime(7));

				t.setIsReturn(rs.getInt(10));

				t.setIsValid(rs.getInt(11));
				t.setOtp(rs.getInt(12));

				t.setIsPassed(rs.getInt(13));

				list.add(t);

			}

		} catch (Exception e) {
			System.out.println("exception in get date of generate report 2 servlet ");

			System.out.println("msg : " + e.getMessage());

		}
		session.setAttribute("print_record", list);

		request.getRequestDispatcher("generate_record_print.jsp").forward(request, response);
	}

}
