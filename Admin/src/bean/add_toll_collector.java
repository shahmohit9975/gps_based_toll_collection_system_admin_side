package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigInteger; 
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException;

/**
 * Servlet implementation class add_toll_collector
 */
public class add_toll_collector extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public add_toll_collector() {
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
		String email_id = request.getParameter("email_id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String contact_no = request.getParameter("contact_no");
		try {
			//BigInteger bi = new BigInteger(contact_no);
			Long.parseLong(contact_no);
			System.out.println("contact No :" + Long.parseLong(contact_no));
			// Integer.parseInt(contact_no);
		} catch (Exception e) {
			System.out.println("exeptin in add toll collector contact no");

			System.out.println("msg : " + e.getMessage());
			request.getRequestDispatcher("toll_contact_number_as_string.jsp").forward(request, response);

		}
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;

		String query_toll = "SELECT * FROM toll_collector where email_id='" + email_id + "'";
		String query_admin = "SELECT * FROM main_admin where email_id='" + email_id + "'";

		try {

			con = ConnectionProvider.getCon();
			Statement st = con.createStatement();

			rs = st.executeQuery(query_toll);
			boolean status = rs.next();
			if (status) {
				request.getRequestDispatcher("toll_collecotr_already_exits.jsp").forward(request, response);
			}
			status = false;
			rs = st.executeQuery(query_admin);
			status = rs.next();
			if (status) {

				request.getRequestDispatcher("id_assign_to_main_admin.jsp").forward(request, response);

			} else {
				try {

					query_toll = " insert into toll_collector" + " values (?, ?, ?, ?, ?)";
					ps = con.prepareStatement(query_toll);
					ps.setString(1, email_id);
					ps.setString(2, getMd5(password));
					
					ps.setString(3, name);
					ps.setLong(4, Long.parseLong(contact_no));
					ps.setString(5, (String) session.getAttribute("main_admin"));

					// execute the preparedstatement
					ps.execute();

					// con.close();

					request.getRequestDispatcher("toll_collecotr_add_successfully.jsp").forward(request, response);

				} catch (Exception e) {
					// TODO: handle exception
					System.out.println("exception in add toll collector servlet ");
					System.out.println("msg : " + e.getMessage());

				}

			}

		} catch (Exception e) {
			System.out.println("exception in add toll collector ===");
			System.out.println("msg : " + e.getMessage());

		}

	}
	 public static String getMd5(String input) 
	    { 
	        try { 
	  
	            // Static getInstance method is called with hashing MD5 
	            MessageDigest md = MessageDigest.getInstance("MD5"); 
	  
	            // digest() method is called to calculate message digest 
	            //  of an input digest() return array of byte 
	            byte[] messageDigest = md.digest(input.getBytes()); 
	  
	            // Convert byte array into signum representation 
	            BigInteger no = new BigInteger(1, messageDigest); 
	  
	            // Convert message digest into hex value 
	            String hashtext = no.toString(16); 
	            while (hashtext.length() < 32) { 
	                hashtext = "0" + hashtext; 
	            } 
	            return hashtext; 
	        }  
	  
	        // For specifying wrong message digest algorithms 
	        catch (NoSuchAlgorithmException e) { 
	            throw new RuntimeException(e); 
	        } 
	    } 
}
