<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	long mainStoreId = Long.parseLong(request.getParameter("mainStoreId"));
	//now get the main store detail of this main store...
	List<MainStoreDetail> mainStoreDetailList = MainStoreDetail.getMainStoreDetailForThisMainStore(mainStoreId);
	Iterator<MainStoreDetail> mainStoreDetailItr = mainStoreDetailList.iterator();
%>
<table border="1" width="100%">
	<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
		<td>Ser.No</td>
		<td>Item</td>
		<td>Current Quantity</td>
		<td>Edit</td>
	</tr>
	<%
		int ctr=1;
		while(mainStoreDetailItr.hasNext()){
			MainStoreDetail mainStoreDetail = mainStoreDetailItr.next();
			ItemCodeLookup itemCodeLookup = ItemCodeLookup.getItemCodeLookup(mainStoreDetail.getItemCode());
			if(ctr % 2 == 0)
				out.print("<tr>");
			else
				out.print("<tr class='bg'>");
			%>
			<td><%=ctr %></td>
			<td><%=itemCodeLookup.getItemCode() %></td>
			<td><%=mainStoreDetail.getCurrentQuantity() %></td>
			<td>
				<a href="#.jsp" onclick="showEditFieldsOfThisMainStoreDetail(<%=mainStoreDetail.getId() %>);">Edit</a>
			</td>
			</tr>
			<%
				String divId = "mainStoreDetailEditDiv"+mainStoreDetail.getId();
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