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
 * Servlet implementation class check
 */
public class check extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public check() {
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

		try {
			Connection con = ConnectionProvider.getCon();
			ResultSet rs = null;
			PreparedStatement ps = null;
			// String toll_id = request.getParameter("toll_id");
			String id = request.getParameter("id");
			id = id.replaceAll("\\s", ""); 
			HttpSession session = request.getSession();
			// session.setAttribute("toll_id",toll_id);

			try {
				
				Integer.parseInt(id);

			} catch (NumberFormatException e) {
				PrintWriter out = response.getWriter();
				// out.println("<html><head><script>alert('Enter Id in Digit Format
				// !!!');</script></head></html>");
				System.out.println("******************* string_id_entered.jsp id : " + id);
				RequestDispatcher rd = request.getRequestDispatcher("string_id_entered.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				PrintWriter out = response.getWriter();
				// out.println("<html><head><script>alert('Enter Id in Digit Format
				// !!!');</script></head></html>");
				RequestDispatcher rd = request.getRequestDispatcher("string_id_entered.jsp");
				rd.forward(request, response);

			}
			boolean status = false;
			if (id != null) {

				ps = con.prepareStatement("select * from transaction where otp=?");
				System.out.println(" id : " + id);
				ps.setInt(1, Integer.parseInt(id));
				rs = ps.executeQuery();

				status = rs.next();
				if (status) {

					session.setAttribute("vehicle_unique_id_matched", id);
					//session.setAttribute("display_original_receipt", "yes");
					
					

					RequestDispatcher rd = request.getRequestDispatcher("before_unique_id_validate.jsp");
					rd.forward(request, response);
//					RequestDispatcher rd = request.getRequestDispatcher("unique_id_validate.jsp");
//					rd.forward(request, response);
				} else {
					// HttpSession session = request.getSession();
					session.setAttribute("vehicle_unique_id_not_matched", id);

					RequestDispatcher rd = request.getRequestDispatcher("unique_id_not_validate.jsp");
					rd.forward(request, response);
				}

			}

			// HttpSession session=request.getSession();
			// session.setAttribute("uname",n);
			// con.close();

		} catch (Exception e) {
			System.out.println("Exception in CHECK SERVLET : " + e.getMessage());
		}

	}

}
