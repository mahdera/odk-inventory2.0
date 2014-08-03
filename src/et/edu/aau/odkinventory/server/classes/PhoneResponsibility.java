/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 * 
 */
public class PhoneResponsibility {
	private long id;
	private String fullName;
	private int healthCenterId;
	private String jobDescription;
	private String phoneBrand;
	private String apparatusSerialNumber;
	private String batterySerialNumber;
	private String simPinNumber;
	private String puk1;
	private String puk2;
	private String phoneNumber;
	private Date dateGivenOn;
	private String description;

	/**
	 * @param fullName
	 * @param healthCenterId
	 * @param jobDescription
	 * @param phoneBrand
	 * @param apparatusSerialNumber
	 * @param batterySerialNumber
	 * @param simPinNumber
	 * @param phoneNumber
	 * @param dateGivenOn
	 * @param description
	 */
	public PhoneResponsibility(String fullName, int healthCenterId,
			String jobDescription, String phoneBrand,
			String apparatusSerialNumber, String batterySerialNumber,
			String simPinNumber,String puk1,String puk2, String phoneNumber, Date dateGivenOn,
			String description) {
		this.fullName = fullName;
		this.healthCenterId = healthCenterId;
		this.jobDescription = jobDescription;
		this.phoneBrand = phoneBrand;
		this.apparatusSerialNumber = apparatusSerialNumber;
		this.batterySerialNumber = batterySerialNumber;
		this.simPinNumber = simPinNumber;
		this.puk1 = puk1;
		this.puk2 = puk2;
		this.phoneNumber = phoneNumber;
		this.dateGivenOn = dateGivenOn;
		this.description = description;
	}

	/**
	 * @param id
	 * @param fullName
	 * @param healthCenterId
	 * @param jobDescription
	 * @param phoneBrand
	 * @param apparatusSerialNumber
	 * @param batterySerialNumber
	 * @param simPinNumber
	 * @param phoneNumber
	 * @param dateGivenOn
	 * @param description
	 */
	public PhoneResponsibility(long id, String fullName, int healthCenterId,
			String jobDescription, String phoneBrand,
			String apparatusSerialNumber, String batterySerialNumber,
			String simPinNumber,String puk1,String puk2, String phoneNumber, Date dateGivenOn,
			String description) {
		this.id = id;
		this.fullName = fullName;
		this.healthCenterId = healthCenterId;
		this.jobDescription = jobDescription;
		this.phoneBrand = phoneBrand;
		this.apparatusSerialNumber = apparatusSerialNumber;
		this.batterySerialNumber = batterySerialNumber;
		this.simPinNumber = simPinNumber;
		this.puk1 = puk1;
		this.puk2 = puk2;
		this.phoneNumber = phoneNumber;
		this.dateGivenOn = dateGivenOn;
		this.description = description;
	}

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName
	 *            the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * @return the healthCenterId
	 */
	public int getHealthCenterId() {
		return healthCenterId;
	}

	/**
	 * @param healthCenterId
	 *            the healthCenterId to set
	 */
	public void setHealthCenterId(int healthCenterId) {
		this.healthCenterId = healthCenterId;
	}

	/**
	 * @return the jobDescription
	 */
	public String getJobDescription() {
		return jobDescription;
	}

	/**
	 * @param jobDescription
	 *            the jobDescription to set
	 */
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	/**
	 * @return the phoneBrand
	 */
	public String getPhoneBrand() {
		return phoneBrand;
	}

	/**
	 * @param phoneBrand
	 *            the phoneBrand to set
	 */
	public void setPhoneBrand(String phoneBrand) {
		this.phoneBrand = phoneBrand;
	}

	/**
	 * @return the apparatusSerialNumber
	 */
	public String getApparatusSerialNumber() {
		return apparatusSerialNumber;
	}

	/**
	 * @param apparatusSerialNumber
	 *            the apparatusSerialNumber to set
	 */
	public void setApparatusSerialNumber(String apparatusSerialNumber) {
		this.apparatusSerialNumber = apparatusSerialNumber;
	}

	/**
	 * @return the batterySerialNumber
	 */
	public String getBatterySerialNumber() {
		return batterySerialNumber;
	}

	/**
	 * @param batterySerialNumber
	 *            the batterySerialNumber to set
	 */
	public void setBatterySerialNumber(String batterySerialNumber) {
		this.batterySerialNumber = batterySerialNumber;
	}

	/**
	 * @return the simPinNumber
	 */
	public String getSimPinNumber() {
		return simPinNumber;
	}

	/**
	 * @param simPinNumber
	 *            the simPinNumber to set
	 */
	public void setSimPinNumber(String simPinNumber) {
		this.simPinNumber = simPinNumber;
	}

	/**
	 * @return the phoneNumber
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param phoneNumber
	 *            the phoneNumber to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	/**
	 * @return the dateGivenOn
	 */
	public Date getDateGivenOn() {
		return dateGivenOn;
	}

	/**
	 * @param dateGivenOn
	 *            the dateGivenOn to set
	 */
	public void setDateGivenOn(Date dateGivenOn) {
		this.dateGivenOn = dateGivenOn;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	

	/**
	 * @return the puk1
	 */
	public String getPuk1() {
		return puk1;
	}

	/**
	 * @param puk1 the puk1 to set
	 */
	public void setPuk1(String puk1) {
		this.puk1 = puk1;
	}

	/**
	 * @return the puk2
	 */
	public String getPuk2() {
		return puk2;
	}

	/**
	 * @param puk2 the puk2 to set
	 */
	public void setPuk2(String puk2) {
		this.puk2 = puk2;
	}

	public void addPhoneResponsibility() {
		try {
			String command = "insert into tbl_phone_responsibility values(0,'"+
		this.getFullName()+"',"+this.getHealthCenterId()+",'"+this.getJobDescription()+"','"+
					this.getPhoneBrand()+"','"+this.getApparatusSerialNumber()+"','"+
		this.getBatterySerialNumber()+"','"+this.getSimPinNumber()+"','"+this.getPuk1()+"','"+this.getPuk2()+"','"+
					this.getPhoneNumber()+"','"+this.getDateGivenOn()+"','"+this.getDescription()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updatePhoneResponsibility(long id,String fullName,int healthCenterId,
			String jobDescription,String phoneBrand,String apparatusSerialNumber,
			String batterySerialNumber,String simPinNumber,String phoneNumber,
			Date dateGivenOn,String description,String puk1,String puk2) {
		try {
			String command = "update tbl_phone_responsibility set full_name='"+fullName+"', health_center_id="+
		healthCenterId+", job_description='"+jobDescription+"', phone_brand='"+
					phoneBrand+"', apparatus_serial_number='"+apparatusSerialNumber+"', battery_serial_number='"+
		batterySerialNumber+"', sim_pin_number='"+simPinNumber+"', phone_number='"+
					phoneNumber+"', date_given='"+dateGivenOn+"', description='"+
		description+"', puk1='"+puk1+"', puk2='"+puk2+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deletePhoneResponsibility(long id) {
		try {
			String command = "delete from tbl_phone_responsibility where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<PhoneResponsibility> getAllPhoneResponsibilities() {
		List<PhoneResponsibility> list = new ArrayList<PhoneResponsibility>();
		PhoneResponsibility phoneResponsibility = null;
		try {
			String query = "select * from tbl_phone_responsibility order by full_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				phoneResponsibility = new PhoneResponsibility(rSet.getLong("id"), 
						rSet.getString("full_name"), rSet.getInt("health_center_id"), 
						rSet.getString("job_description"), rSet.getString("phone_brand"), 
						rSet.getString("apparatus_serial_number"), rSet.getString("battery_serial_number"), 
						rSet.getString("sim_pin_number"),rSet.getString("puk1"),rSet.getString("puk2"),
						rSet.getString("phone_number"),	rSet.getDate("date_given"), 
						rSet.getString("description"));
				list.add(phoneResponsibility);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static PhoneResponsibility getPhoneResponsibility(long id) {
		PhoneResponsibility phoneResponsibility = null;
		try {
			String query = "select * from tbl_phone_responsibility where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				phoneResponsibility = new PhoneResponsibility(rSet.getLong("id"), 
						rSet.getString("full_name"), rSet.getInt("health_center_id"), 
						rSet.getString("job_description"), rSet.getString("phone_brand"), 
						rSet.getString("apparatus_serial_number"), rSet.getString("battery_serial_number"), 
						rSet.getString("sim_pin_number"),rSet.getString("puk1"),rSet.getString("puk2"),
						rSet.getString("phone_number"),	rSet.getDate("date_given"), 
						rSet.getString("description"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return phoneResponsibility;
	}
}// end class
