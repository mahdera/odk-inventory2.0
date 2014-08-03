<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long stockId = Long.parseLong(request.getParameter("stockId"));
	List<ItemReorderLevel> itemReorderList = ItemReorderLevel.getAllItemReorderLevelsForThisStock(stockId);
	if(itemReorderList != null){
		Iterator<ItemReorderLevel> itemReorderItr = itemReorderList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
				<td>Ser.No</td>
				<td>Item Code</td>
				<td>Reorder Level</td>
				<td>Emergency Reorder Level</td>
				<td>Delete</td>
			</tr>
			<%
				int ctr=1;
				while(itemReorderItr.hasNext()){
					ItemReorderLevel reorderLevel = itemReorderItr.next();
					%>
					<tr>
						<td><%=ctr %></td>
						<td><%=reorderLevel.getItemCode() %></td>
						<td><%=reorderLevel.getReorderLevel() %></td>
						<td><%=reorderLevel.getEmergencyReorderLevel() %></td>
						<td>
							<a href="#.jsp" onclick="deleteThisItemReorderLevel(<%=reorderLevel.getId() %>);">Delete</a>
						</td>
					</tr>
					<%
						String divId = "reorderLevelEditDiv" + reorderLevel.getId();
					%>
					<tr>
						<td colspan="5">
							<div id="<%=divId %>"></div>
						</td>
					</tr>
					<%
					ctr++;
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
		<p class="msg info">This stock has not yet set the item reorder level!</p>
		<%
	}
%>