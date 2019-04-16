package bean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

	public static Connection getConnection() {
		Connection con = null;
		try {

			con = ConnectionProvider.getCon();
		} catch (Exception e) {
			System.out.println("********************USER DAO ERROR******************");
			System.out.println(e.getMessage());
		}

		return con;
	}

	public static List<Toll> get_All_Toll_Details(String main_admin_emailid) {
		List<Toll> list = new ArrayList<Toll>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select two_wheeler_one, four_wheeler_one, 	six_wheeler_one, bus_one,truck_one,HCM_one,	two_wheeler_return,	four_wheeler_return	,	six_wheeler_return,	bus_return,truck_return,HCM_return from toll join main_admin on (toll.toll_plaza_id=main_admin.toll_plaza_id) where main_admin.email_id=?");
			ps.setString(1, main_admin_emailid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				Toll t = new Toll();

				t.setTwo_one(rs.getInt(1));
				t.setFour_one(rs.getInt(2));
				t.setSix_one(rs.getInt(3));
				t.setBus_one(rs.getInt(4));
				t.setTruck_one(rs.getInt(5));
				t.setHcm_one(rs.getInt(6));
				t.setTwo_return(rs.getInt(7));
				t.setFour_return(rs.getInt(8));
				t.setSix_return(rs.getInt(9));
				t.setBus_return(rs.getInt(10));
				t.setTruck_return(rs.getInt(11));
				t.setHcm_return(rs.getInt(12));

				list.add(t);
			}
		} catch (Exception e) {
			System.out.println("******ERROR [ USER DAO  ] GET ALL get_All_Toll_Details ********* ");
			System.out.println("msg : " + e.getMessage());
		}

		return list;

	}

	public static List<toll_collector> getAllRecords_of_toll_collector(String main_admin) {

		List<toll_collector> list = new ArrayList<toll_collector>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select email_id,password,name,contact_no from toll_collector where admin_email_id=?");
			ps.setString(1, main_admin);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				toll_collector u = new toll_collector();
				u.setEmail_id(rs.getString(1));
				u.setPassword(rs.getString(2));
				u.setName(rs.getString(3));
				u.setContact_no(rs.getLong(4));
				// u.setVehicle_no(rs.getString(2));
				// u.setToll_plaza_id(rs.getInt(3));
				// u.setTransaction_date(rs.getDate(4));
				// u.setTransaction_time(rs.getTime(5));
				// u.setStatus(rs.getInt(6));
				// u.setIsreturn(rs.getInt(7));
				// u.setOtp(rs.getInt(8));
				// u.setIsPassed(rs.getInt(9));

				list.add(u);
			}
		} catch (Exception e) {
			System.out.println("******ERROR [ USER DAO  ] GET ALL RECORDS OF TOLL COLLECTOR ********* ");
			System.out.println(e.getMessage());
		}
		return list;

	}

	public static List<User> getAllRecords(String toll_collector) {
		List<User> list = new ArrayList<User>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select tran.transaction_id, tran.vehicle_no, tran.transaction_date,tran.transaction_time,tran.isreturn,tran.otp,tran.isPassed  from toll_collector as tc join main_admin as ma on (tc.admin_email_id=ma.email_id) join transaction as tran on (ma.toll_plaza_id=tran.toll_plaza_id) where tc.email_id=? and tran.isPassed!=-1 order by tran.transaction_date,tran.transaction_time");
			ps.setString(1, toll_collector);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				User u = new User();
				u.setTransaction_id(rs.getInt(1));
				u.setVehicle_no(rs.getString(2));
				// u.setToll_plaza_id(rs.getInt(3));
				u.setTransaction_date(rs.getDate(3));
				u.setTransaction_time(rs.getTime(4));
				// u.setStatus(rs.getInt(6));
				if (rs.getInt(5) == 1)
					u.setIsreturn("Yes");
				else
					u.setIsreturn("No");

				u.setOtp(rs.getInt(6));

				if (rs.getInt(7) == 0)
					u.setIsPassed("Not Passed Yet");
				else if (rs.getInt(7) == 1)
					u.setIsPassed("Single Time Passed");
				else
					u.setIsPassed("Passed With Return");

				list.add(u);
			}
		} catch (Exception e) {
			System.out.println("******ERROR [ USER DAO  ] GET ALL RECORDS IFRAME********* ");
			System.out.println(e.getMessage());
		}
		return list;
	}

	public static int update_isPassed(User u, int isReturn_value, int isPassed_value) {

		Connection con = null;
		Statement stmt = null;
		try {
			con = getConnection();
		} catch (Exception e) {
			System.out.println("USER DAO ERROR : update_isPassed ");
			System.out.println("msg : " + e.getMessage());
		}

		if (isPassed_value == 0 && isReturn_value == 0) {
			String sql = "UPDATE transaction " + "SET isPassed = -1 WHERE otp=" + u.getOtp();
			try {
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				return 1;
			} catch (SQLException e) {

				System.out.println("USER DAO ERROR : update_isPassed ");
				System.out.println("isPassed_value == 0 && isReturn_value == 0 msg : " + e.getMessage());
			}

			// -1
		} else if (isPassed_value == 0 && isReturn_value == 1) {
			String sql = "UPDATE transaction " + "SET isPassed = 1 WHERE otp=" + u.getOtp();
			try {
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				return 2;
			} catch (SQLException e) {

				System.out.println("USER DAO ERROR : update_isPassed ");
				System.out.println("isPassed_value == 0 && isReturn_value == 1 msg : " + e.getMessage());
			}

			// 1
		} else if (isPassed_value == 1 && isReturn_value == 1) {
			String sql = "UPDATE transaction " + "SET isPassed = -1 WHERE otp=" + u.getOtp();
			try {
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				return 3;
			} catch (SQLException e) {

				System.out.println("USER DAO ERROR : update_isPassed ");
				System.out.println("isPassed_value == 1 && isReturn_value == 1 msg : " + e.getMessage());
			}

			// -1
		} else if (isPassed_value == -1 && isReturn_value == 1) {

			return 1;
			// -1
		} else {
			return 0;
		}

		// try{
		// Connection con=getConnection();
		// PreparedStatement ps=con.prepareStatement("delete from register where id=?");
		// ps.setInt(1,u.getOtp());
		// status=ps.executeUpdate();
		// }catch(Exception e){System.out.println(e);}

		return 0;
	}
}
