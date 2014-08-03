<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<form style="background:#eeeeee">
	<table border="1" width="100%">
		<tr>
			<td>Select Main Store:</td>
			<td>
				<select name="slctmainstore" id="slctmainstore" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<MainStore> mainStoreList = MainStore.getAllMainStores();
						Iterator<MainStore> mainStoreItr = mainStoreList.iterator();
						while(mainStoreItr.hasNext()){
							MainStore mainStore = mainStoreItr.next();
							%>
							<option value="<%=mainStore.getId() %>"><%=mainStore.getMainStoreName() %></option>
							<%
						}//ene while loop
					%>
				</select>
			</td>
			<td>
				<input type="button" value="Show Items" onclick="showListOfItemsOfThisMainStore(document.getElementById('slctmainstore').value);"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>
<div id="mainStoreDetailDiv"></div>