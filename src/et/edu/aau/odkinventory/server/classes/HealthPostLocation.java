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
public class HealthPostLocation {
	private int id;
	private String woreda;
	private String kebele;
	private String gote;
	private String googleMap;
	private int healthPostId;
	/**
	 * @param woreda
	 * @param kebele
	 * @param gote
	 * @param googleMap
	 * @param healthPostId
	 */
	public HealthPostLocation(String woreda, String kebele, String gote,
			String googleMap, int healthPostId) {
		super();
		this.woreda = woreda;
		this.kebele = kebele;
		this.gote = gote;
		this.googleMap = googleMap;
		this.healthPostId = healthPostId;
	}
	/**
	 * @param id
	 * @param woreda
	 * @param kebele
	 * @param gote
	 * @param googleMap
	 * @param healthPostId
	 */
	public HealthPostLocation(int id, String woreda, String kebele,
			String gote, String googleMap, int healthPostId) {
		super();
		this.id = id;
		this.woreda = woreda;
		this.kebele = kebele;
		this.gote = gote;
		this.googleMap = googleMap;
		this.healthPostId = healthPostId;
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
	 * @return the healthPostId
	 */
	public int getHealthPostId() {
		return healthPostId;
	}
	/**
	 * @param healthPostId the healthPostId to set
	 */
	public void setHealthPostId(int healthPostId) {
		this.healthPostId = healthPostId;
	}
	
	public void addHealthPostLocation(){
		try {
			String command = "insert into tbl_health_post_location values(0,'"+this.getWoreda()+"','"+
			this.getKebele()+"','"+this.getGote()+"','"+this.getGoogleMap()+"',"+this.getHealthPostId()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateHealthPostLocation(int id,String woreda,String kebele,String gote,
			String googleMap,int healthCenterId){
		try {
			String command = "update tbl_health_post_location set woreda='"+woreda+"', kebele='"+
			kebele+"', gote='"+gote+"', google_map='"+googleMap+"', health_center_id="+healthCenterId+" where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateHealthPostLocationOfThisHealthPost(int healthPostId,String woreda,String kebele,String gote){
		try {
			String command = "update tbl_health_post_location set woreda='"+woreda+"', kebele='"+
			kebele+"', gote='"+gote+"' where health_post_id = "+healthPostId;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteHealthPostLocation(int id){
		try {
			String command = "delete from tbl_health_post_location where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<HealthPostLocation> getAllHealthPostLocations(){
		List<HealthPostLocation> list = new ArrayList<HealthPostLocation>();
		HealthPostLocation healthPostLocation = null;
		try {
			String query = "select * from tbl_health_post_location";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthPostLocation = new HealthPostLocation(rSet.getInt("id"), 
						rSet.getString("woreda"), rSet.getString("kebele"), rSet.getString("gote"), 
						rSet.getString("google_map"), rSet.getInt("health_post_id"));
				list.add(healthPostLocation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static HealthPostLocation getHealthPostLocation(int id){
		HealthPostLocation healthPostLocation = null;
		try {
			String query = "select * from tbl_health_post_location where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthPostLocation = new HealthPostLocation(rSet.getInt("id"), 
						rSet.getString("woreda"), rSet.getString("kebele"), rSet.getString("gote"), 
						rSet.getString("google_map"), rSet.getInt("health_post_id"));
				//list.add(healthPostLocation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return healthPostLocation;
	}
	
	public static HealthPostLocation getHealthPostLocationForThisHealthPost(int healthPostId){
		HealthPostLocation healthPostLocation = null;
		try {
			String query = "select * from tbl_health_post_location where health_post_id = "+healthPostId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthPostLocation = new HealthPostLocation(rSet.getInt("id"), 
						rSet.getString("woreda"), rSet.getString("kebele"), rSet.getString("gote"), 
						rSet.getString("google_map"), rSet.getInt("health_post_id"));
				//list.add(healthPostLocation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return healthPostLocation;
	}
}//end class
