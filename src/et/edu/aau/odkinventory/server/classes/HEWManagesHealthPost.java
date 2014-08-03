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
public class HEWManagesHealthPost {
	private int id;
	private int userId;
	private int healthPostId;

	/**
	 * @param userId
	 * @param healthPostId
	 */
	public HEWManagesHealthPost(int userId, int healthPostId) {
		super();
		this.userId = userId;
		this.healthPostId = healthPostId;
	}

	/**
	 * @param id
	 * @param userId
	 * @param healthPostId
	 */
	public HEWManagesHealthPost(int id, int userId, int healthPostId) {
		super();
		this.id = id;
		this.userId = userId;
		this.healthPostId = healthPostId;
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
	 * @return the healthPostId
	 */
	public int getHealthPostId() {
		return healthPostId;
	}

	/**
	 * @param healthPostId
	 *            the healthPostId to set
	 */
	public void setHealthPostId(int healthPostId) {
		this.healthPostId = healthPostId;
	}

	public void addHEWManagesHealthPost() {
		try {
			String command = "insert into tbl_hew_manages_health_post values(0,"+this.getUserId()+","+this.getHealthPostId()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateHEWManagesHealthPost(int userId,int healthInstituteId) {
		try {
			String command = "update tbl_hew_manages_health_post set health_post_id = "+healthInstituteId+" where user_id = "+userId;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteHEWManagesHealthPost(int id) {
		try {
			String command = "delete from tbl_hew_manages_health_post where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<HEWManagesHealthPost> getAllHEWManagesHealthPosts() {
		List<HEWManagesHealthPost> list = new ArrayList<HEWManagesHealthPost>();
		HEWManagesHealthPost hewManagesHealthPost = null;
		try {
			String query = "select * from tbl_hew_manages_health_post";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hewManagesHealthPost = new HEWManagesHealthPost(rSet.getInt("id"), rSet.getInt("user_id"), 
						rSet.getInt("health_post_id"));
				list.add(hewManagesHealthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<HEWManagesHealthPost> getAllHEWManagesHealthPostsForThisHealthPost(int healthPostId){
		List<HEWManagesHealthPost> list = new ArrayList<HEWManagesHealthPost>();
		HEWManagesHealthPost hewManagesHealthPost = null;
		try {
			String query = "select * from tbl_hew_manages_health_post where health_post_id = "+healthPostId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hewManagesHealthPost = new HEWManagesHealthPost(rSet.getInt("id"), rSet.getInt("user_id"), 
						rSet.getInt("health_post_id"));
				list.add(hewManagesHealthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static HEWManagesHealthPost getHEWManagesHealthPostForUser(int userId){
		HEWManagesHealthPost hewManagesHealthPost = null;
		try {
			String query = "select * from tbl_hew_manages_health_post where user_id = "+userId;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hewManagesHealthPost = new HEWManagesHealthPost(rSet.getInt("id"), rSet.getInt("user_id"), 
						rSet.getInt("health_post_id"));
				//list.add(hewManagesHealthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return hewManagesHealthPost;
	}

	public static HEWManagesHealthPost getHEWManagesHealthPost(int id) {
		HEWManagesHealthPost hewManagesHealthPost = null;
		try {
			String query = "select * from tbl_hew_manages_health_post where id = "+id;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hewManagesHealthPost = new HEWManagesHealthPost(rSet.getInt("id"), rSet.getInt("user_id"), 
						rSet.getInt("health_post_id"));
				//list.add(hewManagesHealthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return hewManagesHealthPost;
	}
	
	public static HEWManagesHealthPost getHEWManagesHealthPostForThisUser(int userId){
		HEWManagesHealthPost hewManagesHealthPost = null;
		try {
			String query = "select * from tbl_hew_manages_health_post where user_id = "+userId;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hewManagesHealthPost = new HEWManagesHealthPost(rSet.getInt("id"), rSet.getInt("user_id"), 
						rSet.getInt("health_post_id"));
				//list.add(hewManagesHealthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return hewManagesHealthPost;
	}
	
	public static HEWManagesHealthPost getHEWManagesHealthPostsForThisHealthPost(int healthPostId){
		HEWManagesHealthPost hewManagesHealthPost = null;
		try {
			String query = "select * from tbl_hew_manages_health_post where health_post_id = "+healthPostId;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hewManagesHealthPost = new HEWManagesHealthPost(rSet.getInt("id"), rSet.getInt("user_id"), 
						rSet.getInt("health_post_id"));
				//list.add(hewManagesHealthPost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return hewManagesHealthPost;
	}
}// end lass
