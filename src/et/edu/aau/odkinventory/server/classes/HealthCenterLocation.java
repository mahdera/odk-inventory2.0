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
public class HealthCenterLocation {
	private int id;
	private String woreda;
	private String kebele;
	private String gote;
	private String googleMap;
	private int healthCenterId;
	
	
	
	public HealthCenterLocation() {
	}
	/**
	 * @param woreda
	 * @param kebele
	 * @param gote
	 * @param googleMap
	 * @param healthCenterId
	 */
	public HealthCenterLocation(String woreda, String kebele, String gote,
			String googleMap, int healthCenterId) {
		super();
		this.woreda = woreda;
		this.kebele = kebele;
		this.gote = gote;
		this.googleMap = googleMap;
		this.healthCenterId = healthCenterId;
	}
	/**
	 * @param id
	 * @param woreda
	 * @param kebele
	 * @param gote
	 * @param googleMap
	 * @param healthCenterId
	 */
	public HealthCenterLocation(int id, String woreda, String kebele,
			String gote, String googleMap, int healthCenterId) {
		super();
		this.id = id;
		this.woreda = woreda;
		this.kebele = kebele;
		this.gote = gote;
		this.googleMap = googleMap;
		this.healthCenterId = healthCenterId;
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
	 * @return the woreda
	 */
	public String getWoreda() {
		return woreda;
	}
	/**
	 * @param woreda the woreda to set
	 */
	public void setWoreda(String woreda) {
		this.woreda = woreda;
	}
	/**
	 * @return the kebele
	 */
	public String getKebele() {
		return kebele;
	}
	/**
	 * @param kebele the kebele to set
	 */
	public void setKebele(String kebele) {
		this.kebele = kebele;
	}
	/**
	 * @return the gote
	 */
	public String getGote() {
		return gote;
	}
	/**
	 * @param gote the gote to set
	 */
	public void setGote(String gote) {
		this.gote = gote;
	}
	/**
	 * @return the googleMap
	 */
	public String getGoogleMap() {
		return googleMap;
	}
	/**
	 * @param googleMap the googleMap to set
	 */
	public void setGoogleMap(String googleMap) {
		this.googleMap = googleMap;
	}
	/**
	 * @return the healthCenterId
	 */
	public int getHealthCenterId() {
		return healthCenterId;
	}
	/**
	 * @param healthCenterId the healthCenterId to set
	 */
	public void setHealthCenterId(int healthCenterId) {
		this.healthCenterId = healthCenterId;
	}
	
	public void addHealthCenterLocation(){
		try {
			String command = "insert into tbl_health_center_location values(0,'"+
			this.getWoreda()+"','"+this.getKebele()+"','"+this.getGote()+"','"+
			this.getGoogleMap()+"',"+this.getHealthCenterId()+")";
			System.out.println(command);
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateHealthCenterLocationForThisHealthCenter(int healthCenterId,String woreda,
			String kebele,String gote,String googleMap){
		try {
			String command = "update tbl_health_center_location set woreda='"+woreda+"', kebele='"+
			kebele+"', gote='"+gote+"', google_map='"+googleMap+"' where health_center_id = "+healthCenterId;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateHealthCenterLocation(int id,String woreda,String kebele,String gote,
			String googleMap,int healthCenterId){
		try {
			String command = "update tbl_health_center_location set woreda='"+woreda+"', kebele='"+
			kebele+"', gote='"+gote+"', google_map='"+googleMap+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteHealthCenterLocation(int id){
		try {
			String command = "delete from tbl_health_center_location where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<HealthCenterLocation> getAllHealthCenterLocations(){
		List<HealthCenterLocation> list  = new ArrayList<HealthCenterLocation>();
		HealthCenterLocation healthCenterLocation = null;
		try {
			String query = "select * from tbl_health_center_location";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthCenterLocation = new HealthCenterLocation(rSet.getInt("id"),
						rSet.getString("woreda"), rSet.getString("kebele"), rSet.getString("gote"), 
						rSet.getString("google_map"), rSet.getInt("health_center_id"));
				list.add(healthCenterLocation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static HealthCenterLocation getHealthCenterLocation(int id){
		HealthCenterLocation healthCenterLocation = null;
		try {
			String query = "select * from tbl_health_center_location where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthCenterLocation = new HealthCenterLocation(rSet.getInt("id"),
						rSet.getString("woreda"), rSet.getString("kebele"), rSet.getString("gote"), 
						rSet.getString("google_map"), rSet.getInt("health_center_id"));
				//list.add(healthCenterLocation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return healthCenterLocation;
	}
	
	public static HealthCenterLocation getHealthCenterLocationForThisHealthCenter(int healthCenterId){
		HealthCenterLocation healthCenterLocation = null;
		try {
			String query = "select * from tbl_health_center_location where health_center_id = "+healthCenterId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthCenterLocation = new HealthCenterLocation(rSet.getInt("id"),
						rSet.getString("woreda"), rSet.getString("kebele"), rSet.getString("gote"), 
						rSet.getString("google_map"), rSet.getInt("health_center_id"));
				//list.add(healthCenterLocation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return healthCenterLocation;
	}
}//end class
