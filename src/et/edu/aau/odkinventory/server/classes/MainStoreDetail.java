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
public class MainStoreDetail {
	private long id;
	private long mainStoreId;
	private String itemCode;
	private float currentQuantity;

	
	
	public MainStoreDetail() {
	}

	/**
	 * @param mainStoreId
	 * @param itemId
	 * @param currentQuantity
	 */
	public MainStoreDetail(long mainStoreId, String itemCode, float currentQuantity) {
		super();
		this.mainStoreId = mainStoreId;
		this.itemCode = itemCode;
		this.currentQuantity = currentQuantity;
	}

	/**
	 * @param id
	 * @param mainStoreId
	 * @param itemId
	 * @param currentQuantity
	 */
	public MainStoreDetail(long id, long mainStoreId, String itemCode,
			float currentQuantity) {
		super();
		this.id = id;
		this.mainStoreId = mainStoreId;
		this.itemCode = itemCode;
		this.currentQuantity = currentQuantity;
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
	 * @return the mainStoreId
	 */
	public long getMainStoreId() {
		return mainStoreId;
	}

	/**
	 * @param mainStoreId
	 *            the mainStoreId to set
	 */
	public void setMainStoreId(long mainStoreId) {
		this.mainStoreId = mainStoreId;
	}

	

	/**
	 * @return the itemCode
	 */
	public String getItemCode() {
		return itemCode;
	}

	/**
	 * @param itemCode the itemCode to set
	 */
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	/**
	 * @return the currentQuantity
	 */
	public float getCurrentQuantity() {
		return currentQuantity;
	}

	/**
	 * @param currentQuantity
	 *            the currentQuantity to set
	 */
	public void setCurrentQuantity(float currentQuantity) {
		this.currentQuantity = currentQuantity;
	}

	public void addMainStoreDetail() {
		try {
			String command = "insert into tbl_main_store_detail values(0,"+this.getMainStoreId()+",'"+
			this.getItemCode()+"',"+this.getCurrentQuantity()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateMainStoreDetail(long id,long mainStoreId,String itemCode,float currentQuantity) {
		try {
			String command = "update tbl_main_store_detail set main_store_id="+mainStoreId+", item_code='"+
			itemCode+"', current_quantity="+currentQuantity+" where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteMainStoreDetail(long id) {
		try {
			String command = "delete from tbl_main_store_detail where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<MainStoreDetail> getAllMainStoreDetails() {
		List<MainStoreDetail> list = new ArrayList<MainStoreDetail>();
		MainStoreDetail mainStoreDetail = null;
		try {
			String query = "select * from tbl_main_store_detail";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				mainStoreDetail = new MainStoreDetail(rSet.getLong("id"), rSet.getLong("main_store_id"), 
						rSet.getString("item_code"), rSet.getFloat("current_quantity"));
				list.add(mainStoreDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<MainStoreDetail> getMainStoreDetailForThisMainStore(long mainStoreId){
		List<MainStoreDetail> list = new ArrayList<MainStoreDetail>();
		MainStoreDetail mainStoreDetail = null;
		try {
			String query = "select * from tbl_main_store_detail where main_store_id = "+mainStoreId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				mainStoreDetail = new MainStoreDetail(rSet.getLong("id"), rSet.getLong("main_store_id"), 
						rSet.getString("item_code"), rSet.getFloat("current_quantity"));
				list.add(mainStoreDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static MainStoreDetail getMainStoreDetail(long id) {
		MainStoreDetail mainStoreDetail = null;
		try {
			String query = "select * from tbl_main_store_detail where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				mainStoreDetail = new MainStoreDetail(rSet.getLong("id"), rSet.getLong("main_store_id"), 
						rSet.getString("item_code"), rSet.getFloat("current_quantity"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return mainStoreDetail;
	}
	
	public static MainStoreDetail getMainStoreDetailForThisMainStoreAndItem(int mainStoreId,String itemCode){
		MainStoreDetail mainStoreDetail = null;
		try {
			String query = "select * from tbl_main_store_detail where main_store_id = "+mainStoreId+" and item_code='"+itemCode+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				mainStoreDetail = new MainStoreDetail(rSet.getLong("id"), rSet.getLong("main_store_id"), 
						rSet.getString("item_code"), rSet.getFloat("current_quantity"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return mainStoreDetail;
	}
	
	public static boolean isThisItemOnThisMainStoreAlreadyExisting(long mainStoreId,String itemCode){
		boolean exists = false;
		int cnt = 0;
		try{
			String query = "select count(*) as cnt from tbl_main_store_detail where main_store_id = "+
			mainStoreId+" and item_code = '"+itemCode+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				cnt = rSet.getInt("cnt");
				if(cnt != 0)
					exists = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return exists;
	}
	
	public static void updateTheQuantityOfThisItemOnThisMainStore(long mainStoreId,String itemCode,float qty){
		try{
			String command = "update tbl_main_store_detail set current_quantity = "+qty+" where main_store_id = "+
			mainStoreId+" and item_code = '"+itemCode+"'";
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
	
	public static float getMainStoreItemCurrentQuantity(long mainStoreId,String itemCode){
		float currentItemQuantity = 0.0f;
		try{
			String query = "select sum(current_quantity) as c from tbl_main_store_detail where main_store_id = "+
		mainStoreId+" and item_code = '"+itemCode+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				currentItemQuantity = rSet.getFloat("c");
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return currentItemQuantity;
	}
	
	public static void updateMainStoreDetail(long mainStoreDetailId,float qty){
		try{
			String command = "update tbl_main_store_detail set current_quantity = "+qty+" where id = "+mainStoreDetailId;
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
}// end class
