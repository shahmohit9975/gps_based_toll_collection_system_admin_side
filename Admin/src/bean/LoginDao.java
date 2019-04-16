package bean;

import java.sql.*;



public class LoginDao {

	public static int validate(LoginBean bean, String user_type) {
		boolean status = false;

		
		try {
			Connection con = ConnectionProvider.getCon();
			ResultSet rs = null;
			PreparedStatement ps = null;

			if (user_type.equals("toll_collector")) {

				ps = con.prepareStatement("select * from toll_collector where email_id=? and password=?");
				System.out.println(bean.getId() + " ===========> " + bean.getPassword());
				ps.setString(1, bean.getId());
				ps.setString(2, bean.getPassword());

				rs = ps.executeQuery();
				status = rs.next();
				
				
				
				if (status) {
					//con.close();
				
					return 2;
				}

			} else {

				ps = con.prepareStatement("select * from main_admin where email_id=? and password=?");
				System.out.println(bean.getId() + " -------> " + bean.getPassword());
				ps.setString(1, bean.getId());
				ps.setString(2, bean.getPassword());

				rs = ps.executeQuery();
				status = rs.next();
				if (status) {

					//con.close();

					return 1;
				}
			}

			// HttpSession session=request.getSession();
			// session.setAttribute("uname",n);
			//con.close();

		} catch (Exception e) {
			System.out.println("Exception in LoginDao : " + e.getMessage());
		}
		
		return 0;

	}
}
