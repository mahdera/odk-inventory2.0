<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long scheduleId = Long.parseLong(request.getParameter("scheduleId"));
	List<ReminderMessage> reminderMessageList = ReminderMessage.getAllReminderMessagesForThisSchedule(scheduleId);
	if(!reminderMessageList.isEmpty()){
		Iterator<ReminderMessage> reminderMessageItr = reminderMessageList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#ccc;font-weight:bolder;font-size:11pt">
				<td>Ser.No</td>
				<td>Message Content</td>
				<td>Is Message Sent</td>
				<td>Sent Date</td>
				<td>Is Message Delivered</td>
				<td>Delivered Date</td>
				<td>Edit</td>				
			</tr>
			<%
				int ctr=1;
				while(reminderMessageItr.hasNext()){
					ReminderMessage reminderMessage = reminderMessageItr.next();
					%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=reminderMessage.getMessageContent() %></td>
						<td><%=(reminderMessage.isMessageSent()==true?"True":"False") %></td>
						<td><%=reminderMessage.getSentDate() %></td>
						<td><%=(reminderMessage.isMessageDelivered()==true?"True":"False") %></td>
						<td><%=reminderMessage.getDeliveredDate() %></td>
						<td><a href="#.jsp" onclick="showEditFieldsOfThisReminderMessage(<%=reminderMessage.getId() %>);">Edit</a></td>						
					</tr>
					<%
						String divId = "reminderEditDiv"+reminderMessage.getId();
					%>
					<tr>
						<td colspan="7">
							<div id="<%=divId %>"></div>
						</td>
					</tr>
					<%
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
		<p class="msg warning">There is/are no reminder messages for this schedule!</p>
		<%
	}
%>
