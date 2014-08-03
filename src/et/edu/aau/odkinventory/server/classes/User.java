/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author mahder
 * 
 */
public class User {
	private int id;
	private String firstName;
	private String middleName;
	private String lastName;
	private String userType;
	
	
	public User() {
	}

	/**
	 * @param branchId
	 * @param firstName
	 * @param middleName
	 * @param lastName
	 */
	public User(String firstName, String middleName,
			String lastName,String userType) {
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.userType = userType;
	}

	/**
	 * @param id
	 * @param branchId
	 * @param firstName
	 * @param middleName
	 * @param lastName
	 */
	public User(int id, String firstName, String middleName,
			String lastName,String userType) {
		this.id = id;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.userType = userType;
	}
	
	

	/**
	 * @return the userType
	 */
	public String getUserType() {
		return userType;
	}

	/**
	 * @param userType the userType to set
	 */
	public void setUserType(String userType) {
		this.userType = userType;
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
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName
	 *            the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the middleName
	 */
	public String getMiddleName() {
		return middleName;
	}

	/**
	 * @param middleName
	 *            the middleName to set
	 */
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName
	 *            the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void addUser() {
		try {
			String command = "insert into tbl_user values(0,'"+this.getFirstName()+"','"+this.getMiddleName()+"','"+this.getLastName()+"','"+
			this.getUserType()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateUser(int id,String firstName,
			String middleName, String lastName,String userType) {
		try {
			String command = "update tbl_user set first_name='"+
			firstName+"', middle_name='"+middleName+"', last_name='"+lastName+"', user_type = '"+userType+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteUser(int id) {
		try {
			String command = "delete from tbl_user where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<User> getAllUsers() {
		List<User> list = new ArrayList<User>();
		User user = null;
		try {
			String query = "select * from tbl_user order by first_name,middle_name,last_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("first_name"),rSet.getString("middle_name"),
						rSet.getString("last_name"),rSet.getString("user_type"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static User getUser(int id) {
		User user = null;
		try {
			String query = "select * from tbl_user where id = "+id;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),
						rSet.getString("first_name"),rSet.getString("middle_name"),
						rSet.getString("last_name"),rSet.getString("user_type"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return user;
	}
	
	public static User getUserWith(String firstName,String fatherName,String grandFatherName,String userType) {
		User user = null;
		try {
			String query = "select * from tbl_user where first_name='"+firstName+"' and "+
			"middle_name='"+fatherName+"' and last_name='"+grandFatherName+"' and user_type='"+userType+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("first_name"),rSet.getString("middle_name"),
						rSet.getString("last_name"),rSet.getString("user_type"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return user;
	}
	
	public static List<User> getAllUsersWithUserType(String userType){
		List<User> list = new ArrayList<User>();
		User user = null;
		try {
			String query = "select * from tbl_user where user_type = '"+userType+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("first_name"),rSet.getString("middle_name"),
						rSet.getString("last_name"),rSet.getString("user_type"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<User> getAllUsersWithThisUserTypeInThisBranch(String userType,int branchId){
		List<User> list = new ArrayList<User>();
		User user = null;
		try{
			String query = "select * from tbl_user where user_type='"+userType+"' and branch_id="+branchId;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("first_name"),
						rSet.getString("middle_name"),rSet.getString("last_name"),
						rSet.getString("user_type"));
				list.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
