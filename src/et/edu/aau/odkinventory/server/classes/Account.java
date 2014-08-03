/**
 * 
 */
package et.edu.aau.odkinventory.server.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * @author mahder
 * 
 */
public class Account {
	private int accountId;
	private int userId;
	private String username;
	private String password;
	private Date accountCreationDate;

	public Account() {
	}

	public Account(int userId, String username, String password) {
		this.username = username;
		this.password = password;
		
		java.util.Date d = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String currentDate = dateFormat.format(cal.getTime());
		System.out.println(currentDate);
		accountCreationDate = Date.valueOf(currentDate);
		this.userId = userId;
	}

	public Account(int accountId, int userId, String username, String password,
			Date accountCreationDate) {
		this.accountId = accountId;
		this.username = username;
		this.password = password;
		this.accountCreationDate = accountCreationDate;
		this.userId = userId;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public Date getAccountCreationDate() {
		return accountCreationDate;
	}

	public void setAccountCreationDate(Date accountCreationDate) {
		this.accountCreationDate = accountCreationDate;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void addAccount() {
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar cal = Calendar.getInstance();
			System.out.println(dateFormat.format(cal.getTime()));
			String sqlStr = "insert into tbl_account values(?,?,?,?,NOW(),?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);			 
			String passwordString = "MD5('"+this.getPassword()+"')";
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getUserId());
			pStmt.setString(3, this.getUsername());
			pStmt.setString(4, passwordString);
			//pStmt.setDate(5, java.sql.Date.valueOf(dateFormat.format(cal.getTime())));
			pStmt.setString(5, "Approved");	
			DBConnection.writeToDatabaseSec(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteAccount(int id) {
		try {
			String sqlStr = "delete from tbl_account where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabaseSec(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateAccount(int id, int userId, String username,
			String password, Date acctCreationDate) {
		try {
			String sqlStr = "update tbl_account set user_id = ?, username = ?, password = ?, account_creation_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, userId);
			pStmt.setString(2, username);
			pStmt.setString(3, "MD5('"+password+"')");
			pStmt.setDate(4, acctCreationDate);
			pStmt.setInt(5, id);
			DBConnection.writeToDatabaseSec(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Account> getAllAccounts() {
		List<Account> list = new ArrayList<Account>();
		Account account = null;
		try {
			String sqlStr = "select * from tbl_account";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			ResultSet rSet = DBConnection.readFromDatabaseSec(pStmt);
			
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),
						rSet.getDate("account_creation_date"));
				list.add(account);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static List<Account> getAccountsForApproval() {
		List<Account> list = new ArrayList<Account>();
		Account account = null;
		try {
			String sqlStr = "select * from tbl_account where status = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, "Not Approved");			
			
			ResultSet rSet = DBConnection.readFromDatabaseSec(pStmt);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),
						rSet.getDate("account_creation_date"));
				list.add(account);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Account getApprovedAccount(int id) {
		Account account = null;
		try {
			String sqlStr = "select * from tbl_account where id = ? and status = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			pStmt.setString(2, "Approved");		
			
			ResultSet rSet = DBConnection.readFromDatabaseSec(pStmt);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),
						rSet.getDate("account_creation_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return account;
	}

	public static Account getAccount(String username, String password,
			String memberType) {
		Account account = null;
		try {
			String sqlStr = "select * from tbl_account where username = ? and password = ? and member_type = ? and status = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, username);
			pStmt.setString(2, "MD5('"+password+"')");
			pStmt.setString(3, memberType);
			pStmt.setString(4, "Approved");
			
			ResultSet rSet = DBConnection.readFromDatabaseSec(pStmt);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),
						rSet.getDate("account_creation_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return account;
	}

	public static Account getAccountForUser(int userId) {
		Account account = null;
		try {
			String sqlStr = "select * from tbl_account where user_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, userId);			
			ResultSet rSet = DBConnection.readFromDatabaseSec(pStmt);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),
						rSet.getDate("account_creation_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return account;
	}

	public static Account getAccount(String username, String password) {
		Account account = null;
		try {
			//System.out.println(username+" : "+password);
			String sqlStr = "select tbl_account.* from tbl_account, tbl_user where username = ? and password = MD5(?) and tbl_account.user_id = tbl_user.id";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			
			pStmt.setString(1, username);
			pStmt.setString(2, password);			
			
			ResultSet rSet = DBConnection.readFromDatabaseSec(pStmt);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),
						rSet.getDate("account_creation_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return account;
	}

	public static boolean isThereAnAccount(int accountId, String username,
			String password) {
		boolean isThereAcct = false;
		try {
			String sqlStr = "select count(*) as num from tbl_account where username = ? and password = ? and id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, username);
			pStmt.setString(2, password);
			pStmt.setInt(3, accountId);			
			
			ResultSet rSet = DBConnection.readFromDatabaseSec(pStmt);
			int num = 0;
			while (rSet.next()) {
				num = rSet.getInt("num");
				if (num != 0)
					isThereAcct = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return isThereAcct;
	}

	public static void updateUsername(int accountId, String currentUsername,
			String newUsername, String currentPassword) {
		try {
			String sqlStr = "update tbl_account set username = ? where id = ? and username = ? and password = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, newUsername);
			pStmt.setInt(2, accountId);
			pStmt.setString(3, currentUsername);
			pStmt.setString(4, currentPassword);
			
			DBConnection.writeToDatabaseSec(pStmt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		
	}

	public static void updatePassword(int accountId, String currentUsername,
			String currentPassword, String newPassword, String confirmPassword) {
		if (newPassword.equals(confirmPassword)) {
			try {
				String sqlStr = "update tbl_account set password = md5(?) where id = ? and username = ? and password = md5(?)";
				PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
				pStmt.setString(1, newPassword);
				pStmt.setInt(2, accountId);
				pStmt.setString(3, currentUsername);
				pStmt.setString(4, "MD5('"+currentPassword+"')");			
				
				DBConnection.writeToDatabaseSec(pStmt);
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				DBConnection.disconnectDatabase();
			}
		}
	}

	@Override
	public String toString() {
		return "Account{" + "accountId=" + accountId + "\nuserId=" + userId
				+ "\nusername=" + username + "\npassword=" + password
				+ "\naccountCreationDate=" + accountCreationDate + '}';
	}

	public static int getMaxAccountIdValue() {
		int maxId = 0;
		try {
			String query = "SELECT MAX(id) AS m FROM tbl_account";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				maxId = rSet.getInt("m");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return maxId;
	}

	public static Account getAccount(int accountId) {
		Account account = null;
		try {
			String sqlStr = "select * from tbl_account where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, accountId);
			
			ResultSet rSet = DBConnection.readFromDatabaseSec(pStmt);
			while (rSet.next()) {
				account = new Account(rSet.getInt("id"),
						rSet.getInt("user_id"), rSet.getString("username"),
						rSet.getString("password"),
						rSet.getDate("account_creation_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return account;
	}

	public static void changeUsername(String currentUsername,
			String newUsername, String password) {
		try {
			String sqlStr = "update tbl_account set username = ? where username = ? and password = md5(?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, newUsername);
			pStmt.setString(2, currentUsername);
			pStmt.setString(3, password);
			DBConnection.writeToDatabaseSec(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void changePassword(String currentUsername,
			String currentPassword, String newPassword) {
		try {
			String sqlStr = "update tbl_account set password = md5(?) where username= ? and password = md5(?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, newPassword);
			pStmt.setString(2, currentUsername);
			pStmt.setString(3, currentPassword);			
			DBConnection.writeToDatabaseSec(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteAccountForUser(int userId) {
		try {
			String sqlStr = "delete from tbl_account where user_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, userId);
			DBConnection.writeToDatabaseSec(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void resetThisAccount(int accountId, String username,
			String password) {
		try {
			String sqlStr = "update tbl_account set username = ?, password = md5(?) where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, username);
			pStmt.setString(2, password);
			pStmt.setInt(3, accountId);
			DBConnection.writeToDatabaseSec(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static boolean isThereAnAccountWithThisUsernameAndPassword(String username,String password){
		boolean isThere = false;
		int c = 0;
		try{
			String sqlStr = "select count(*) as c from tbl_account where username = ? and password = md5(?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, username);
			pStmt.setString(2, password);
			ResultSet rSet = DBConnection.readFromDatabaseSec(pStmt);			
			while(rSet.next()){
				c = rSet.getInt("c");
				if(c != 0)
					isThere = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return isThere;
	}
}// end class
