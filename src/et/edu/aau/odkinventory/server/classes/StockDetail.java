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
public class StockDetail {
	private long id;
	private long stockId;
	private String itemCode;
	private float currentQuantity;
	
	

	public StockDetail() {
	}

	/**
	 * @param stockId
	 * @param itemId
	 * @param currentQuantity
	 */
	public StockDetail(long stockId, String itemCode, float currentQuantity) {
		super();
		this.stockId = stockId;
		this.itemCode = itemCode;
		this.currentQuantity = currentQuantity;
	}

	/**
	 * @param id
	 * @param stockId
	 * @param itemId
	 * @param currentQuantity
	 */
	public StockDetail(long id, long stockId, String itemCode, float currentQuantity) {
		super();
		this.id = id;
		this.stockId = stockId;
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

	public void addStockDetail() {
		try {
			String command = "insert into tbl_stock_detail values(0,"+this.getStockId()+",'"+
			this.getItemCode()+"',"+this.getCurrentQuantity()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateStockDetail(long stockDetailId,float qty){
		try {
			String command = "update tbl_stock_detail set  current_quantity = "+
			qty+" where id = "+stockDetailId;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateStockDetail(long id,long stockId,String itemCode,float currentQuantity) {
		try {
			String command = "update tbl_stock_detail set stock_id="+stockId+", item_code='"+itemCode+"', current_quantity = "+
			currentQuantity+" where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteStockDetail(long id) {
		try {
			String command = "delete from tbl_stock_detail where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<StockDetail> getAllStockDetails() {
		List<StockDetail> list = new ArrayList<StockDetail>();
		StockDetail stockDetail = null;
		try {
			String query = "select * from tbl_stock_detail";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				stockDetail = new StockDetail(rSet.getLong("id"), rSet.getLong("stock_id"), 
						rSet.getString("item_code"), rSet.getFloat("current_quantity"));
				list.add(stockDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<StockDetail> getAllStockDetailsOfThisStock(int stockId){
		List<StockDetail> list = new ArrayList<StockDetail>();
		StockDetail stockDetail = null;
		try {
			String query = "select * from tbl_stock_detail where stock_id = "+stockId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				stockDetail = new StockDetail(rSet.getLong("id"), rSet.getLong("stock_id"), 
						rSet.getString("item_code"), rSet.getFloat("current_quantity"));
				list.add(stockDetail);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static StockDetail getStockDetail(long id) {
		StockDetail stockDetail = null;
		try {
			String query = "select * from tbl_stock_detail where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				stockDetail = new StockDetail(rSet.getLong("id"), rSet.getLong("stock_id"), 
						rSet.getString("item_code"), rSet.getFloat("current_quantity"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return stockDetail;
	}
	
	public static StockDetail getStockDetailForThisStockAndItem(int stockId,String itemCode){
		StockDetail stockDetail = null;
		try {
			String query = "select * from tbl_stock_detail where stock_id = "+stockId+" and item_code='"+itemCode+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				stockDetail = new StockDetail(rSet.getLong("id"), rSet.getLong("stock_id"), 
						rSet.getString("item_code"), rSet.getFloat("current_quantity"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return stockDetail;
	}
	
	public static float getItemCurrentBalanceInStock(int itemId,int stockId){
		float balance = 0.0f;
		try{
			String query = "select current_quantity as qty from tbl_stock_detail where item_id="+itemId+" and stock_id = "+stockId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				balance = rSet.getFloat("qty");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return balance;
	}
	
	public static boolean isThisItemOnThisStockAlreadyExisting(int stockId,String itemCode){
		boolean exists = false;
		int cnt = 0;
		try{
			String query = "select count(*) as c from tbl_stock_detail where item_code = '"+itemCode+"' and stock_id = "+stockId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				cnt = rSet.getInt("c");
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
	
	public static boolean doesThisItemExistInThisStock(int itemId,int stockId){
		boolean exists = false;
		int cnt = 0;
		try{
			String query = "select count(*) as c from tbl_stock_detail where item_id = "+itemId+" and stock_id = "+stockId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				cnt = rSet.getInt("c");
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
	
	public static void updateItemDetailInStock(int itemId,long stockId,float quantity){
		try{
			String command = "update tbl_stock_detail set current_quantity = "+quantity+" where item_id="+itemId+
			"and stock_id = "+stockId;
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateTheQuantityOfThisItemOnThisStock(int stockId,String itemCode,float quantity){
		try{
			String command = "update tbl_stock_detail set current_quantity = "+quantity+" where item_code='"+itemCode+
			"' and stock_id = "+stockId;
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
	
	public static float getTheCurrentItemAmountForThisItemCodeInThisStock(int stockId,String itemCode){
		float currentQty = 0.0f;
		try{
			String query = "select current_quantity as c from tbl_stock_detail where stock_id = "+stockId+" and item_code='"+itemCode+"'";
			//current item quantity is calculated as the difference b/n the sum of all received item minus the sum of issued item
			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				currentQty = rSet.getFloat("c");
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return currentQty;
	}
	
	public static void updateItemAmountForThisItemCodeInThisStock(int stockId,String itemCode,float itemAmount){
		try{
			String command = "update tbl_stock_detail set current_quantity = "+itemAmount+" where stock_id="+
		stockId+" and item_code='"+itemCode+"'";
			System.out.println(command);
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
}// end class
