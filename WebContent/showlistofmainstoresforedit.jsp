<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	List<MainStore> mainStoreList = MainStore.getAllMainStores();
	Iterator<MainStore> mainStoreItr = mainStoreList.iterator();
%>
<table border="0" width="100%">
	<caption><h4>List of Main Stores</h4></caption>
	<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
		<td>Ser.No</td>
		<td>Main Store Name</td>
		<td>Health Center</td>		
		<td>Edit</td>
	</tr>
	<%
		int ctr=1;
		while(mainStoreItr.hasNext()){
			MainStore mainStore = mainStoreItr.next();
			HealthCenter healthCenter = HealthCenter.getHealthCenter(mainStore.getHealthCenterId());
			if(ctr % 2 == 0){
			%>
			<tr class='bg'>
			<%
			}else{
			%>
			<tr>
			<%
			}
			%>
				<td><%=ctr %></td>
				<td><%=mainStore.getMainStoreName() %></td>
				<td><%=healthCenter.getHealthCenterName() %></td>	
				<td>
					<a href="#.jsp" onclick="showEditFieldsOfThisMainStore(<%=mainStore.getId() %>);">Edit</a>
				</td>			
			</tr>
			<%
				String divId = "mainStoreEditDiv"+mainStore.getId();
			%>
			<tr>
				<td colspan="4">
					<div id="<%=divId %>"></div>
				</td>
			</tr>
			<%
			ctr++;
		}//end while loop
	%>
</table>