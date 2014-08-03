<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<form>
	<table border="1" width="100%">
		<tr>
			<td>Main Store:</td>
			<td>
				<select name="slctmainstore" id="slctmainstore" style="width:50%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<MainStore> mainStoreList = MainStore.getAllMainStores();
						Iterator<MainStore> mainStoreItr = mainStoreList.iterator();
						while(mainStoreItr.hasNext()){
							MainStore mainStore = mainStoreItr.next();
							%>
							<option value="<%=mainStore.getId() %>"><%=mainStore.getMainStoreName() %>: Health Center: <%=HealthCenter.getHealthCenter(mainStore.getHealthCenterId()).getHealthCenterName() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Item:</td>
			<td>
				<select name="slctitem" id="slctitem" style="width:50%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<ItemCodeLookup> itemCodeLookupList = ItemCodeLookup.getAllItemCodeLookups();
						Iterator<ItemCodeLookup> itemCodeLookupItr = itemCodeLookupList.iterator();
						while(itemCodeLookupItr.hasNext()){
							ItemCodeLookup itemCodeLookup = itemCodeLookupItr.next();
							%>
							<option value="<%=itemCodeLookup.getItemCode() %>"><%=itemCodeLookup.getItemCode() %></option>
							<%
						}//end class
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Quantity:</td>
			<td><input type="text" name="txtquantity" id="txtquantity"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveThisItemOnMainStore(document.getElementById('slctmainstore').value,
						document.getElementById('slctitem').value,document.getElementById('txtquantity').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>