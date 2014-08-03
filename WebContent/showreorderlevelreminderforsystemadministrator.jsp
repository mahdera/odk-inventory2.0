<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	//this module will check the tbl_item_reorder_reminder table to see if there are any unchecked reminders for the
	//administrator and the health center supervisor...
	List<ItemReorderReminder> itemReorderReminderList = ItemReorderReminder.getAllItemReorderReminders();	
	float condomReorderCount=0.0f;
	float pillsReorderCount=0.0f;
	float injectableReorderCount=0.0f;
	float implantReorderCount=0.0f;
	float totalReorderCount=0.0f;
			
	if(itemReorderReminderList != null){
		%>
		<table border="0" width="100%">
			<tr style="background:#eeeeee;font-weight:bolder;font-size:12pt">
				<td>Ser.No</td>
				<td>Health Post</td>
				<td>Item Code</td>
				<td>Message</td>
				<td>Action</td>
			</tr>
		<%
		int ctr=1;
		Iterator<ItemReorderReminder> itemReorderReminderItr = itemReorderReminderList.iterator();	
		while(itemReorderReminderItr.hasNext()){
			ItemReorderReminder itemReorderReminder = itemReorderReminderItr.next();
			Stock stock = Stock.getStock(itemReorderReminder.getStockId());
			HealthPost healthPost = HealthPost.getHealthPost(stock.getHealthPostId());
			if(itemReorderReminder.getItemCode().equalsIgnoreCase("condom")){
				%>
				<tr>
					<td><%=ctr %></td>
					<td><%=HealthPost.getHealthPost(healthPost.getId()).getHealthPostName() %></td>
					<td><%=itemReorderReminder.getItemCode() %></td>
					<td><%=itemReorderReminder.getMessage() %></td>
					<td>
						<a href="#.jsp" onclick="dismissThisItemReorderLevelReminder(<%=itemReorderReminder.getId() %>);">Dismiss</a>
					</td>
				</tr>
				<%
			}else if(itemReorderReminder.getItemCode().equalsIgnoreCase("pills")){
				%>
				<tr>
					<td><%=ctr %></td>
					<td><%=HealthPost.getHealthPost(healthPost.getId()).getHealthPostName() %></td>
					<td><%=itemReorderReminder.getItemCode() %></td>
					<td><%=itemReorderReminder.getMessage() %></td>
					<td>
						<a href="#.jsp" onclick="dismissThisItemReorderLevelReminder(<%=itemReorderReminder.getId() %>);">Dismiss</a>
					</td>
				</tr>
				<%
			}else if(itemReorderReminder.getItemCode().equalsIgnoreCase("injectable")){
				%>
				<tr>
					<td><%=ctr %></td>
					<td><%=HealthPost.getHealthPost(healthPost.getId()).getHealthPostName() %></td>
					<td><%=itemReorderReminder.getItemCode() %></td>
					<td><%=itemReorderReminder.getMessage() %></td>
					<td>
						<a href="#.jsp" onclick="dismissThisItemReorderLevelReminder(<%=itemReorderReminder.getId() %>);">Dismiss</a>
					</td>
				</tr>
				<%
			}else if(itemReorderReminder.getItemCode().equalsIgnoreCase("implant")){
				%>
				<tr>
					<td><%=ctr %></td>
					<td><%=HealthPost.getHealthPost(healthPost.getId()).getHealthPostName() %></td>
					<td><%=itemReorderReminder.getItemCode() %></td>
					<td><%=itemReorderReminder.getMessage() %></td>
					<td>
						<a href="#.jsp" onclick="dismissThisItemReorderLevelReminder(<%=itemReorderReminder.getId() %>);">Dismiss</a>
					</td>
				</tr>
				<%
			}
			
			ctr++;
		}//end while loop		
	}
%>