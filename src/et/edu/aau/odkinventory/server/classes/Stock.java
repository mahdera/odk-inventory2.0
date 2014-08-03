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
public class Stock {
	private long id;
	private String stockName;
	private int healthPostId;
	
	

	/**
	 * @param stockName
	 * @param healthPostId
	 */
	public Stock(String stockName, int healthPostId) {
		super();
		this.stockName = stockName;
		this.healthPostId = healthPostId;
	}
	
	

	/**
	 * @param id
	 * @param stockName
	 * @param healthPostId
	 */
	public Stock(long id, String stockName, int healthPostId) {
		super();
		this.id = id;
		this.stockName = stockName;
		this.healthPostId = healthPostId;
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
	 * @return the stockName
	 */
	public String getStockName() {
		return stockName;
	}



	/**
	 * @param stockName the stockName to set
	 */
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}



	/**
	 * @return the healthPostId
	 */
	public int getHealthPostId() {
		return healthPostId;
	}



	/**
	 * @param healthPostId the healthPostId to set
	 */
	public void setHealthPostId(int healthPostId) {
		this.healthPostId = healthPostId;
	}



	public void addStock() {
		try {
			String command = "insert into tbl_stock values(0,'"+this.getStockName()+"',"+
			this.getHealthPostId()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateStock(long id,String stockName,int healthPostId) {
		try {
			String command = "update tbl_stock set health_post_id = "+healthPostId+", stock_name='"+
			stockName+"' where id = "+id;
			System.out.println(command);
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteStock(long id) {
		try {
			String command = "delete from tbl_stock where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Stock> getAllStocks() {
		List<Stock> list = new ArrayList<Stock>();
		Stock stock = null;
		try {
			String query = "select * from tbl_stock";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				stock = new Stock(rSet.getLong("id"), rSet.getString("stock_name"), rSet.getInt("health_post_id"));
				list.add(stock);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Stock getStock(long id) {
		Stock stock = null;
		try {
			String query = "select * from tbl_stock where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				stock = new Stock(rSet.getLong("id"), rSet.getString("stock_name"), rSet.getInt("health_post_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return stock;
	}
	
	public static Stock getStockOfThisHealthPost(int healthPostId){
		Stock stock = null;
		try {
			String query = "select * from tbl_stock where health_post_id = "+healthPostId;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				stock = new Stock(rSet.getLong("id"), rSet.getString("stock_name"), rSet.getInt("health_post_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return stock;
	}
}// end class
