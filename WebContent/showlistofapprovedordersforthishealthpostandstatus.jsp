<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	List<ApprovedOrder> approvedOrderList = ApprovedOrder.getAllApprovedOrdersForThisHealthPost(healthPostId);
	Iterator<ApprovedOrder> approvedOrderItr = approvedOrderList.iterator();
%>
<table border="0" width="100%">
	<tr style="background:#eeeeee;font-weight:bolder;font-size:12pt">
		<td>Ser.No</td>
		<td>Approved On</td>
		<td>Approved By</td>
		<td>Pills Amount</td>
		<td>Condom Amount</td>
		<td>Injectable Amount</td>
		<td>Implant Amount</td>
	</tr>
	<%
		int ctr=1;
		while(approvedOrderItr.hasNext()){
			ApprovedOrder approvedOrder = approvedOrderItr.next();
			User user = User.getUser(approvedOrder.getApprovedBy());
			String userFullName = user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName();
			%>
			<tr>
				<td><%=ctr++ %></td>
				<td><%=approvedOrder.getApprovedOn() %></td>
				<td><%=userFullName %></td>
				<td><%=approvedOrder.getPillsAmount() %></td>
				<td><%=approvedOrder.getCondomAmount() %></td>
				<td><%=approvedOrder.getInjectableAmount() %></td>
				<td><%=approvedOrder.getImplantAmount() %></td>
			</tr>
			<%
		}//end while loop
	%>
</table>