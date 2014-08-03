<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
Account account = (Account) session.getAttribute("account");
String functionalityName = "hewManagement";
Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
User user = User.getUser(account.getUserId());

if(role.isReadable()){
	List<Schedule> scheduleList = Schedule.getAllSchedules();
	if(!scheduleList.isEmpty()){
	Iterator<Schedule> scheduleItr = scheduleList.iterator();
%>
<table border="0" width="100%">
	<caption><h4>List of Schedule</h4></caption>
	<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
		<td>Ser.No</td>
		<td>Mother</td>
		<td>Last Visit Date</td>
		<td>Next Scheduled Date</td>
		<td>Actual Visit Date</td>					
		<td>Delete</td>
	</tr>
	<%
		int ctr=1;
		while(scheduleItr.hasNext()){
			Schedule schedule = scheduleItr.next();
			Mother mother = Mother.getMother(schedule.getMotherId());
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
				<td><%=schedule.getLastVisitDate() %></td>
				<td><%=schedule.getNextScheduledDate() %></td>
				<td><%=schedule.getActualVisitDate() %></td>
				<td>
					<a href="#.jsp" onclick="deleteThisSchedule(<%=schedule.getId() %>);">Delete</a>
				</td>								
			</tr>			
			<%
			ctr++;
		}//end while loop
	}else{
		%>
		<p class="msg warning">There is/are no schedule/s saved in the database!</p>
		<%
	}
	%>
</table>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>