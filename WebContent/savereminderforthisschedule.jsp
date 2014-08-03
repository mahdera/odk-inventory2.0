<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	long scheduleId = Long.parseLong(request.getParameter("scheduleId"));
	String messageContent = request.getParameter("messageContent");
	boolean isMessageSent = Boolean.parseBoolean(request.getParameter("isMessageSent"));
	Date sentDate = Date.valueOf(request.getParameter("sentDate"));
	boolean isMessageDelivered = Boolean.parseBoolean(request.getParameter("isMessageDelivered"));
	Date deliveredDate = Date.valueOf(request.getParameter("deliveredDate"));
	ApplicationContext appContext = new ClassPathXmlApplicationContext("spring.xml");
	ReminderMessage reminderMessage = (ReminderMessage) appContext.getBean("reminderMessage");
	reminderMessage.setScheduleId(scheduleId);
	reminderMessage.setMessageContent(messageContent);
	reminderMessage.setMessageSent(isMessageSent);
	reminderMessage.setSentDate(sentDate);
	reminderMessage.setMessageDelivered(isMessageDelivered);
	reminderMessage.setDeliveredDate(deliveredDate);
	//new ReminderMessage(scheduleId,messageContent,isMessageSent,sentDate,isMessageDelivered,deliveredDate);
	reminderMessage.addReminderMessage();
%>
<p class="msg done">Reminder for schedule saved successfully!</p>