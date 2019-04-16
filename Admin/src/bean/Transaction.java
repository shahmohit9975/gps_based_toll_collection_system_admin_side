package bean;

import java.sql.Date;
import java.sql.Time;

public class Transaction {

	private int transaction_id;
	private String vehicle_no;
	private Date transaction_date;
	private Time transaction_time;
	private String isReturn;
	private String isValid;
	private int otp;
	private String isPassed;

	public int getTransaction_id() {
		return transaction_id;
	}

	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
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

	public String getIsReturn() {
		return isReturn;
	}

	public void setIsReturn(int isReturn) {
		if (isReturn == 1) {

			this.isReturn = "YES";
		} else {
			this.isReturn = "NO";

		}
	}

	public String getIsValid() {
		return isValid;
	}

	public void setIsValid(int isValid) {
		if (isValid == 1) {

			this.isValid = "YES";
		} else {
			this.isValid = "NO";

		}

	}

	public int getOtp() {
		return otp;
	}

	public void setOtp(int otp) {
		this.otp = otp;
	}

	public String getIsPassed() {
		return isPassed;
	}

	public void setIsPassed(int isPassed) {
		if (isPassed == 0)
			this.isPassed = "Not Passed Yet";			
		else if (isPassed == 1)
			
			this.isPassed = "Single Time Passed";
		else
			this.isPassed = "Passed With Return";
		
		
	}

}
