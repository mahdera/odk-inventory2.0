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
public class GRV {
	private String _uri;
	private String _creator_uri_user;
	private Date _creation_date;
	private String _last_update_uri_user;
	private Date _last_update_date;
	private int _model_version;
	private int _ui_version;
	private String _is_complete;
	private Date _submission_date;
	private Date _marked_as_complete_date;
	private float pills_amount;
	private float condom_amount;
	private float injectable_amount;
	private float implant_amount;
	private Date pillsExpireDate;
	private Date condomExpireDate;
	private Date injectableExpireDate;
	private Date implantExpireDate;
	
	
	
	public GRV() {
	}
	/**
	 * @param _uri
	 * @param _creator_uri_user
	 * @param _creation_date
	 * @param _last_update_uri_user
	 * @param _last_update_date
	 * @param _model_version
	 * @param _ui_version
	 * @param _is_complete
	 * @param submission_date
	 * @param _marked_as_complete_date
	 * @param pills_amount
	 * @param condom_amount
	 * @param injectable_amount
	 * @param implant_amount
	 */
	public GRV(String _uri, String _creator_uri_user, Date _creation_date,
			String _last_update_uri_user, Date _last_update_date,
			int _model_version, int _ui_version, String _is_complete,
			Date _submission_date, Date _marked_as_complete_date,
			float pills_amount, float condom_amount, float injectable_amount,
			float implant_amount,Date pillsExpireDate,Date condomExpireDate,
			Date injectableExpireDate,Date implantExpireDate) {
		this._uri = _uri;
		this._creator_uri_user = _creator_uri_user;
		this._creation_date = _creation_date;
		this._last_update_uri_user = _last_update_uri_user;
		this._last_update_date = _last_update_date;
		this._model_version = _model_version;
		this._ui_version = _ui_version;
		this._is_complete = _is_complete;
		this._submission_date = _submission_date;
		this._marked_as_complete_date = _marked_as_complete_date;
		this.pills_amount = pills_amount;
		this.condom_amount = condom_amount;
		this.injectable_amount = injectable_amount;
		this.implant_amount = implant_amount;
		this.pillsExpireDate = pillsExpireDate;
		this.condomExpireDate = condomExpireDate;
		this.injectableExpireDate = injectableExpireDate;
		this.implantExpireDate = implantExpireDate;
	}
	/**
	 * @return the _uri
	 */
	public String get_uri() {
		return _uri;
	}
	/**
	 * @param _uri the _uri to set
	 */
	public void set_uri(String _uri) {
		this._uri = _uri;
	}
	/**
	 * @return the _creator_uri_user
	 */
	public String get_creator_uri_user() {
		return _creator_uri_user;
	}
	/**
	 * @param _creator_uri_user the _creator_uri_user to set
	 */
	public void set_creator_uri_user(String _creator_uri_user) {
		this._creator_uri_user = _creator_uri_user;
	}
	/**
	 * @return the _creation_date
	 */
	public Date get_creation_date() {
		return _creation_date;
	}
	/**
	 * @param _creation_date the _creation_date to set
	 */
	public void set_creation_date(Date _creation_date) {
		this._creation_date = _creation_date;
	}
	/**
	 * @return the _last_update_uri_user
	 */
	public String get_last_update_uri_user() {
		return _last_update_uri_user;
	}
	/**
	 * @param _last_update_uri_user the _last_update_uri_user to set
	 */
	public void set_last_update_uri_user(String _last_update_uri_user) {
		this._last_update_uri_user = _last_update_uri_user;
	}
	/**
	 * @return the _last_update_date
	 */
	public Date get_last_update_date() {
		return _last_update_date;
	}
	/**
	 * @param _last_update_date the _last_update_date to set
	 */
	public void set_last_update_date(Date _last_update_date) {
		this._last_update_date = _last_update_date;
	}
	/**
	 * @return the _model_version
	 */
	public int get_model_version() {
		return _model_version;
	}
	/**
	 * @param _model_version the _model_version to set
	 */
	public void set_model_version(int _model_version) {
		this._model_version = _model_version;
	}
	/**
	 * @return the _ui_version
	 */
	public int get_ui_version() {
		return _ui_version;
	}
	/**
	 * @param _ui_version the _ui_version to set
	 */
	public void set_ui_version(int _ui_version) {
		this._ui_version = _ui_version;
	}
	/**
	 * @return the _is_complete
	 */
	public String get_is_complete() {
		return _is_complete;
	}
	/**
	 * @param _is_complete the _is_complete to set
	 */
	public void set_is_complete(String _is_complete) {
		this._is_complete = _is_complete;
	}
	/**
	 * @return the submission_date
	 */
	public Date get_submission_date() {
		return _submission_date;
	}
	/**
	 * @param submission_date the submission_date to set
	 */
	public void set_submission_date(Date submission_date) {
		this._submission_date = submission_date;
	}
	/**
	 * @return the _marked_as_complete_date
	 */
	public Date get_marked_as_complete_date() {
		return _marked_as_complete_date;
	}
	/**
	 * @param _marked_as_complete_date the _marked_as_complete_date to set
	 */
	public void set_marked_as_complete_date(Date _marked_as_complete_date) {
		this._marked_as_complete_date = _marked_as_complete_date;
	}
	/**
	 * @return the pills_amount
	 */
	public float getPills_amount() {
		return pills_amount;
	}
	/**
	 * @param pills_amount the pills_amount to set
	 */
	public void setPills_amount(float pills_amount) {
		this.pills_amount = pills_amount;
	}
	/**
	 * @return the condom_amount
	 */
	public float getCondom_amount() {
		return condom_amount;
	}
	/**
	 * @param condom_amount the condom_amount to set
	 */
	public void setCondom_amount(float condom_amount) {
		this.condom_amount = condom_amount;
	}
	/**
	 * @return the injectable_amount
	 */
	public float getInjectable_amount() {
		return injectable_amount;
	}
	/**
	 * @param injectable_amount the injectable_amount to set
	 */
	public void setInjectable_amount(float injectable_amount) {
		this.injectable_amount = injectable_amount;
	}
	/**
	 * @return the implant_amount
	 */
	public float getImplant_amount() {
		return implant_amount;
	}
	/**
	 * @param implant_amount the implant_amount to set
	 */
	public void setImplant_amount(float implant_amount) {
		this.implant_amount = implant_amount;
	}
	
	
	
	/**
	 * @return the pillsExpireDate
	 */
	public Date getPillsExpireDate() {
		return pillsExpireDate;
	}
	/**
	 * @param pillsExpireDate the pillsExpireDate to set
	 */
	public void setPillsExpireDate(Date pillsExpireDate) {
		this.pillsExpireDate = pillsExpireDate;
	}
	/**
	 * @return the condomExpireDate
	 */
	public Date getCondomExpireDate() {
		return condomExpireDate;
	}
	/**
	 * @param condomExpireDate the condomExpireDate to set
	 */
	public void setCondomExpireDate(Date condomExpireDate) {
		this.condomExpireDate = condomExpireDate;
	}
	/**
	 * @return the injectableExpireDate
	 */
	public Date getInjectableExpireDate() {
		return injectableExpireDate;
	}
	/**
	 * @param injectableExpireDate the injectableExpireDate to set
	 */
	public void setInjectableExpireDate(Date injectableExpireDate) {
		this.injectableExpireDate = injectableExpireDate;
	}
	/**
	 * @return the implantExpireDate
	 */
	public Date getImplantExpireDate() {
		return implantExpireDate;
	}
	/**
	 * @param implantExpireDate the implantExpireDate to set
	 */
	public void setImplantExpireDate(Date implantExpireDate) {
		this.implantExpireDate = implantExpireDate;
	}
	public void addGRV() {
		try {
			String command = "insert into build___1354971763_core values('"+
					this.get_uri()+"','"+this.get_creator_uri_user()+"','"+
					this.get_creation_date()+"','"+this.get_last_update_uri_user()+"','"+
					this.get_last_update_date()+"',"+this.get_model_version()+","+
					this.get_ui_version()+",'"+this.get_is_complete()+"','"+
					this.get_submission_date()+"','"+this.get_marked_as_complete_date()+"','"+
					this.getImplantExpireDate()+"','"+this.getPillsExpireDate()+"','"+this.getInjectableExpireDate()+"',"+
					this.getPills_amount()+","+this.getCondom_amount()+",'"+this.getCondomExpireDate()+"',"+this.getInjectable_amount()+","+
					this.getImplant_amount()+")";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateGRV(String _uri,String _creator_uri_user,
			Date _creation_date,String _last_update_uri_user,Date _last_update_date,
			int _model_version,int _ui_version,String _is_compelte,Date _submission_date,
			Date _marked_as_complete_date,float pillsAmount,float condomAmount,
			float injectable_amount,float implantAmount,Date pillsExpireDate,Date condomExpireDate,
			Date injectableExpireDate,Date implantExpireDate) {
		try {
			String command = "update build___1354971763_core set _CREATOR_URI_USER='"+_creator_uri_user+"', _CREATION_DATE='"+_creation_date+"', _LAST_UPDATE_URI_USER = '"+_last_update_uri_user+"', LAST_UPDATE_DATE = '"+
					_last_update_date+"', _MODEL_VERSION = "+_model_version+", _UI_VERSION = "+_ui_version+", _IS_COMPELTE_DATE = '"+
		_is_compelte+"', _SUMBMISSION_DATE='"+_submission_date+"', _MARKED_AS_COMPELETE='"+_marked_as_complete_date+"', PILLS_AMOUNT="+
					pillsAmount+", CONDOM_AMOUNT="+condomAmount+", INJECTABLE_AMOUNT="+injectable_amount+", IMPLANT_AMOUNT="+implantAmount+", "+
		"PILLS_EXPIRE_DATE='"+pillsExpireDate+"',CONDOM_EXPIRE_DATE='"+condomExpireDate+"', INJECTABLE_EXPIRE_DATE='"+injectableExpireDate+"', IMPLANT_EXPIRE_DATE='"+
					implantExpireDate+"' WHERE _URI = '"+_uri+"'";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteGRV(String _uri,String _creator_uri_user,Date _creation_date) {
		try {
			String command = "delete from build___1354971763_core where _URI = '"+_uri+"'";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<GRV> getAllGRVsFilledByODKUser(String odkUser){
		List<GRV> list = new ArrayList<GRV>();
		GRV grv = null;
		try {
			String query = "select * from build___1354971763_core where _CREATOR_URI_USER = '"+odkUser+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				grv = new GRV(rSet.getString("_uri"), rSet.getString("_creator_uri_user"), rSet.getDate("_creation_date"), 
						rSet.getString("_last_update_uri_user"), rSet.getDate("_last_update_date"), rSet.getInt("_model_version"), 
						rSet.getInt("_ui_version"), rSet.getString("_is_complete"), rSet.getDate("_submission_date"), 
						rSet.getDate("_marked_as_complete_date"), rSet.getFloat("pills_amount"), 
						rSet.getFloat("condom_amount"), rSet.getFloat("injectable_amount"), 
						rSet.getFloat("implant_amount"), rSet.getDate("pills_expire_date"), rSet.getDate("condom_expire_date"), 
						rSet.getDate("injectable_expire_date"), rSet.getDate("implant_expire_date"));
				list.add(grv);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static List<GRV> getAllGRVs() {
		List<GRV> list = new ArrayList<GRV>();
		GRV grv = null;
		try {
			String query = "select * from build___1354971763_core order by _CREATION_DATE desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				grv = new GRV(rSet.getString("_uri"), rSet.getString("_creator_uri_user"), rSet.getDate("_creation_date"), 
						rSet.getString("_last_update_uri_user"), rSet.getDate("_last_update_date"), rSet.getInt("_model_version"), 
						rSet.getInt("_ui_version"), rSet.getString("_is_complete"), rSet.getDate("_submission_date"), 
						rSet.getDate("_marked_as_complete_date"), rSet.getFloat("pills_amount"), 
						rSet.getFloat("condom_amount"), rSet.getFloat("injectable_amount"), 
						rSet.getFloat("implant_amount"), rSet.getDate("pills_expire_date"), rSet.getDate("condom_expire_date"), 
						rSet.getDate("injectable_expire_date"), rSet.getDate("implant_expire_date"));
				list.add(grv);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static GRV getGRVWithURI(String _uri){
		GRV grv = null;
		try {
			String query = "select * from build___1354971763_core where _uri = '"+_uri+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				grv = new GRV(rSet.getString("_uri"), rSet.getString("_creator_uri_user"), rSet.getDate("_creation_date"), 
						rSet.getString("_last_update_uri_user"), rSet.getDate("_last_update_date"), rSet.getInt("_model_version"), 
						rSet.getInt("_ui_version"), rSet.getString("_is_complete"), rSet.getDate("_submission_date"), 
						rSet.getDate("_marked_as_complete_date"), rSet.getFloat("pills_amount"), 
						rSet.getFloat("condom_amount"), rSet.getFloat("injectable_amount"), 
						rSet.getFloat("implant_amount"), rSet.getDate("pills_expire_date"), rSet.getDate("condom_expire_date"), 
						rSet.getDate("injectable_expire_date"), rSet.getDate("implant_expire_date"));				
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return grv;
	}
	
	public static void updateGRVWithURI(String _uri,float pillsAmount,float condomAmount,float injectableAmount,float implantAmount,Date pillsExpireDate,
			Date condomExpireDate,Date injectableExpireDate,Date implantExpireDate){
		try{
			String command = "update build___1354971763_core set pills_amount="+pillsAmount+
					", condom_amount="+condomAmount+", injectable_amount="+injectableAmount+", implant_amount="+
					implantAmount+", pills_expire_date='"+pillsExpireDate+"', condom_expire_date='"+condomExpireDate+"',"+
					"injectable_expire_date='"+injectableExpireDate+"', implant_expire_date='"+implantExpireDate+"' where _uri='"+
					_uri+"'";
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteGRVWithURI(String _uri){
		try{
			String command = "delete from build___1354971763_core where _uri = '"+_uri+"'";
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
	
	public static float getItemReceivedQuantityForThis_URIAndThisItemDuringThisPeriod(String _uri,String itemCode,Date fromDate,Date toDate){
		float qty = 0.0f;
		try{
			String query = "select sum("+itemCode+") as q from build___1354971763_core where _CREATOR_URI_USER = '"+_uri+"' "+
			"and _submission_date between '"+fromDate+"' and '"+toDate+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				qty = rSet.getFloat("q");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return qty;
	}
	
	public static float getTotalReceivedAmountsForThisItemByThisUserDuringThisPeriod(String itemCode,String userURI,
			Date fromDate,Date toDate){
		float amt=0.0f;
		try{
			String query = "select sum("+itemCode+") as a from build___1354971763_core where _CREATOR_URI_USER = '"+
		userURI+"' and _SUBMISSION_DATE between '"+fromDate+"' and '"+toDate+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				amt = rSet.getFloat("a");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return amt;
	}
	
	public static float getTheTotalReceivedQuantityForThisItemByThisCreatorUser(String itemCode,String creatorUser){
		float totalQty = 0.0f;
		try{
			String query = "select sum("+itemCode+") as a from build___1354971763_core where _CREATOR_URI_USER = '"+
			creatorUser+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				totalQty = rSet.getFloat("a");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return totalQty;
	}
}//end class
