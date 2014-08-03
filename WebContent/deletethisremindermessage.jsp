<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long reminderMessageId = Long.parseLong(request.getParameter("reminderMessageId"));
	ReminderMessage.deleteReminderMessage(reminderMessageId);
%>
<p class="msg done">Reminder message deleted successfully!</p>