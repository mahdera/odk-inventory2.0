/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author alemayehu
 *
 */
public class RegisteredUsers {
	private String _URI;
	private String _CREATOR_URI_USER;
	private Date _CREATION_DATE;
	private String _LAST_UPDATE_URI_USER;
	private Date _LAST_UPDATE_DATE;
	private String LOCAL_USERNAME;
	private String OPENID_EMAIL;
	private String FULL_NAME;
	private String BASIC_AUTH_PASSWORD;
	private String BASIC_AUTH_SALT;
	private String DIGEST_AUTH_PASSWORD;
	private String IS_REMOVED;
	
	
	public RegisteredUsers() {
	}
	/**
	 * @param _URI
	 * @param _CREATOR_URI_USER
	 * @param _CREATION_DATE
	 * @param _LAST_UPDATE_URI_USER
	 * @param _LAST_UPDATE_DATE
	 * @param lOCAL_USERNAME
	 * @param oPENID_EMAIL
	 * @param fULL_NAME
	 * @param bASIC_AUTH_PASSWORD
	 * @param bASIC_AUTH_SALT
	 * @param dIGEST_AUTH_PASSWORD
	 * @param iS_REMOVED
	 */
	public RegisteredUsers(String _URI, String _CREATOR_URI_USER,
			Date _CREATION_DATE, String _LAST_UPDATE_URI_USER,
			Date _LAST_UPDATE_DATE, String lOCAL_USERNAME, String oPENID_EMAIL,
			String fULL_NAME, String bASIC_AUTH_PASSWORD,
			String bASIC_AUTH_SALT, String dIGEST_AUTH_PASSWORD,
			String iS_REMOVED) {
		this._URI = _URI;
		this._CREATOR_URI_USER = _CREATOR_URI_USER;
		this._CREATION_DATE = _CREATION_DATE;
		this._LAST_UPDATE_URI_USER = _LAST_UPDATE_URI_USER;
		this._LAST_UPDATE_DATE = _LAST_UPDATE_DATE;
		LOCAL_USERNAME = lOCAL_USERNAME;
		OPENID_EMAIL = oPENID_EMAIL;
		FULL_NAME = fULL_NAME;
		BASIC_AUTH_PASSWORD = bASIC_AUTH_PASSWORD;
		BASIC_AUTH_SALT = bASIC_AUTH_SALT;
		DIGEST_AUTH_PASSWORD = dIGEST_AUTH_PASSWORD;
		IS_REMOVED = iS_REMOVED;
	}
	/**
	 * @return the _URI
	 */
	public String get_URI() {
		return _URI;
	}
	/**
	 * @param _URI the _URI to set
	 */
	public void set_URI(String _URI) {
		this._URI = _URI;
	}
	/**
	 * @return the _CREATOR_URI_USER
	 */
	public String get_CREATOR_URI_USER() {
		return _CREATOR_URI_USER;
	}
	/**
	 * @param _CREATOR_URI_USER the _CREATOR_URI_USER to set
	 */
	public void set_CREATOR_URI_USER(String _CREATOR_URI_USER) {
		this._CREATOR_URI_USER = _CREATOR_URI_USER;
	}
	/**
	 * @return the _CREATION_DATE
	 */
	public Date get_CREATION_DATE() {
		return _CREATION_DATE;
	}
	/**
	 * @param _CREATION_DATE the _CREATION_DATE to set
	 */
	public void set_CREATION_DATE(Date _CREATION_DATE) {
		this._CREATION_DATE = _CREATION_DATE;
	}
	/**
	 * @return the _LAST_UPDATE_URI_USER
	 */
	public String get_LAST_UPDATE_URI_USER() {
		return _LAST_UPDATE_URI_USER;
	}
	/**
	 * @param _LAST_UPDATE_URI_USER the _LAST_UPDATE_URI_USER to set
	 */
	public void set_LAST_UPDATE_URI_USER(String _LAST_UPDATE_URI_USER) {
		this._LAST_UPDATE_URI_USER = _LAST_UPDATE_URI_USER;
	}
	/**
	 * @return the _LAST_UPDATE_DATE
	 */
	public Date get_LAST_UPDATE_DATE() {
		return _LAST_UPDATE_DATE;
	}
	/**
	 * @param _LAST_UPDATE_DATE the _LAST_UPDATE_DATE to set
	 */
	public void set_LAST_UPDATE_DATE(Date _LAST_UPDATE_DATE) {
		this._LAST_UPDATE_DATE = _LAST_UPDATE_DATE;
	}
	/**
	 * @return the lOCAL_USERNAME
	 */
	public String getLOCAL_USERNAME() {
		return LOCAL_USERNAME;
	}
	/**
	 * @param lOCAL_USERNAME the lOCAL_USERNAME to set
	 */
	public void setLOCAL_USERNAME(String lOCAL_USERNAME) {
		LOCAL_USERNAME = lOCAL_USERNAME;
	}
	/**
	 * @return the oPENID_EMAIL
	 */
	public String getOPENID_EMAIL() {
		return OPENID_EMAIL;
	}
	/**
	 * @param oPENID_EMAIL the oPENID_EMAIL to set
	 */
	public void setOPENID_EMAIL(String oPENID_EMAIL) {
		OPENID_EMAIL = oPENID_EMAIL;
	}
	/**
	 * @return the fULL_NAME
	 */
	public String getFULL_NAME() {
		return FULL_NAME;
	}
	/**
	 * @param fULL_NAME the fULL_NAME to set
	 */
	public void setFULL_NAME(String fULL_NAME) {
		FULL_NAME = fULL_NAME;
	}
	/**
	 * @return the bASIC_AUTH_PASSWORD
	 */
	public String getBASIC_AUTH_PASSWORD() {
		return BASIC_AUTH_PASSWORD;
	}
	/**
	 * @param bASIC_AUTH_PASSWORD the bASIC_AUTH_PASSWORD to set
	 */
	public void setBASIC_AUTH_PASSWORD(String bASIC_AUTH_PASSWORD) {
		BASIC_AUTH_PASSWORD = bASIC_AUTH_PASSWORD;
	}
	/**
	 * @return the bASIC_AUTH_SALT
	 */
	public String getBASIC_AUTH_SALT() {
		return BASIC_AUTH_SALT;
	}
	/**
	 * @param bASIC_AUTH_SALT the bASIC_AUTH_SALT to set
	 */
	public void setBASIC_AUTH_SALT(String bASIC_AUTH_SALT) {
		BASIC_AUTH_SALT = bASIC_AUTH_SALT;
	}
	/**
	 * @return the dIGEST_AUTH_PASSWORD
	 */
	public String getDIGEST_AUTH_PASSWORD() {
		return DIGEST_AUTH_PASSWORD;
	}
	/**
	 * @param dIGEST_AUTH_PASSWORD the dIGEST_AUTH_PASSWORD to set
	 */
	public void setDIGEST_AUTH_PASSWORD(String dIGEST_AUTH_PASSWORD) {
		DIGEST_AUTH_PASSWORD = dIGEST_AUTH_PASSWORD;
	}
	/**
	 * @return the iS_REMOVED
	 */
	public String getIS_REMOVED() {
		return IS_REMOVED;
	}
	/**
	 * @param iS_REMOVED the iS_REMOVED to set
	 */
	public void setIS_REMOVED(String iS_REMOVED) {
		IS_REMOVED = iS_REMOVED;
	}
	
	public void addRegisteredUsers(){
		try{
			String command = "insert into _registered_users values('"+this.get_URI()+"','"+
		this.get_CREATOR_URI_USER()+"','"+this.get_CREATION_DATE()+"','"+
					this.get_LAST_UPDATE_URI_USER()+"','"+this.get_LAST_UPDATE_DATE()+"','"+
		this.getLOCAL_USERNAME()+"','"+this.getOPENID_EMAIL()+"','"+this.getFULL_NAME()+"',' MD5('"+
		this.getBASIC_AUTH_PASSWORD()+"'), '"+this.getBASIC_AUTH_SALT()+"','"+
		this.getDIGEST_AUTH_PASSWORD()+"','"+this.getIS_REMOVED()+"')";
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateRegisteredUsers(){
		
	}
	
	public static void deleteRegisteredUsers(String _URI){
		try{
			String command = "delete from _registered_users where _uri = '"+_URI+"'";
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<RegisteredUsers> getAllRegisteredUsers(){
		List<RegisteredUsers> list = new ArrayList<RegisteredUsers>();
		RegisteredUsers registeredUsers;
		try{
			String query = "select * from _registered_users order by LOCAL_USERNAME asc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				registeredUsers = new RegisteredUsers(rSet.getString("_URI"), 
						rSet.getString("_CREATOR_URI_USER"), rSet.getDate("_CREATION_DATE"),
						rSet.getString("_LAST_UPDATE_URI_USER"), rSet.getDate("_LAST_UPDATE_DATE"), 
						rSet.getString("lOCAL_USERNAME"), rSet.getString("oPENID_EMAIL"), 
						rSet.getString("fULL_NAME"), rSet.getString("bASIC_AUTH_PASSWORD"), 
						rSet.getString("bASIC_AUTH_SALT"), rSet.getString("dIGEST_AUTH_PASSWORD"), 
						rSet.getString("iS_REMOVED"));
				list.add(registeredUsers);
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static RegisteredUsers getRegisteredUsers(String LOCAL_USERNAME, String BASIC_AUTH_PASSWORD){
		RegisteredUsers registeredUsers = null;
		try{
			String query = "select * from _registered_users where LOCAL_USERNAME='"+LOCAL_USERNAME+"' AND BASIC_AUTH_PASSWORD='"+BASIC_AUTH_PASSWORD+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				registeredUsers = new RegisteredUsers(rSet.getString("_URI"), 
						rSet.getString("_CREATOR_URI_USER"), rSet.getDate("_CREATION_DATE"),
						rSet.getString("_LAST_UPDATE_URI_USER"), rSet.getDate("_LAST_UPDATE_DATE"), 
						rSet.getString("lOCAL_USERNAME"), rSet.getString("oPENID_EMAIL"), 
						rSet.getString("fULL_NAME"), rSet.getString("bASIC_AUTH_PASSWORD"), 
						rSet.getString("bASIC_AUTH_SALT"), rSet.getString("dIGEST_AUTH_PASSWORD"), 
						rSet.getString("iS_REMOVED"));				
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return registeredUsers;
	}
	
	public static RegisteredUsers getRegisteredUser(String _uri){
		RegisteredUsers registeredUsers = null;
		try{
			String query = "select * from _registered_users where _uri = '"+_uri+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				registeredUsers = new RegisteredUsers(rSet.getString("_URI"), 
						rSet.getString("_CREATOR_URI_USER"), rSet.getDate("_CREATION_DATE"),
						rSet.getString("_LAST_UPDATE_URI_USER"), rSet.getDate("_LAST_UPDATE_DATE"), 
						rSet.getString("lOCAL_USERNAME"), rSet.getString("oPENID_EMAIL"), 
						rSet.getString("fULL_NAME"), rSet.getString("bASIC_AUTH_PASSWORD"), 
						rSet.getString("bASIC_AUTH_SALT"), rSet.getString("dIGEST_AUTH_PASSWORD"), 
						rSet.getString("iS_REMOVED"));				
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return registeredUsers;
	}
	
	public static RegisteredUsers getRegisteredUserUsingLocalUsername(String localUsername){
		RegisteredUsers registeredUsers = null;
		try{
			String query = "select * from _registered_users where local_username = '"+localUsername+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				registeredUsers = new RegisteredUsers(rSet.getString("_URI"), 
						rSet.getString("_CREATOR_URI_USER"), rSet.getDate("_CREATION_DATE"),
						rSet.getString("_LAST_UPDATE_URI_USER"), rSet.getDate("_LAST_UPDATE_DATE"), 
						rSet.getString("lOCAL_USERNAME"), rSet.getString("oPENID_EMAIL"), 
						rSet.getString("fULL_NAME"), rSet.getString("bASIC_AUTH_PASSWORD"), 
						rSet.getString("bASIC_AUTH_SALT"), rSet.getString("dIGEST_AUTH_PASSWORD"), 
						rSet.getString("iS_REMOVED"));				
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return registeredUsers;
	}
}//end class
