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
public class HealthCenter {
	private int id;
	private String healthCenterName;
	private String description;
	/**
	 * @param healthCenterName
	 * @param description
	 */
	public HealthCenter(String healthCenterName, String description) {
		super();
		this.healthCenterName = healthCenterName;
		this.description = description;
	}
	/**
	 * @param id
	 * @param healthCenterName
	 * @param description
	 */
	public HealthCenter(int id, String healthCenterName, String description) {
		super();
		this.id = id;
		this.healthCenterName = healthCenterName;
		this.description = description;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the healthCenterName
	 */
	public String getHealthCenterName() {
		return healthCenterName;
	}
	/**
	 * @param healthCenterName the healthCenterName to set
	 */
	public void setHealthCenterName(String healthCenterName) {
		this.healthCenterName = healthCenterName;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	public void addHealthCenter(){
		try {
			String command = "insert into tbl_health_center values(0,'"+this.getHealthCenterName()+"','"+
			this.getDescription()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateHealthCenter(int id,String healthCenterName,String description){
		try {
			String command = "update tbl_health_center set health_center_name='"+healthCenterName+"', description='"+
			description+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteHealthCenter(int id){
		try {
			String command = "delete from tbl_health_center where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<HealthCenter> getAllHealthCenters(){
		List<HealthCenter> list = new ArrayList<HealthCenter>();
		HealthCenter healthCenter = null;
		try {
			String query = "select * from tbl_health_center order by health_center_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthCenter = new HealthCenter(rSet.getInt("id"), rSet.getString("health_center_name"), rSet.getString("description"));
				list.add(healthCenter);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static HealthCenter getHealthCenter(int id){
		HealthCenter healthCenter = null;
		try {
			String query = "select * from tbl_health_center where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthCenter = new HealthCenter(rSet.getInt("id"), rSet.getString("health_center_name"), rSet.getString("description"));
				//list.add(healthCenter);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return healthCenter;
	}
	
	public static HealthCenter fetchHealthCenterUsing(String healthCenterName,String description){
		HealthCenter healthCenter = null;
		try {
			String query = "select * from tbl_health_center where health_center_name = '"+healthCenterName+"' and description='"+description+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthCenter = new HealthCenter(rSet.getInt("id"), rSet.getString("health_center_name"), rSet.getString("description"));
				//list.add(healthCenter);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return healthCenter;
	}
}//end class
