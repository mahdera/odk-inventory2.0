<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long reminderMessageId = Long.parseLong(request.getParameter("reminderMessageId"));
	ReminderMessage reminderMessage = ReminderMessage.getReminderMessage(reminderMessageId);
%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td>Message Content</td>
			<td>
				<textarea cols="40" rows="3" name="textareamessagecontent" id="textareamessagecontent"><%=reminderMessage.getMessageContent() %></textarea>
			</td>
		</tr>
		<tr>
			<td>Is Message Sent?:</td>
			<td>
				<select name="slctmessagesent" id="slctmessagesent" style="width:100%">
					<%
						if(reminderMessage.isMessageSent()){
							%>
							<option value="true" selected="selected">True</option>
							<option value="false">False</option>
							<%
						}else{
							%>
							<option value="true">True</option>
							<option value="false" selected="selected">False</option>
							<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Sent Date:</td>
			<td>
				<input type="text" name="txtsentdate" id="txtsentdate" value="<%=reminderMessage.getSentDate() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtsentdate')" />
			</td>
		</tr>
		<tr>
			<td>Is Message Delivered?:</td>
			<td>
				<select name="slctmessagedelivered" id="slctmessagedelivered" style="width:100%">
					<%
						if(reminderMessage.isMessageDelivered()){
							%>
							<option value="false">False</option>
							<option value="true" selected="selected">True</option>
							<%
						}else{
							%>
							<option value="false" selected="selected">False</option>
							<option value="true">True</option>
							<%
						}
					%>
					
				</select>
			</td>
		</tr>
		<tr>
			<td>Delivered Date:</td>
			<td>
				<input type="text" name="txtdelivereddate" id="txtdelivereddate" value="<%=reminderMessage.getDeliveredDate() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtdelivereddate')" />
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateReminderForThisSchedule(<%=reminderMessageId%>,document.getElementById('textareamessagecontent').value,
				document.getElementById('slctmessagesent').value,document.getElementById('txtsentdate').value,document.getElementById('slctmessagedelivered').value,
				document.getElementById('txtdelivereddate').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>