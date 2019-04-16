package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class get_and_update_toll_amount
 */
public class get_and_update_toll_amount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public get_and_update_toll_amount() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String two_one = request.getParameter("two_one");
		String four_one = request.getParameter("four_one");
		String six_one = request.getParameter("six_one");
		String bus_one = request.getParameter("bus_one");
		String truck_one = request.getParameter("truck_one");
		String hcm_one = request.getParameter("hcm_one");

		String two_return = request.getParameter("two_return");
		String four_return = request.getParameter("four_return");
		String six_return = request.getParameter("six_return");
		String bus_return = request.getParameter("bus_return");
		String truck_return = request.getParameter("truck_return");
		String hcm_return = request.getParameter("hcm_return");
		try {
			Integer.parseInt(two_one);
			Integer.parseInt(four_one);
			Integer.parseInt(six_one);
			Integer.parseInt(bus_one);
			Integer.parseInt(truck_one);
			Integer.parseInt(hcm_one);
			Integer.parseInt(two_return);
			Integer.parseInt(four_return);
			Integer.parseInt(six_return);
			Integer.parseInt(bus_return);
			Integer.parseInt(truck_return);
			Integer.parseInt(hcm_return);
		} catch (Exception e) {
			System.out.println("exception in get and update toll Amount : string entered");
			System.out.println("msg : " + e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("toll_amount_as_string.jsp");
			rd.forward(request, response);
		}

		try {
			Connection con = ConnectionProvider.getCon();
			ResultSet rs = null;
			PreparedStatement ps = null;

			int main_admin_toll_id = (int) session.getAttribute("main_admin_toll_id");

			String query = "update toll set two_wheeler_one = ?,four_wheeler_one=?,six_wheeler_one=?,bus_one=?,truck_one=?,HCM_one=?,two_wheeler_return=?,four_wheeler_return=?,six_wheeler_return=?,bus_return=?,truck_return=?,HCM_return=?  where toll_plaza_id= ?";
			// , , , ,,, , , , ,,
			ps = con.prepareStatement(query);
			ps.setInt(1, Integer.parseInt(two_one));
			ps.setInt(2, Integer.parseInt(four_one));
			ps.setInt(3, Integer.parseInt(six_one));
			ps.setInt(4, Integer.parseInt(bus_one));
			ps.setInt(5, Integer.parseInt(truck_one));
			ps.setInt(6, Integer.parseInt(hcm_one));
			ps.setInt(7, Integer.parseInt(two_return));
			ps.setInt(8, Integer.parseInt(four_return));
			ps.setInt(9, Integer.parseInt(six_return));
			ps.setInt(10, Integer.parseInt(bus_return));
			ps.setInt(11, Integer.parseInt(truck_return));
			ps.setInt(12, Integer.parseInt(hcm_return));
			ps.setInt(13, main_admin_toll_id);

			// execute the java preparedstatement
			ps.executeUpdate();

			// con.close();
			System.out.println("RECORD UPDATED");
			RequestDispatcher rd = request.getRequestDispatcher("toll_amount_updated_successfully.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			System.out.println("excption in get and update toll amount");

			System.out.println("msg: " + e.getMessage());
		}
	}

}
