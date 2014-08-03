/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author TOSHIBA
 * 
 */
public class NurseManagesHealthCenter {
	private int id;
	private int userId;
	private int healthCenterId;
	
	

	public NurseManagesHealthCenter() {
	}

	/**
	 * @param userId
	 * @param healthCenterId
	 */
	public NurseManagesHealthCenter(int userId, int healthCenterId) {
		super();
		this.userId = userId;
		this.healthCenterId = healthCenterId;
	}

	/**
	 * @param id
	 * @param userId
	 * @param healthCenterId
	 */
	public NurseManagesHealthCenter(int id, int userId, int healthCenterId) {
		super();
		this.id = id;
		this.userId = userId;
		this.healthCenterId = healthCenterId;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
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

	public void addNurseManagesHealthCenter() {
		try {
			String command = "insert into tbl_nurse_manages_health_center values(0,"+
			this.getUserId()+","+this.getHealthCenterId()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateNurseManagesHealthCenter(int userId,int healthInstituteId) {
		try {
			String command = "update tbl_nurse_manages_health_center set health_center_id = "+
		healthInstituteId+" where user_id = "+userId;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteNurseManagesHealthCenter() {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<NurseManagesHealthCenter> getAllNurseManagesHealthCenters() {
		List<NurseManagesHealthCenter> list = new ArrayList<NurseManagesHealthCenter>();
		NurseManagesHealthCenter nurseManagesHealthCenter = null;
		try {
			String query = "select * from tbl_nurse_manages_health_center";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				nurseManagesHealthCenter = new NurseManagesHealthCenter(rSet.getInt("id"), rSet.getInt("user_id"), 
						rSet.getInt("health_center_id"));
				list.add(nurseManagesHealthCenter);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static NurseManagesHealthCenter getNurseManagesHealthCenter(int id) {
		NurseManagesHealthCenter nurseManagesHealthCenter = null;
		try {
			String query = "select * from tbl_nurse_manages_health_center where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				nurseManagesHealthCenter = new NurseManagesHealthCenter(rSet.getInt("id"), rSet.getInt("user_id"), 
						rSet.getInt("health_center_id"));
				//list.add(nurseManagesHealthCenter);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return nurseManagesHealthCenter;
	}
	
	public static NurseManagesHealthCenter getNurseManagesHealthCenterForThisUser(int userId){
		NurseManagesHealthCenter nurseManagesHealthCenter = null;
		try {
			String query = "select * from tbl_nurse_manages_health_center where user_id = "+userId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				nurseManagesHealthCenter = new NurseManagesHealthCenter(rSet.getInt("id"), rSet.getInt("user_id"), 
						rSet.getInt("health_center_id"));
				//list.add(nurseManagesHealthCenter);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return nurseManagesHealthCenter;
	}
}// end class
