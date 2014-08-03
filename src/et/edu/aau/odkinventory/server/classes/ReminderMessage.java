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
public class ReminderMessage {
	private long id;
	private long scheduleId;
	private String messageContent;
	private boolean isMessageSent;
	private Date sentDate;
	private boolean isMessageDelivered;
	private Date deliveredDate;
	
	

	public ReminderMessage() {
	}

	/**
	 * @param scheduleId
	 * @param messageContent
	 * @param isMessageSent
	 * @param sentDate
	 * @param isMessageDelivered
	 * @param deliveredDate
	 */
	public ReminderMessage(long scheduleId, String messageContent,
			boolean isMessageSent, Date sentDate, boolean isMessageDelivered,
			Date deliveredDate) {
		this.scheduleId = scheduleId;
		this.messageContent = messageContent;
		this.isMessageSent = isMessageSent;
		this.sentDate = sentDate;
		this.isMessageDelivered = isMessageDelivered;
		this.deliveredDate = deliveredDate;
	}

	/**
	 * @param id
	 * @param scheduleId
	 * @param messageContent
	 * @param isMessageSent
	 * @param sentDate
	 * @param isMessageDelivered
	 * @param deliveredDate
	 */
	public ReminderMessage(long id, long scheduleId, String messageContent,
			boolean isMessageSent, Date sentDate, boolean isMessageDelivered,
			Date deliveredDate) {
		this.id = id;
		this.scheduleId = scheduleId;
		this.messageContent = messageContent;
		this.isMessageSent = isMessageSent;
		this.sentDate = sentDate;
		this.isMessageDelivered = isMessageDelivered;
		this.deliveredDate = deliveredDate;
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
	 * @return the scheduleId
	 */
	public long getScheduleId() {
		return scheduleId;
	}

	/**
	 * @param scheduleId
	 *            the scheduleId to set
	 */
	public void setScheduleId(long scheduleId) {
		this.scheduleId = scheduleId;
	}

	/**
	 * @return the messageContent
	 */
	public String getMessageContent() {
		return messageContent;
	}

	/**
	 * @param messageContent
	 *            the messageContent to set
	 */
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	/**
	 * @return the isMessageSent
	 */
	public boolean isMessageSent() {
		return isMessageSent;
	}

	/**
	 * @param isMessageSent
	 *            the isMessageSent to set
	 */
	public void setMessageSent(boolean isMessageSent) {
		this.isMessageSent = isMessageSent;
	}

	/**
	 * @return the sentDate
	 */
	public Date getSentDate() {
		return sentDate;
	}

	/**
	 * @param sentDate
	 *            the sentDate to set
	 */
	public void setSentDate(Date sentDate) {
		this.sentDate = sentDate;
	}

	/**
	 * @return the isMessageDelivered
	 */
	public boolean isMessageDelivered() {
		return isMessageDelivered;
	}

	/**
	 * @param isMessageDelivered
	 *            the isMessageDelivered to set
	 */
	public void setMessageDelivered(boolean isMessageDelivered) {
		this.isMessageDelivered = isMessageDelivered;
	}

	/**
	 * @return the deliveredDate
	 */
	public Date getDeliveredDate() {
		return deliveredDate;
	}

	/**
	 * @param deliveredDate
	 *            the deliveredDate to set
	 */
	public void setDeliveredDate(Date deliveredDate) {
		this.deliveredDate = deliveredDate;
	}

	public void addReminderMessage() {
		try {
			String command = "insert into tbl_reminder_message values(0,"+this.getScheduleId()+",'"+
		this.getMessageContent()+"',"+this.isMessageSent+",'"+this.getSentDate()+"',"+this.isMessageDelivered+",'"+
					this.getDeliveredDate()+"')";
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateReminderMessage(long id,String messageContent,boolean isMessageSent,
			Date sentDate,boolean isMessageDelivered,Date deliveredDate) {
		try {
			String command = "update tbl_reminder_message set message_content='"+messageContent+"', is_message_sent="+
		isMessageSent+", sent_date='"+sentDate+"', is_message_delivered="+isMessageDelivered+", delivered_date='"+
					deliveredDate+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteReminderMessage(long id) {
		try {
			String command = "delete from tbl_reminder_message where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<ReminderMessage> getAllReminderMessages() {
		List<ReminderMessage> list = new ArrayList<ReminderMessage>();
		ReminderMessage reminderMessage = null;
		try {
			String query = "select * from tbl_reminder_message";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				reminderMessage = new ReminderMessage(rSet.getLong("id"), rSet.getLong("schedule_id"), 
						rSet.getString("message_content"), rSet.getBoolean("is_message_sent"), 
						rSet.getDate("sent_date"), rSet.getBoolean("is_message_delivered"), rSet.getDate("delivered_date"));
				list.add(reminderMessage);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static ReminderMessage getReminderMessage(long id) {
		ReminderMessage reminderMessage = null;
		try {
			String query = "select * from tbl_reminder_message where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				reminderMessage = new ReminderMessage(rSet.getLong("id"), rSet.getLong("schedule_id"), 
						rSet.getString("message_content"), rSet.getBoolean("is_message_sent"), 
						rSet.getDate("sent_date"), rSet.getBoolean("is_message_delivered"), rSet.getDate("delivered_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return reminderMessage;
	}
	
	public static List<ReminderMessage> getAllReminderMessagesForThisSchedule(long scheduleId){
		List<ReminderMessage> list = new ArrayList<ReminderMessage>();
		ReminderMessage reminderMessage = null;
		try {
			String query = "select * from tbl_reminder_message where schedule_id = "+scheduleId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				reminderMessage = new ReminderMessage(rSet.getLong("id"), rSet.getLong("schedule_id"), 
						rSet.getString("message_content"), rSet.getBoolean("is_message_sent"), 
						rSet.getDate("sent_date"), rSet.getBoolean("is_message_delivered"), rSet.getDate("delivered_date"));
				list.add(reminderMessage);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
