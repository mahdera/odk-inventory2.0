/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 * 
 */
public class ItemReorderLevel {
	private int id;
	private long stockId;
	private String itemCode;
	private float reorderLevel;
	private float emergencyReorderLevel;
	
	

	public ItemReorderLevel() {
	}

	/**
	 * @param stockId
	 * @param itemCode
	 * @param reorderLevel
	 */
	public ItemReorderLevel(long stockId, String itemCode, float reorderLevel,
			float emergencyReorderLevel) {
		this.stockId = stockId;
		this.itemCode = itemCode;
		this.reorderLevel = reorderLevel;
		this.emergencyReorderLevel = emergencyReorderLevel;
	}

	/**
	 * @param id
	 * @param stockId
	 * @param itemCode
	 * @param reorderLevel
	 */
	public ItemReorderLevel(int id, long stockId, String itemCode,
			float reorderLevel,float emergencyReorderLevel) {
		this.id = id;
		this.stockId = stockId;
		this.itemCode = itemCode;
		this.reorderLevel = reorderLevel;
		this.emergencyReorderLevel = emergencyReorderLevel;
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
	 * @return the stockId
	 */
	public long getStockId() {
		return stockId;
	}

	/**
	 * @param stockId
	 *            the stockId to set
	 */
	public void setStockId(long stockId) {
		this.stockId = stockId;
	}

	/**
	 * @return the itemCode
	 */
	public String getItemCode() {
		return itemCode;
	}

	/**
	 * @param itemCode
	 *            the itemCode to set
	 */
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	/**
	 * @return the reorderLevel
	 */
	public float getReorderLevel() {
		return reorderLevel;
	}

	/**
	 * @param reorderLevel
	 *            the reorderLevel to set
	 */
	public void setReorderLevel(float reorderLevel) {
		this.reorderLevel = reorderLevel;
	}
	
	

	/**
	 * @return the emergencyReorderLevel
	 */
	public float getEmergencyReorderLevel() {
		return emergencyReorderLevel;
	}

	/**
	 * @param emergencyReorderLevel the emergencyReorderLevel to set
	 */
	public void setEmergencyReorderLevel(float emergencyReorderLevel) {
		this.emergencyReorderLevel = emergencyReorderLevel;
	}

	public void addItemReorderLevel() {
		try {
			String command = "insert into tbl_item_reorder_level values(0,"+this.getStockId()+",'"+
		this.getItemCode()+"',"+this.getReorderLevel()+","+this.getEmergencyReorderLevel()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateItemReorderLevel(int id,float reorderLevel,float emergencyReorderLevel){
		try {
			String command = "update tbl_item_reorder_level set reorder_level="+reorderLevel+", emergency_reorder_level="+emergencyReorderLevel+" where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateItemReorderLevel(int id,long stockId,String itemCode,float reorderLevel) {
		try {
			String command = "update tbl_item_reorder_level set stock_id="+
		stockId+", item_code='"+itemCode+"', reorder_level="+reorderLevel+" where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteItemReorderLevel(int id) {
		try {
			String command = "delete from tbl_item_reorder_level where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<ItemReorderLevel> getAllItemReorderLevelsForThisStock(long stockId){
		List<ItemReorderLevel> list = new ArrayList<ItemReorderLevel>();
		ItemReorderLevel itemReorderLevel = null;
		try {
			String query = "select * from tbl_item_reorder_level where stock_id = "+stockId+" order by item_code";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				itemReorderLevel = new ItemReorderLevel(rSet.getInt("id"), rSet.getLong("stock_id"), 
						rSet.getString("item_code"), rSet.getFloat("reorder_level"),rSet.getFloat("emergency_reorder_level"));
				list.add(itemReorderLevel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static List<ItemReorderLevel> getAllItemReorderLevels() {
		List<ItemReorderLevel> list = new ArrayList<ItemReorderLevel>();
		ItemReorderLevel itemReorderLevel = null;
		try {
			String query = "select * from tbl_item_reorder_level order by item_code";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				itemReorderLevel = new ItemReorderLevel(rSet.getInt("id"), rSet.getLong("stock_id"), 
						rSet.getString("item_code"), rSet.getFloat("reorder_level"),rSet.getFloat("emergency_reorder_level"));
				list.add(itemReorderLevel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static ItemReorderLevel getItemReorderLevel(int id) {
		ItemReorderLevel itemReorderLevel = null;
		try {
			String query = "select * from tbl_item_reorder_level where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				itemReorderLevel = new ItemReorderLevel(rSet.getInt("id"), rSet.getLong("stock_id"), 
						rSet.getString("item_code"), rSet.getFloat("reorder_level"),rSet.getFloat("emergency_reorder_level"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return itemReorderLevel;
	}
	
	public static boolean doesThisItemHasReorderLevelEnteredForItInThisStock(String itemCode,long stockId){
		boolean does = false;
		int c = 0;
		try{
			String query = "select count(*) as q from tbl_item_reorder_level where item_code = '"+itemCode+"' and stock_id = "+stockId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				c = rSet.getInt("q");
				if(c != 0)
					does = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return does;
	}
	
	public static ItemReorderLevel getItemReorderLevelForThisStockAndItem(int stockId,String itemCode){
		ItemReorderLevel itemReorderLevel = null;
		try{
			String query = "select * from tbl_item_reorder_level where stock_id = "+stockId+
					" and item_code='"+itemCode+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				itemReorderLevel = new ItemReorderLevel(rSet.getInt("id"), rSet.getLong("stock_id"), rSet.getString("item_code"), rSet.getFloat("reorder_level"), rSet.getFloat("emergency_reorder_level"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return itemReorderLevel;
	}
}// end class
