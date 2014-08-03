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
		Iterator<ItemReorderReminder> itemReorderReminderItr = itemReorderReminderList.iterator();	
		while(itemReorderReminderItr.hasNext()){
			ItemReorderReminder itemReorderReminder = itemReorderReminderItr.next();
			Stock stock = Stock.getStock(itemReorderReminder.getStockId());
			if(itemReorderReminder.getItemCode().equalsIgnoreCase("condom")){
				condomReorderCount++;
			}else if(itemReorderReminder.getItemCode().equalsIgnoreCase("pills")){
				pillsReorderCount++;
			}else if(itemReorderReminder.getItemCode().equalsIgnoreCase("injectable")){
				injectableReorderCount++;
			}else if(itemReorderReminder.getItemCode().equalsIgnoreCase("implant")){
				implantReorderCount++;
			}
		}//end while loop
		//now get the total count
		totalReorderCount = condomReorderCount + pillsReorderCount + injectableReorderCount + implantReorderCount;
		if(totalReorderCount != 0.0){
			%>
			<p class="msg info">There are <font color='red'><strong><%=totalReorderCount %></strong></font> unchecked reorder reminders! Click <strong><a href='#.jsp' onclick='showReorderLevelReminderForSystemAdministrator();'>here</a></strong> for detail!</p>
			<%
		}else{
			%>
			<p class="msg done">No unchecked reorder reminders!</p>
			<%
		}
	}
%>