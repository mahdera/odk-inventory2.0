/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 * 
 */
public class ItemReorderReminder {
	private long id;
	private long stockId;
	private String itemCode;
	private String message;
	private Date dateMessageSent;
	private String status;
	
	

	public ItemReorderReminder() {
	}

	/**
	 * @param stockId
	 * @param itemCode
	 * @param message
	 * @param dateMessageSent
	 * @param status
	 */
	public ItemReorderReminder(long stockId, String itemCode, String message,
			Date dateMessageSent, String status) {
		this.stockId = stockId;
		this.itemCode = itemCode;
		this.message = message;
		this.dateMessageSent = dateMessageSent;
		this.status = status;
	}

	/**
	 * @param id
	 * @param stockId
	 * @param itemCode
	 * @param message
	 * @param dateMessageSent
	 * @param status
	 */
	public ItemReorderReminder(long id, long stockId, String itemCode,
			String message, Date dateMessageSent, String status) {
		this.id = id;
		this.stockId = stockId;
		this.itemCode = itemCode;
		this.message = message;
		this.dateMessageSent = dateMessageSent;
		this.status = status;
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
	 * @param itemCode
	 *            the itemCode to set
	 */
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message
	 *            the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @return the dateMessageSent
	 */
	public Date getDateMessageSent() {
		return dateMessageSent;
	}

	/**
	 * @param dateMessageSent
	 *            the dateMessageSent to set
	 */
	public void setDateMessageSent(Date dateMessageSent) {
		this.dateMessageSent = dateMessageSent;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	public void addItemReorderReminder() {
		try {
			String command = "insert into tbl_item_reorder_reminder values(0,"+
		this.getStockId()+",'"+this.getItemCode()+"','"+this.getMessage()+"','"+
					this.getDateMessageSent()+"','"+this.getStatus()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateItemReorderReminder(long id,long stockId,String itemCode,
			String message,Date dateMessageSent,String status) {
		try {
			String command = "update tbl_item_reorder_reminder set stock_id="+
		stockId+", item_code='"+itemCode+"', message='"+message+"', date_message_sent='"+
					dateMessageSent+"', status='"+status+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteItemReorderReminder(long id) {
		try {
			String command = "delete from tbl_item_reorder_reminder where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<ItemReorderReminder> getAllItemReorderReminders() {
		List<ItemReorderReminder> list = new ArrayList<ItemReorderReminder>();
		ItemReorderReminder r = null;
		try {
			String query = "select * from tbl_item_reorder_reminder";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				r = new ItemReorderReminder(rSet.getLong("id"), rSet.getLong("stock_id"), rSet.getString("item_code"), 
						rSet.getString("message"), rSet.getDate("date_message_sent"), rSet.getString("status"));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static ItemReorderReminder getItemReorderReminder(long id) {
		ItemReorderReminder r = null;
		try {
			String query = "select * from tbl_item_reorder_reminder where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				r = new ItemReorderReminder(rSet.getLong("id"), rSet.getLong("stock_id"), rSet.getString("item_code"), 
						rSet.getString("message"), rSet.getDate("date_message_sent"), rSet.getString("status"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return r;
	}
	
	public static void changeTheStatusOfThisItemReorderReminder(long itemReorderReminderId,String status){
		try{
			String command = "update tbl_item_reorder_reminder set status = '"+status+"' where id = "+itemReorderReminderId;
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
}// end class
