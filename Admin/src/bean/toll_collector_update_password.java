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
import javax.swing.border.EmptyBorder;
import java.math.BigInteger; 
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException;

import org.omg.PortableServer._ServantActivatorStub;

/**
 * Servlet implementation class toll_collector_update_password
 */
public class toll_collector_update_password extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public toll_collector_update_password() {
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
		String current_password = (String) request.getParameter("current_password");
		String new_password = (String) request.getParameter("new_password");

		boolean status = false;
		try {
			Connection con = ConnectionProvider.getCon();
			ResultSet rs = null;
			PreparedStatement ps = null;

			ps = con.prepareStatement("select * from toll_collector where email_id=? and password=?");
			// System.out.println(emailid + " ===========> " + password);
			ps.setString(1, (String) session.getAttribute("toll_collector"));
			
			
			
			
			
			ps.setString(2, getMd5(current_password));

			rs = ps.executeQuery();
			status = rs.next();
			System.out.println("STATUS :"+status);
			if (status) {
				String query = "";
				// , , , ,,, , , , ,,
				ps = con.prepareStatement("update toll_collector set password=? where email_id=?");
				System.out.println("a");
				ps.setString(1, getMd5(new_password));
				System.out.println("b");
				ps.setString(2, (String) session.getAttribute("toll_collector"));
				System.out.println("c");
				ps.executeUpdate();
				System.out.println("d");
				System.out.println("PASSWORD CHANGE SUCCESSFULLY !!!");

				request.getRequestDispatcher("toll_collector_password_change_successfully.jsp").forward(request,
						response);
			} else {
				request.getRequestDispatcher("toll_current_password_not_matched.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
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
