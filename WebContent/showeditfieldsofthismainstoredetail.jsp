<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long mainStoreDetailId = Long.parseLong(request.getParameter("mainStoreDetailId"));
	MainStoreDetail mainStoreDetail = MainStoreDetail.getMainStoreDetail(mainStoreDetailId);
	/////define the fields....
	String currentQuantityField = "txtcurrentquantity"+mainStoreDetailId;
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Main Store:</td>
			<td><%=MainStore.getMainStore(mainStoreDetail.getMainStoreId()).getMainStoreName() %></td>
		</tr>
		<tr>
			<td>Item Code:</td>
			<td><%=ItemCodeLookup.getItemCodeLookup(mainStoreDetail.getItemCode()).getItemCode() %></td>
		</tr>
		<tr>
			<td>Current Quantity:</td>
			<td><input type="text" name="<%=currentQuantityField %>" id="<%=currentQuantityField %>" value="<%=mainStoreDetail.getCurrentQuantity() %>"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateMainStoreDetail(<%=mainStoreDetailId %>,
				document.getElementById('<%=currentQuantityField %>').value);"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>
	</table>
</form>