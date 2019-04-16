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

import java.math.BigInteger; 
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException; 

/**
 * Servlet implementation class toll_authority_reset_password
 */
public class toll_authority_reset_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public toll_authority_reset_password() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String reset_password = (String) request.getParameter("reset_password");
		try {
			Connection con = ConnectionProvider.getCon();
			ResultSet rs = null;
			PreparedStatement ps = null;
			ps = con.prepareStatement("update toll_collector set password=? where email_id=?");
			String hashing_reset_password=getMd5(reset_password);
			System.out.println("reset pass= "+hashing_reset_password +"email_id = "+(String) session.getAttribute("email_id_for_show_password"));
			ps.setString(1,hashing_reset_password );
			ps.setString(2, (String) session.getAttribute("email_id_for_show_password"));
//			System.out.println("c");
			ps.executeUpdate();
//			System.out.println("d");
			System.out.println("PASSWORD RESET SUCCESSFULLY !!!");
			request.getRequestDispatcher("reset_password_successfully.jsp").forward(request,
					response);
			
		}
		catch (Exception e) {
			System.out.println("EXCEPTION IN TOLL AUTHORITY RESET PASSWORD");
			System.out.println("msg : "+e.getMessage());
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
