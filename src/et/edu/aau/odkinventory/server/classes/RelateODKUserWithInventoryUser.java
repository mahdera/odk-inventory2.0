/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author alemayehu
 * 
 */
public class RelateODKUserWithInventoryUser {
	private int id;
	private int userId;
	private String _uri;

	/**
	 * @param userId
	 * @param _uri
	 */
	public RelateODKUserWithInventoryUser(int userId, String _uri) {
		this.userId = userId;
		this._uri = _uri;
	}

	/**
	 * @param id
	 * @param userId
	 * @param _uri
	 */
	public RelateODKUserWithInventoryUser(int id, int userId, String _uri) {
		this.id = id;
		this.userId = userId;
		this._uri = _uri;
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
	 * @return the _uri
	 */
	public String get_uri() {
		return _uri;
	}

	/**
	 * @param _uri
	 *            the _uri to set
	 */
	public void set_uri(String _uri) {
		this._uri = _uri;
	}

	public void addRelateODKUserWithInventoryUser() {
		try {
			String command = "insert into tbl_relate_odk_user_with_inventory_user values(0,"+
		this.getUserId()+",'"+this.get_uri()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateRelateODKUserWithInventoryUser(int id,int userId,String _uri) {
		try {
			String command = "update tbl_relate_odk_user_with_inventory_user set user_id="+
		userId+" and _uri='"+_uri+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteRelateODKUserWithInventoryUser(int id) {
		try {
			String command = "delete from tbl_relate_odk_user_with_inventory_user where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<RelateODKUserWithInventoryUser> getAllRelatedODKUserWithInventoryUsers() {
		List<RelateODKUserWithInventoryUser> list = new ArrayList<RelateODKUserWithInventoryUser>();
		RelateODKUserWithInventoryUser relateODKUserWithInventoryUser = null;
		try {
			String query = "select * from tbl_relate_odk_user_with_inventory_user order by id";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				relateODKUserWithInventoryUser = new RelateODKUserWithInventoryUser(rSet.getInt("id"), 
						rSet.getInt("user_id"), rSet.getString("_uri"));
				list.add(relateODKUserWithInventoryUser);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static RelateODKUserWithInventoryUser getRelateODKUserWithInventoryUserForInventoryUser(int userId){
		RelateODKUserWithInventoryUser relateODKUserWithInventoryUser = null;
		try {
			String query = "select * from tbl_relate_odk_user_with_inventory_user where user_id = "+userId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				relateODKUserWithInventoryUser = new RelateODKUserWithInventoryUser(rSet.getInt("id"), 
						rSet.getInt("user_id"), rSet.getString("_uri"));
				//list.add(relateODKUserWithInventoryUser);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return relateODKUserWithInventoryUser;
	}

	public static RelateODKUserWithInventoryUser getRelateODKUserWithInventoryUser(
			int id) {
		RelateODKUserWithInventoryUser relateODKUserWithInventoryUser = null;
		try {
			String query = "select * from tbl_relate_odk_user_with_inventory_user where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				relateODKUserWithInventoryUser = new RelateODKUserWithInventoryUser(rSet.getInt("id"), 
						rSet.getInt("user_id"), rSet.getString("_uri"));
				//list.add(relateODKUserWithInventoryUser);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return relateODKUserWithInventoryUser;
	}
	
	public static RelateODKUserWithInventoryUser getRelateODKUserWithInventoryUserUsingODKUsername(String odkUsername){
		RelateODKUserWithInventoryUser relateODKUserWithInventoryUser = null;
		try {
			String query = "select * from tbl_relate_odk_user_with_inventory_user where _URI = '"+odkUsername+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				relateODKUserWithInventoryUser = new RelateODKUserWithInventoryUser(rSet.getInt("id"), 
						rSet.getInt("user_id"), rSet.getString("_uri"));
				//list.add(relateODKUserWithInventoryUser);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return relateODKUserWithInventoryUser;
	}
	
	public static boolean isThisODKUserAlreadyRelatedToInventoryUser(String uri){
		boolean related = false;
		int count = 0;
		try{
			String query = "select count(*) as c from tbl_relate_odk_user_with_inventory_user where _URI = '"+uri+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				count = rSet.getInt("c");
				if(count != 0)
					related = true;
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return related;
	}
}// end class
