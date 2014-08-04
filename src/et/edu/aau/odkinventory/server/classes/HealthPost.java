package et.edu.aau.odkinventory.server.classes;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HealthPost {
	private int id;
	private String healthPostName;
	private String description;
	private int healthCenterId;
	
	public HealthPost(){
		
	}
	
	/**
	 * @param healthPostName
	 * @param description
	 * @param healthCenterId
	 */
	public HealthPost(String healthPostName, String description,
			int healthCenterId) {
		super();
		this.healthPostName = healthPostName;
		this.description = description;
		this.healthCenterId = healthCenterId;
	}
	/**
	 * @param id
	 * @param healthPostName
	 * @param description
	 * @param healthCenterId
	 */
	public HealthPost(int id, String healthPostName, String description,
			int healthCenterId) {
		super();
		this.id = id;
		this.healthPostName = healthPostName;
		this.description = description;
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
	 * @return the healthPostName
	 */
	public String getHealthPostName() {
		return healthPostName;
	}
	/**
	 * @param healthPostName the healthPostName to set
	 */
	public void setHealthPostName(String healthPostName) {
		this.healthPostName = healthPostName;
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
	
	public void addHealthPost(){
		try {
			String command = "insert into tbl_health_post values(0,'"+this.getHealthPostName()+"','"+
			this.getDescription()+"',"+this.getHealthCenterId()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateHealthPost(int id,String healthPostName,String description,int healthCenterId,
			String googleMapLocation){
		try {
			String command = "update tbl_health_post set health_post_name='"+healthPostName+"', description='"+
			description+"', health_center_id="+healthCenterId+", google_map_location='"+googleMapLocation+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteHealthPost(int id){
		try {
			String command = "delete from tbl_health_post where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<HealthPost> getAllHealthPosts(){
		List<HealthPost> list = new ArrayList<HealthPost>();
		HealthPost healthPost = null;
		try {
			String query = "select * from tbl_health_post order by health_post_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthPost = new HealthPost(rSet.getInt("id"), rSet.getString("health_post_name"), 
						rSet.getString("description"), rSet.getInt("health_center_id"));
				list.add(healthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<HealthPost> getAllHealthPostWithThisId(int healthPostId){
		List<HealthPost> list = new ArrayList<HealthPost>();
		HealthPost healthPost = null;
		try {
			String query = "select * from tbl_health_post where id = "+healthPostId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthPost = new HealthPost(rSet.getInt("id"), rSet.getString("health_post_name"), 
						rSet.getString("description"), rSet.getInt("health_center_id"));
				list.add(healthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<HealthPost> getAllHealthPostsUnderThisHealthCenter(int healthCenterId){
		List<HealthPost> list = new ArrayList<HealthPost>();
		HealthPost healthPost = null;
		try {
			String query = "select * from tbl_health_post where health_center_id = "+healthCenterId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthPost = new HealthPost(rSet.getInt("id"), rSet.getString("health_post_name"), 
						rSet.getString("description"), rSet.getInt("health_center_id"));
				list.add(healthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static HealthPost getHealthPost(int id){
		HealthPost healthPost = null;
		try {
			String query = "select * from tbl_health_post where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				healthPost = new HealthPost(rSet.getInt("id"), rSet.getString("health_post_name"), 
						rSet.getString("description"), rSet.getInt("health_center_id"));
				//list.add(healthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return healthPost;
	}
	
	public static HealthPost fetchHealthPostUsing(String healthPostName,String description,int healthCenterId){
		HealthPost healthPost = null;
		try {
			String query = "select * from tbl_health_post where health_post_name='"+healthPostName+"' and "+
			"description='"+description+"' and health_center_id = "+healthCenterId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			System.out.println(query);
			while(rSet.next()){
				healthPost = new HealthPost(rSet.getInt("id"), rSet.getString("health_post_name"), 
						rSet.getString("description"), rSet.getInt("health_center_id"));
				//list.add(healthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return healthPost;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((description == null) ? 0 : description.hashCode());
		result = prime * result + healthCenterId;
		result = prime * result
				+ ((healthPostName == null) ? 0 : healthPostName.hashCode());
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HealthPost other = (HealthPost) obj;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (healthCenterId != other.healthCenterId)
			return false;
		if (healthPostName == null) {
			if (other.healthPostName != null)
				return false;
		} else if (!healthPostName.equals(other.healthPostName))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	
	
}//end class
