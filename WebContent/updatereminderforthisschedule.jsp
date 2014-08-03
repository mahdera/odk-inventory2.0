<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	long reminderMessageId = Long.parseLong(request.getParameter("reminderMessageId"));
	String messageContent = request.getParameter("messageContent");
	boolean isMessageSent = Boolean.parseBoolean(request.getParameter("isMessageSent"));
	Date sentDate = Date.valueOf(request.getParameter("sentDate"));
	boolean isMessageDelivered = Boolean.parseBoolean(request.getParameter("isMessageDelivered"));
	Date deliveredDate = Date.valueOf(request.getParameter("deliveredDate"));
	
	ReminderMessage.updateReminderMessage(reminderMessageId, messageContent, isMessageSent, sentDate, isMessageDelivered, deliveredDate);
%>
<p class="msg done">Reminder message updated successfully!</p>