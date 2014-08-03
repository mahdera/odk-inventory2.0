/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author TOSHIBA
 *
 */
public class BinCard {
	private long id;
	private int itemId;
	private Date binCardDate;
	private String transactionType;
	private float transactionQuantity;
	private int stockId;
	private float itemCurrentBalance;
	
	
	
	public BinCard() {
		
	}





	/**
	 * @param itemId
	 * @param binCardDate
	 * @param transactionType
	 * @param transactionQuantity
	 * @param stockId
	 * @param itemCurrentBalance
	 */
	public BinCard(int itemId, Date binCardDate, String transactionType,
			float transactionQuantity, int stockId, float itemCurrentBalance) {
		super();
		this.itemId = itemId;
		this.binCardDate = binCardDate;
		this.transactionType = transactionType;
		this.transactionQuantity = transactionQuantity;
		this.stockId = stockId;
		this.itemCurrentBalance = itemCurrentBalance;
	}
	
	
	
	
	
	/**
	 * @param id
	 * @param itemId
	 * @param binCardDate
	 * @param transactionType
	 * @param transactionQuantity
	 * @param stockId
	 * @param itemCurrentBalance
	 */
	public BinCard(long id, int itemId, Date binCardDate,
			String transactionType, float transactionQuantity, int stockId,
			float itemCurrentBalance) {
		super();
		this.id = id;
		this.itemId = itemId;
		this.binCardDate = binCardDate;
		this.transactionType = transactionType;
		this.transactionQuantity = transactionQuantity;
		this.stockId = stockId;
		this.itemCurrentBalance = itemCurrentBalance;
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
	 * @return the itemId
	 */
	public int getItemId() {
		return itemId;
	}
	/**
	 * @param itemId the itemId to set
	 */
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	/**
	 * @return the binCardDate
	 */
	public Date getBinCardDate() {
		return binCardDate;
	}
	/**
	 * @param binCardDate the binCardDate to set
	 */
	public void setBinCardDate(Date binCardDate) {
		this.binCardDate = binCardDate;
	}
	/**
	 * @return the transactionType
	 */
	public String getTransactionType() {
		return transactionType;
	}
	/**
	 * @param transactionType the transactionType to set
	 */
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	/**
	 * @return the transactionQuantity
	 */
	public float getTransactionQuantity() {
		return transactionQuantity;
	}
	/**
	 * @param transactionQuantity the transactionQuantity to set
	 */
	public void setTransactionQuantity(float transactionQuantity) {
		this.transactionQuantity = transactionQuantity;
	}
	/**
	 * @return the stockId
	 */
	public int getStockId() {
		return stockId;
	}
	/**
	 * @param stockId the stockId to set
	 */
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}
	/**
	 * @return the itemCurrentBalance
	 */
	public float getItemCurrentBalance() {
		return itemCurrentBalance;
	}
	/**
	 * @param itemCurrentBalance the itemCurrentBalance to set
	 */
	public void setItemCurrentBalance(float itemCurrentBalance) {
		this.itemCurrentBalance = itemCurrentBalance;
	}
	
	public void addBinCard(){
		try {
			String command = "insert into tbl_bin_card values(0,"+this.getItemId()+",'"+this.getBinCardDate()+"','"+
			this.getTransactionType()+"',"+this.getTransactionQuantity()+","+this.getStockId()+","+
			this.getItemCurrentBalance()+")";
			System.out.println(command);
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateBinCard(long id,int itemId,Date binCardDate,String transactionType,float transactionQuantity,
			int stockId,float itemCurrentBalance){
		try {
			String command = "update set item_id="+itemId+", bin_card_date='"+binCardDate+"', transaction_type='"+
			transactionType+"', transaction_quantity="+transactionQuantity+", stock_id="+stockId+", item_current_balance="+
			itemCurrentBalance+" where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteBinCard(long id){
		try {
			String command = "delete from tbl_bin_card where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<BinCard> getAllBinCards(){
		List<BinCard> list = new ArrayList<BinCard>();
		BinCard binCard = null;
		try {
			String query = "select * from tbl_bin_card";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				binCard = new BinCard(rSet.getLong("id"),rSet.getInt("item_id"),rSet.getDate("bin_card_date"),
						rSet.getString("transaction_type"),rSet.getFloat("transaction_quantity"),
						rSet.getInt("stock_id"),rSet.getFloat("item_current_balance"));
				list.add(binCard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static BinCard getBinCard(long id){
		BinCard binCard = null;
		try {
			String query = "select * from tbl_bin_card where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				binCard = new BinCard(rSet.getLong("id"),rSet.getInt("item_id"),rSet.getDate("bin_card_date"),
						rSet.getString("transaction_type"),rSet.getFloat("transaction_quantity"),
						rSet.getInt("stock_id"),rSet.getFloat("item_current_balance"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return binCard;
	}
	
	public static long getMaxBinCardIdOfThisItemInThisStock(int itemId,long stockId){
		long maxId = 0;
		try{
			String query = "select max(id) as m from tbl_bin_card where item_id = "+itemId+" and stock_id = "+stockId;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				maxId = rSet.getLong("m");
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return maxId;
	}
	
	public static float getItemCurrentBalanceForThisStock(long binCardId){
		float currentBalance = 0.0f;
		try{
			String query = "select item_current_balance as b from tbl_bin_card where id = "+binCardId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				currentBalance = rSet.getFloat("b");
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return currentBalance;
	}
}//end class
