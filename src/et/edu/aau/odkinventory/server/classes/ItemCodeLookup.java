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
public class ItemCodeLookup {
	private int id;
	private String itemCode;

	/**
	 * @param itemCode
	 */
	public ItemCodeLookup(String itemCode) {
		this.itemCode = itemCode;
	}

	/**
	 * @param id
	 * @param itemCode
	 */
	public ItemCodeLookup(int id, String itemCode) {
		this.id = id;
		this.itemCode = itemCode;
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

	public void addItemCodeLookup() {
		try {
			String command = "insert into tbl_item_code_lookup values(0,'"+this.getItemCode()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateItemCodeLookup(int id,String itemCode) {
		try {
			String command = "update tbl_item_code_lookup set item_code='"+itemCode+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteItemCodeLookup(int id) {
		try {
			String command = "delete from tbl_item_code_lookup where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<ItemCodeLookup> getAllItemCodeLookups() {
		List<ItemCodeLookup> list = new ArrayList<ItemCodeLookup>();
		ItemCodeLookup itemCodeLookup = null;
		try {
			String query = "select * from tbl_item_code_lookup order by item_code";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				itemCodeLookup = new ItemCodeLookup(rSet.getInt("id"), rSet.getString("item_code"));
				list.add(itemCodeLookup);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static ItemCodeLookup getItemCodeLookup(int id) {
		ItemCodeLookup itemCodeLookup = null;
		try {
			String query = "select * from tbl_item_code_lookup where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				itemCodeLookup = new ItemCodeLookup(rSet.getInt("id"), rSet.getString("item_code"));
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return itemCodeLookup;
	}
	
	public static ItemCodeLookup getItemCodeLookup(String itemCode) {
		ItemCodeLookup itemCodeLookup = null;
		try {
			String query = "select * from tbl_item_code_lookup where item_code='"+itemCode+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				itemCodeLookup = new ItemCodeLookup(rSet.getInt("id"), rSet.getString("item_code"));
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return itemCodeLookup;
	}
}// end class
