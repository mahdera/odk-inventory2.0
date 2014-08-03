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
public class HEW {
	private int id;
	private String firstName;
	private String fatherName;
	private String grandFatherName;
	private String mobileNumber;
	private int healthPostId;
	
	
	
	public HEW() {
	}
	/**
	 * @param firstName
	 * @param fatherName
	 * @param grandFatherName
	 * @param mobileNumber
	 * @param healthPostId
	 */
	public HEW(String firstName, String fatherName, String grandFatherName,
			String mobileNumber, int healthPostId) {
		super();
		this.firstName = firstName;
		this.fatherName = fatherName;
		this.grandFatherName = grandFatherName;
		this.mobileNumber = mobileNumber;
		this.healthPostId = healthPostId;
	}
	/**
	 * @param id
	 * @param firstName
	 * @param fatherName
	 * @param grandFatherName
	 * @param mobileNumber
	 * @param healthPostId
	 */
	public HEW(int id, String firstName, String fatherName,
			String grandFatherName, String mobileNumber, int healthPostId) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.fatherName = fatherName;
		this.grandFatherName = grandFatherName;
		this.mobileNumber = mobileNumber;
		this.healthPostId = healthPostId;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return the fatherName
	 */
	public String getFatherName() {
		return fatherName;
	}
	/**
	 * @param fatherName the fatherName to set
	 */
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	/**
	 * @return the grandFatherName
	 */
	public String getGrandFatherName() {
		return grandFatherName;
	}
	/**
	 * @param grandFatherName the grandFatherName to set
	 */
	public void setGrandFatherName(String grandFatherName) {
		this.grandFatherName = grandFatherName;
	}
	/**
	 * @return the mobileNumber
	 */
	public String getMobileNumber() {
		return mobileNumber;
	}
	/**
	 * @param mobileNumber the mobileNumber to set
	 */
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
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
	
	public void addHEW(){
		try {
			String command = "insert into tbl_hew values(0,'"+this.getFirstName()+"','"+
			this.getFatherName()+"','"+this.getGrandFatherName()+"','"+this.getMobileNumber()+"',"+
			this.getHealthPostId()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateHEW(int id,String firstName,String fatherName,String grandFatherName,
			String mobileNumber,int healthPostId){
		try {
			String command = "update tbl_hew set first_name='"+firstName+"',father_name='"+
			fatherName+"', grand_father_name='"+grandFatherName+"', health_post_id="+healthPostId+", mobile_number='"+mobileNumber+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteHEW(int id){
		try {
			String command = "delete from tbl_hew where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<HEW> getAllHEWs(){
		List<HEW> list = new ArrayList<HEW>();
		HEW hew = null;
		try {
			String query = "select * from tbl_hew order by first_name,father_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hew = new HEW(rSet.getInt("id"), rSet.getString("first_name"), 
						rSet.getString("father_name"), rSet.getString("grand_father_name"), 
						rSet.getString("mobile_number"), rSet.getInt("health_post_id"));
				list.add(hew);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<HEW> getAllHEWsInThisHealthCenter(int healthCenterId){
		List<HEW> list = new ArrayList<HEW>();
		HEW hew = null;
		try {
			String query = "select tbl_hew.* from tbl_hew,tbl_health_post where "+
			"tbl_hew.health_post_id = tbl_health_post.id and tbl_health_post.health_center_id = "+
			healthCenterId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hew = new HEW(rSet.getInt("id"), rSet.getString("first_name"), 
						rSet.getString("father_name"), rSet.getString("grand_father_name"), 
						rSet.getString("mobile_number"), rSet.getInt("health_post_id"));
				list.add(hew);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<HEW> getAllHEWsInThisHealthPost(int healthPostId){
		List<HEW> list = new ArrayList<HEW>();
		HEW hew = null;
		try {
			String query = "select * from tbl_hew where health_post_id = "+healthPostId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hew = new HEW(rSet.getInt("id"), rSet.getString("first_name"), 
						rSet.getString("father_name"), rSet.getString("grand_father_name"), 
						rSet.getString("mobile_number"), rSet.getInt("health_post_id"));
				list.add(hew);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static HEW getHEW(int id){
		HEW hew = null;
		try {
			String query = "select * from tbl_hew where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hew = new HEW(rSet.getInt("id"), rSet.getString("first_name"), 
						rSet.getString("father_name"), rSet.getString("grand_father_name"), 
						rSet.getString("mobile_number"), rSet.getInt("health_post_id"));
				//list.add(hew);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return hew;
	}
	
	public static List<HEW> getAllHEWsUnderThisHealthCenter(int healthCenterId){
		List<HEW> list = new ArrayList<HEW>();
		HEW hew = null;
		try{
			String query = "SELECT tbl_hew . * FROM tbl_hew, tbl_health_post WHERE tbl_health_post.health_center_id ="+healthCenterId+" AND tbl_health_post.id = tbl_hew.health_post_id";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				hew = new HEW(rSet.getInt("id"), rSet.getString("first_name"), 
						rSet.getString("father_name"), rSet.getString("grand_father_name"), 
						rSet.getString("mobile_number"), rSet.getInt("health_post_id"));
				list.add(hew);
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}//end class
