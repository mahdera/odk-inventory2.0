/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.util.Date;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 * 
 */
public class ApprovedOrder {
	private long id;
	private String _uri;
	private int healthPostId;
	private Date approvedOn;
	private int approvedBy;
	private float pillsAmount;
	private float condomAmount;
	private float injectableAmount;
	private float implantAmount;
	
	
	

	public ApprovedOrder() {
		super();
	}

	/**
	 * @param _uri
	 * @param healthPostId
	 * @param approvedBy
	 * @param pillsAmount
	 * @param condomAmount
	 * @param injectableAmount
	 * @param implantAmount
	 */
	public ApprovedOrder(String _uri, int healthPostId, int approvedBy,
			float pillsAmount, float condomAmount, float injectableAmount,
			float implantAmount) {
		this._uri = _uri;
		this.healthPostId = healthPostId;
		this.approvedBy = approvedBy;
		this.pillsAmount = pillsAmount;
		this.condomAmount = condomAmount;
		this.injectableAmount = injectableAmount;
		this.implantAmount = implantAmount;
	}

	/**
	 * @param id
	 * @param _uri
	 * @param healthPostId
	 * @param approvedOn
	 * @param approvedBy
	 * @param pillsAmount
	 * @param condomAmount
	 * @param injectableAmount
	 * @param implantAmount
	 */
	public ApprovedOrder(long id, String _uri, int healthPostId,
			Date approvedOn, int approvedBy, float pillsAmount,
			float condomAmount, float injectableAmount, float implantAmount) {
		this.id = id;
		this._uri = _uri;
		this.healthPostId = healthPostId;
		this.approvedOn = approvedOn;
		this.approvedBy = approvedBy;
		this.pillsAmount = pillsAmount;
		this.condomAmount = condomAmount;
		this.injectableAmount = injectableAmount;
		this.implantAmount = implantAmount;
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

	/**
	 * @return the approvedOn
	 */
	public Date getApprovedOn() {
		return approvedOn;
	}

	/**
	 * @param approvedOn
	 *            the approvedOn to set
	 */
	public void setApprovedOn(Date approvedOn) {
		this.approvedOn = approvedOn;
	}

	/**
	 * @return the approvedBy
	 */
	public int getApprovedBy() {
		return approvedBy;
	}

	/**
	 * @param approvedBy
	 *            the approvedBy to set
	 */
	public void setApprovedBy(int approvedBy) {
		this.approvedBy = approvedBy;
	}

	/**
	 * @return the pillsAmount
	 */
	public float getPillsAmount() {
		return pillsAmount;
	}

	/**
	 * @param pillsAmount
	 *            the pillsAmount to set
	 */
	public void setPillsAmount(float pillsAmount) {
		this.pillsAmount = pillsAmount;
	}

	/**
	 * @return the condomAmount
	 */
	public float getCondomAmount() {
		return condomAmount;
	}

	/**
	 * @param condomAmount
	 *            the condomAmount to set
	 */
	public void setCondomAmount(float condomAmount) {
		this.condomAmount = condomAmount;
	}

	/**
	 * @return the injectableAmount
	 */
	public float getInjectableAmount() {
		return injectableAmount;
	}

	/**
	 * @param injectableAmount
	 *            the injectableAmount to set
	 */
	public void setInjectableAmount(float injectableAmount) {
		this.injectableAmount = injectableAmount;
	}

	/**
	 * @return the implantAmount
	 */
	public float getImplantAmount() {
		return implantAmount;
	}

	/**
	 * @param implantAmount
	 *            the implantAmount to set
	 */
	public void setImplantAmount(float implantAmount) {
		this.implantAmount = implantAmount;
	}

	public void addApprovedOrder() {
		try {
			String command = "insert into tbl_approved_order values(0,'"+this.get_uri()+"',"+
		this.getHealthPostId()+",NOW(),"+this.getApprovedBy()+","+this.getPillsAmount()+","+
					this.getCondomAmount()+","+this.getInjectableAmount()+","+this.getImplantAmount()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateApprovedOrder(long id,float pillsAmount,float condomAmount,
			float injectableAmount,float implantAmount) {
		try {
			String command = "update tbl_approved_order set pills_amount="+pillsAmount+", condom_amount="+
		condomAmount+", injectable_amount="+injectableAmount+", implant_amount="+implantAmount+" where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteApprovedOrder(long id) {
		try {
			String command = "delete from tbl_approved_order where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<ApprovedOrder> getAllApprovedOrdersForThisHealthPost(int healthPostId){
		List<ApprovedOrder> list = new ArrayList<ApprovedOrder>();
		ApprovedOrder approvedOrder = null;
		try {
			String query = "select * from tbl_approved_order where health_post_id = "+healthPostId+" order by approved_on desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				approvedOrder = new ApprovedOrder(rSet.getLong("id"), rSet.getString("_uri"), 
						rSet.getInt("health_post_id"), rSet.getDate("approved_on"), rSet.getInt("approved_by"), 
						rSet.getFloat("pills_amount"), rSet.getFloat("condom_amount"), rSet.getFloat("injectable_amount"), 
						rSet.getFloat("implant_amount"));
				list.add(approvedOrder);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static List<ApprovedOrder> getAllApprovedOrders() {
		List<ApprovedOrder> list = new ArrayList<ApprovedOrder>();
		ApprovedOrder approvedOrder = null;
		try {
			String query = "select * from tbl_approved_order order by approved_on desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				approvedOrder = new ApprovedOrder(rSet.getLong("id"), rSet.getString("_uri"), 
						rSet.getInt("health_post_id"), rSet.getDate("approved_on"), rSet.getInt("approved_by"), 
						rSet.getFloat("pills_amount"), rSet.getFloat("condom_amount"), rSet.getFloat("injectable_amount"), 
						rSet.getFloat("implant_amount"));
				list.add(approvedOrder);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static ApprovedOrder getApprovedOrderForThisOrder(String _uri){
		ApprovedOrder approvedOrder = null;
		try {
			String query = "select * from tbl_approved_order where _uri = '"+_uri+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				approvedOrder = new ApprovedOrder(rSet.getLong("id"), rSet.getString("_uri"), 
						rSet.getInt("health_post_id"), rSet.getDate("approved_on"), rSet.getInt("approved_by"), 
						rSet.getFloat("pills_amount"), rSet.getFloat("condom_amount"), rSet.getFloat("injectable_amount"), 
						rSet.getFloat("implant_amount"));				
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return approvedOrder;
	}

	public static ApprovedOrder getApprovedOrder(long id) {
		ApprovedOrder approvedOrder = null;
		try {
			String query = "select * from tbl_approved_order where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				approvedOrder = new ApprovedOrder(rSet.getLong("id"), rSet.getString("_uri"), 
						rSet.getInt("health_post_id"), rSet.getDate("approved_on"), rSet.getInt("approved_by"), 
						rSet.getFloat("pills_amount"), rSet.getFloat("condom_amount"), rSet.getFloat("injectable_amount"), 
						rSet.getFloat("implant_amount"));				
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return approvedOrder;
	}
	
	public static void updateApprovedOrderForThisHealthPost(String _uri,int healthPostId,float pillsAmount,
			float condomAmount,float injectableAmount,float implantAmount){
		try{
			String command = "update tbl_approved_order set pills_amount="+pillsAmount+", condom_amount="+
		condomAmount+", injectable_amount="+injectableAmount+", implant_amount="+implantAmount+" where _uri = '"+
					_uri+"' and health_post_id="+healthPostId;
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
	
	
}// end class
