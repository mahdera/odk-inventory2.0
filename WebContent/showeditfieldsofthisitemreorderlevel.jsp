<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	int reorderLevelId = Integer.parseInt(request.getParameter("reorderLevelId"));
	ItemReorderLevel reorderLevel = ItemReorderLevel.getItemReorderLevel(reorderLevelId);
	//define the item name here...
	String reorderLevelField = "txtreorderlevel" + reorderLevelId;
	String emergencyReorderLevelField = "txtemergencyreorderlevel" + reorderLevelId;
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Stock:</td>
			<td><%=Stock.getStock(reorderLevel.getStockId()).getStockName() %></td>
		</tr>
		<tr>
			<td>Item Code:</td>
			<td><%=ItemCodeLookup.getItemCodeLookup(reorderLevel.getItemCode()).getItemCode() %></td>
		</tr>
		<tr>
			<td>Reorder Level:</td>
			<td><input type="text" name="<%=reorderLevelField %>" id="<%=reorderLevelField %>" value="<%=reorderLevel.getReorderLevel() %>"/></td>
		</tr>
		<tr>
			<td>Emergency Reorder Level:</td>
			<td><input type="text" name="<%=emergencyReorderLevelField %>" id="<%=emergencyReorderLevelField %>" value="<%=reorderLevel.getEmergencyReorderLevel() %>"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateThisItemReorderLevel(<%=reorderLevelId %>,document.getElementById('<%=reorderLevelField %>').value,
				document.getElementById('<%=emergencyReorderLevelField %>').value);"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>
	</table>
</form>