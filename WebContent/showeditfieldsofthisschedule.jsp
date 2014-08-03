<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long scheduleId = Long.parseLong(request.getParameter("scheduleId"));
	Schedule schedule = Schedule.getSchedule(scheduleId);
	Mother selectedMother = Mother.getMother(schedule.getMotherId());
%>
<form style="background:#eeeeee">
	<table border="0" width="100%">
		<tr>
			<td>Mother:</td>
			<td>
				<select name="slctmother" id="slctmother" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Mother> motherList = Mother.getAllMothers();
						Iterator<Mother> motherItr = motherList.iterator();
						while(motherItr.hasNext()){
							Mother mother = motherItr.next();
							if(mother.getId() == selectedMother.getId()){
							%>
							<option value="<%=mother.getId() %>" selected="selected"><%=mother.getMotherFullName() %></option>
							<%	
							}else{
							%>
							<option value="<%=mother.getId() %>"><%=mother.getMotherFullName() %></option>
							<%
							}
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Last Visit Date:</td>
			<td>
				<input type="text" name="txtlastvisitdate" id="txtlastvisitdate" value="<%=schedule.getLastVisitDate() %>"/> 
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtlastvisitdate')" />
			</td>
		</tr>
		<tr>
			<td>Next Scheduled Date:</td>
			<td>
				<input type="text" name="txtnextscheduleddate" id="txtnextscheduleddate" value="<%=schedule.getNextScheduledDate() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtnextscheduleddate')" />
			</td>
		</tr>
		<tr>
			<td>Actual Visit Date:</td>
			<td>
				<input type="text" name="txtactualvisitdate" id="txtactualvisitdate" value="<%=schedule.getActualVisitDate() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtactualvisitdate')" />
			</td>
		</tr>		
		<tr>
			<td></td>
			<td>
				<input type="button" value="Update" onclick="updateSchedule(<%=schedule.getId() %>,document.getElementById('slctmother').value,
				document.getElementById('txtlastvisitdate').value,document.getElementById('txtnextscheduleddate').value,
				document.getElementById('txtactualvisitdate').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>
	