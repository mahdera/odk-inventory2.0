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
public class MainStore {
	private long id;
	private String mainStoreName;
	private int healthCenterId;	
	
	
	
	public MainStore() {
	}

	/**
	 * @param id
	 * @param mainStoreName
	 * @param healthCenterId
	 */
	public MainStore(long id, String mainStoreName, int healthCenterId) {
		super();
		this.id = id;
		this.mainStoreName = mainStoreName;
		this.healthCenterId = healthCenterId;
	}

	/**
	 * @param mainStoreName
	 * @param healthCenterId
	 */
	public MainStore(String mainStoreName, int healthCenterId) {
		super();
		this.mainStoreName = mainStoreName;
		this.healthCenterId = healthCenterId;
	}
	
	

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the mainStoreName
	 */
	public String getMainStoreName() {
		return mainStoreName;
	}

	/**
	 * @param mainStoreName the mainStoreName to set
	 */
	public void setMainStoreName(String mainStoreName) {
		this.mainStoreName = mainStoreName;
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

	public void addMainStore(){
		try {
			String command = "insert into tbl_main_store values(0,'"+this.getMainStoreName()+"',"+
			this.getHealthCenterId()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateMainStore(long id,String mainStoreName,int healthCenterId){
		try {
			String command = "update tbl_main_store set main_store_name='"+mainStoreName+"', health_center_id="+
			healthCenterId+" where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteMainStore(long id){
		try {
			String command = "delete from tbl_main_store where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<MainStore> getAllMainStores(){
		List<MainStore> list = new ArrayList<MainStore>();
		MainStore mainStore = null;
		try {
			String query = "select * from tbl_main_store";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				mainStore = new MainStore(rSet.getLong("id"), rSet.getString("main_store_name"), 
						rSet.getInt("health_center_id"));
				list.add(mainStore);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static MainStore getMainStore(long id){
		MainStore mainStore = null;
		try {
			String query = "select * from tbl_main_store where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				mainStore = new MainStore(rSet.getLong("id"), rSet.getString("main_store_name"), 
						rSet.getInt("health_center_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return mainStore;
	}
	
	public static MainStore getMainStoreForThisHealthCenter(int healthCenterId){
		MainStore mainStore = null;
		try {
			String query = "select * from tbl_main_store where health_center_id = "+healthCenterId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				mainStore = new MainStore(rSet.getLong("id"), rSet.getString("main_store_name"), 
						rSet.getInt("health_center_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return mainStore;
	}
}//end class
