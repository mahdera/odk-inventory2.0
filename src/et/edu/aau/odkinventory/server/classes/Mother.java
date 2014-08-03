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
public class Mother {
	private int id;
	private String motherFullName;
	private String houseNumberGote;
	private String preferredContraceptiveMethod;
	private String phoneNumber;
	/**
	 * @param motherFullName
	 * @param houseNumberGote
	 * @param preferredContraceptiveMethod
	 * @param phoneNumber
	 */
	public Mother(String motherFullName, String houseNumberGote,
			String preferredContraceptiveMethod, String phoneNumber) {
		this.motherFullName = motherFullName;
		this.houseNumberGote = houseNumberGote;
		this.preferredContraceptiveMethod = preferredContraceptiveMethod;
		this.phoneNumber = phoneNumber;
	}
	/**
	 * @param id
	 * @param motherFullName
	 * @param houseNumberGote
	 * @param preferredContraceptiveMethod
	 * @param phoneNumber
	 */
	public Mother(int id, String motherFullName, String houseNumberGote,
			String preferredContraceptiveMethod, String phoneNumber) {
		this.id = id;
		this.motherFullName = motherFullName;
		this.houseNumberGote = houseNumberGote;
		this.preferredContraceptiveMethod = preferredContraceptiveMethod;
		this.phoneNumber = phoneNumber;
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
	 * @return the motherFullName
	 */
	public String getMotherFullName() {
		return motherFullName;
	}
	/**
	 * @param motherFullName the motherFullName to set
	 */
	public void setMotherFullName(String motherFullName) {
		this.motherFullName = motherFullName;
	}
	/**
	 * @return the houseNumberGote
	 */
	public String getHouseNumberGote() {
		return houseNumberGote;
	}
	/**
	 * @param houseNumberGote the houseNumberGote to set
	 */
	public void setHouseNumberGote(String houseNumberGote) {
		this.houseNumberGote = houseNumberGote;
	}
	/**
	 * @return the preferredContraceptiveMethod
	 */
	public String getPreferredContraceptiveMethod() {
		return preferredContraceptiveMethod;
	}
	/**
	 * @param preferredContraceptiveMethod the preferredContraceptiveMethod to set
	 */
	public void setPreferredContraceptiveMethod(String preferredContraceptiveMethod) {
		this.preferredContraceptiveMethod = preferredContraceptiveMethod;
	}
	/**
	 * @return the phoneNumber
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}
	/**
	 * @param phoneNumber the phoneNumber to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public void addMother(){
		try {
			String command = "insert into tbl_mother values(0,'"+this.getMotherFullName()+"','"+
		this.getHouseNumberGote()+"','"+this.getPreferredContraceptiveMethod()+"','"+this.getPhoneNumber()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateMother(int id,String motherFullName,String houseNumberGote,
			String preferredContraceptiveMethod,String phoneNumber){
		try {
			String command = "update tbl_mother set mother_full_name='"+motherFullName+"', house_number_gote='"+
		houseNumberGote+"', preferred_contraceptive_method='"+preferredContraceptiveMethod+"', phone_number='"+
					phoneNumber+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteMother(int id){
		try {
			String command = "delete from tbl_mother where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Mother> getAllMothers(){
		List<Mother> list = new ArrayList<Mother>();
		Mother mother = null;
		try {
			String query = "select * from tbl_mother order by mother_full_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				mother = new Mother(rSet.getInt("id"),rSet.getString("mother_full_name"), 
						rSet.getString("house_number_gote"), rSet.getString("preferred_contraceptive_method"), 
						rSet.getString("phone_number"));
				list.add(mother);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Mother getMother(int id){
		Mother mother = null;
		try {
			String query = "select * from tbl_mother where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				mother = new Mother(rSet.getInt("id"),rSet.getString("mother_full_name"), 
						rSet.getString("house_number_gote"), rSet.getString("preferred_contraceptive_method"), 
						rSet.getString("phone_number"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return mother;
	}
}//end class
