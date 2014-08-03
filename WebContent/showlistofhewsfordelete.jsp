<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
Account account = (Account) session.getAttribute("account");
String functionalityName = "hewManagement";
Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
Role role = Role.getRole(account.getAccountId(), functionalityO.getId());

if(role.isDeletable()){
	List<HEW> hewList = HEW.getAllHEWs();
	Iterator<HEW> hewItr = hewList.iterator();
%>
<table border="0" width="100%">
	<caption><h4>List of HEW</h4></caption>
	<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
		<td>Ser.No</td>
		<td>First Name</td>
		<td>Father Name</td>
		<td>Grand Father Name</td>
		<td>Mobile Number</td>
		<td>Health Post</td>		
		<td>Delete</td>
	</tr>
	<%
		int ctr=1;
		while(hewItr.hasNext()){
			HEW hew = hewItr.next();
			HealthPost healthPost = HealthPost.getHealthPost(hew.getHealthPostId());
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
				<td><%=hew.getFirstName() %></td>
				<td><%=hew.getFatherName() %></td>
				<td><%=hew.getGrandFatherName() %></td>
				<td><%=hew.getMobileNumber() %></td>
				<td><%=healthPost.getHealthPostName() %></td>		
				<td>
					<a href="#.jsp" onclick="deleteThisHEW(<%=hew.getId() %>);">Delete</a>
				</td>		
			</tr>
			<%
				String divId = "hewEditDiv"+hew.getId();
			%>
			<tr>
				<td colspan="7">
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
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>