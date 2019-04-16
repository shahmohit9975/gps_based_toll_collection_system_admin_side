package bean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigInteger; 
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException; 
/**
 * Servlet implementation class login_process
 */
public class login_process extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public login_process() {
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

	//	String user_type = request.getParameter("user_type");
		String emailid = request.getParameter("id");
		String password = request.getParameter("password");
		System.out.println("in");
		boolean status = false;
		try {
			Connection con = ConnectionProvider.getCon();
			ResultSet rs = null;
			PreparedStatement ps = null;

			
			
			String hashing_password=getMd5(password);
			ps = con.prepareStatement("select * from toll_collector where email_id=? and password=?");
			System.out.println(emailid + " ===========> " + password);
			ps.setString(1, emailid);
			ps.setString(2, hashing_password);

			rs = ps.executeQuery();
			status = rs.next();

			if (status) {
				// con.close();
				session.setAttribute("toll_collector", emailid);
				System.out.println("toll collector successfully logged in");
				// response.sendRedirect("toll_collector_home_page.jsp");
				// RequestDispatcher rd =
//				Cookie ck=new Cookie("my_email_id",emailid);  
//				ck.setMaxAge(60 * 60 * 24 * 365 * 10);
//				response.addCookie(ck);  
	            
				request.getRequestDispatcher("/toll_collector_home_page.jsp").forward(request, response);

			} else {

				System.out.println("1");
				ps = con.prepareStatement("select * from main_admin where email_id=? and password=?");
				System.out.println("1");
				System.out.println(emailid + " ======	=====> " + password);
				System.out.println("1");
				ps.setString(1, emailid);
				ps.setString(2, password);

				rs = ps.executeQuery();
				status = rs.next();
				if (status) {
					// con.close();
					try {

						int main_admin_toll_id = rs.getInt(5);
						session.setAttribute("main_admin_toll_id", main_admin_toll_id);
					} catch (Exception e) {
						System.out.println("exception in login process main admin, main_admin_toll_id");
						System.out.println("msg :  " + e.getMessage());
					}
					session.setAttribute("main_admin", emailid);
					System.out.println("ADMIN successfully logged in");
					// RequestDispatcher rd =
					// request.getRequestDispatcher("/main_admin_home_page.jsp");
					// rd.forward(request, response);
					RequestDispatcher rd = request.getRequestDispatcher("manage_toll.jsp");
					rd.forward(request, response);

				} else {

					response.sendRedirect("login_error.jsp");

				}

			}
			
		} catch (Exception e) {
			System.out.println("Exception in login_process : " + e.getMessage());
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
