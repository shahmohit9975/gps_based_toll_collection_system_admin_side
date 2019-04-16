package bean;

import java.sql.Date;
import java.sql.Time;

public class User {

	private int transaction_id;
	private String vehicle_no;
	private int toll_plaza_id;
	private Date transaction_date;
	private Time transaction_time;
	private int status;
	private String isreturn;
	private int otp;
	private String isPassed;
	
	public String getIsPassed() {
		return isPassed;
	}

	public void setIsPassed(String isPassed) {
		this.isPassed = isPassed;
	}

	public int getTransaction_id() {
		return transaction_id;
	}

	public int getToll_plaza_id() {
		return toll_plaza_id;
	}

	public void setToll_plaza_id(int toll_plaza_id) {
		this.toll_plaza_id = toll_plaza_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}

	public int getOtp() {
		return otp;
	}

	public void setOtp(int otp) {
		this.otp = otp;
	}

	public String getVehicle_no() {
		return vehicle_no;
	}

	public void setVehicle_no(String vehicle_no) {
		this.vehicle_no = vehicle_no;
	}

	public Date getTransaction_date() {
		return transaction_date;
	}

	public void setTransaction_date(Date transaction_date) {
		this.transaction_date = transaction_date;
	}

	public Time getTransaction_time() {
		return transaction_time;
	}

	public void setTransaction_time(Time transaction_time) {
		this.transaction_time = transaction_time;
	}

	public String getIsreturn() {
		return isreturn;
	}

	public void setIsreturn(String isreturn) {
		this.isreturn = isreturn;
	}


	// PreparedStatement ps=con.prepareStatement("select tran.transaction_id,
	// tran.otp,
	// tran.vehicle_no,tran.transaction_date,tran.transaction_time,tran.isreturn
	// from transaction as tran join main_admin as main_ad
	// on(tran.toll_plaza_id=main_ad.toll_plaza_id) join toll_collector as toll_col
	// on(main_ad.email_id=toll_col.admin_email_id) WHERE toll_col.email_id=?");
	// ResultSet rs=ps.executeQuery();
	// while(rs.next()){
	//
	//
	// out.println("<br>" + rs.getInt(1) + "\t" + rs.getInt(2) + "\t" +
	// rs.getString(3) + "\t" + rs.getDate(4)
	// + "\t" + rs.getTime(5) + "\t" + rs.getInt(6) + "\t");

}
