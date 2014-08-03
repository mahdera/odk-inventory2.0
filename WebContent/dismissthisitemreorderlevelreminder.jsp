<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long itemReorderReminderId = Long.parseLong(request.getParameter("itemReorderReminderId"));
	//out.println(itemReorderReminderId);
	//now change the status of this reminder to checked
	ItemReorderReminder.changeTheStatusOfThisItemReorderReminder(itemReorderReminderId,"Checked");
%>
<%@include file="showreorderlevelreminderforsystemadministrator.jsp"%>
<p class="msg done">Item reorder reminder dismissed successfully!</p>