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
public class Schedule {
	private long id;
	private int motherId;
	private Date lastVisitDate;
	private Date nextScheduledDate;
	private Date actualVisitDate;
	/**
	 * @param motherId
	 * @param lastVisitDate
	 * @param nextScheduledDate
	 * @param actualVisitDate
	 */
	public Schedule(int motherId, Date lastVisitDate, Date nextScheduledDate,
			Date actualVisitDate) {
		this.motherId = motherId;
		this.lastVisitDate = lastVisitDate;
		this.nextScheduledDate = nextScheduledDate;
		this.actualVisitDate = actualVisitDate;
	}
	/**
	 * @param id
	 * @param motherId
	 * @param lastVisitDate
	 * @param nextScheduledDate
	 * @param actualVisitDate
	 */
	public Schedule(long id, int motherId, Date lastVisitDate,
			Date nextScheduledDate, Date actualVisitDate) {
		this.id = id;
		this.motherId = motherId;
		this.lastVisitDate = lastVisitDate;
		this.nextScheduledDate = nextScheduledDate;
		this.actualVisitDate = actualVisitDate;
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
	 * @return the motherId
	 */
	public int getMotherId() {
		return motherId;
	}
	/**
	 * @param motherId the motherId to set
	 */
	public void setMotherId(int motherId) {
		this.motherId = motherId;
	}
	/**
	 * @return the lastVisitDate
	 */
	public Date getLastVisitDate() {
		return lastVisitDate;
	}
	/**
	 * @param lastVisitDate the lastVisitDate to set
	 */
	public void setLastVisitDate(Date lastVisitDate) {
		this.lastVisitDate = lastVisitDate;
	}
	/**
	 * @return the nextScheduledDate
	 */
	public Date getNextScheduledDate() {
		return nextScheduledDate;
	}
	/**
	 * @param nextScheduledDate the nextScheduledDate to set
	 */
	public void setNextScheduledDate(Date nextScheduledDate) {
		this.nextScheduledDate = nextScheduledDate;
	}
	/**
	 * @return the actualVisitDate
	 */
	public Date getActualVisitDate() {
		return actualVisitDate;
	}
	/**
	 * @param actualVisitDate the actualVisitDate to set
	 */
	public void setActualVisitDate(Date actualVisitDate) {
		this.actualVisitDate = actualVisitDate;
	}
	
	public void addSchedule(){
		try {
			String command = "insert into tbl_schedule values(0,"+this.getMotherId()+",'"+this.getLastVisitDate()+"','"+
		this.getNextScheduledDate()+"','"+this.getActualVisitDate()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateSchedule(long id,Date lastVisitDate,Date nextScheduledDate,Date actualVisitDate){
		try {
			String command = "update tbl_schedule set last_visit_date='"+lastVisitDate+"', next_scheduled_date='"+
		nextScheduledDate+"', actual_visit_date='"+actualVisitDate+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteSchedule(long id){
		try {
			String command = "delete from tbl_schedule where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Schedule> getAllSchedules(){
		List<Schedule> list = new ArrayList<Schedule>();
		Schedule schedule = null;
		try {
			String query = "select * from tbl_schedule order by id desc";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				schedule = new Schedule(rSet.getLong("id"),rSet.getInt("mother_id"),rSet.getDate("last_visit_date"),
						rSet.getDate("next_scheduled_date"),rSet.getDate("actual_visit_date"));
				list.add(schedule);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Schedule> getAllSchedulesOfThisMother(int motherId){
		List<Schedule> list = new ArrayList<Schedule>();
		Schedule schedule = null;
		try {
			String query = "select * from tbl_schedule where mother_id = "+motherId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				schedule = new Schedule(rSet.getLong("id"),rSet.getInt("mother_id"),rSet.getDate("last_visit_date"),
						rSet.getDate("next_scheduled_date"),rSet.getDate("actual_visit_date"));
				list.add(schedule);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Schedule getSchedule(long id){
		Schedule schedule = null;
		try {
			String query = "select * from tbl_schedule where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				schedule = new Schedule(rSet.getLong("id"),rSet.getInt("mother_id"),rSet.getDate("last_visit_date"),
						rSet.getDate("next_scheduled_date"),rSet.getDate("actual_visit_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return schedule;
	}
}//end class
