<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
Account account = (Account) session.getAttribute("account");
String functionalityName = "hewManagement";
Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
User user = User.getUser(account.getUserId());

if(role.isReadable()){
	List<Mother> motherList = Mother.getAllMothers();
	if(!motherList.isEmpty()){
	Iterator<Mother> motherItr = motherList.iterator();
%>
<table border="0" width="100%">
	<caption><h4>List of Mothers</h4></caption>
	<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
		<td>Ser.No</td>
		<td>Mother Full Name</td>
		<td>House Number/Gote</td>
		<td>Preferred Contraceptive Method</td>
		<td>Phone Number</td>		
		<td>Delete</td>		
	</tr>
	<%
		int ctr=1;
		while(motherItr.hasNext()){
			Mother mother = motherItr.next();
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
				<td><%=mother.getMotherFullName() %></td>
				<td><%=mother.getHouseNumberGote() %></td>
				<td><%=mother.getPreferredContraceptiveMethod() %></td>
				<td><%=mother.getPhoneNumber() %></td>	
				<td><a href="#.jsp" onclick="deleteMother(<%=mother.getId() %>);">Delete</a></td>							
			</tr>			
			<%
			ctr++;
		}//end while loop
	}else{
		%>
		<p class="msg warning">There is/are no mother/s saved in the database!</p>
		<%
	}
	%>
</table>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>