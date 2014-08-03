<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	List<PhoneResponsibility> phoneResponsiblityList = PhoneResponsibility.getAllPhoneResponsibilities();
	Iterator<PhoneResponsibility> phoneResponsiblityItr = phoneResponsiblityList.iterator();
%>
<table border="0" width="100%">
	<caption><h4>List of Phone Responsibilities</h4></caption>
	<tr style="background:#eeeeee;font-weight:bolder;font-size:11pt">
		<td>Ser.No</td>
		<td>Full Name</td>
		<td>Health Center</td>
		<td>Job Description</td>
		<td>Phone Brand</td>
		<td>Apparatus Serial Number</td>
		<td>Battery Serial Number</td>
		<td>SIM PIN Number</td>
		<td>PUK 1</td>
		<td>PUK 2</td>
		<td>Phone Number</td>
		<td>Date Given on</td>
		<td>Description</td>		
		<td>Delete</td>
	</tr>
	<%
		int ctr=1;
		while(phoneResponsiblityItr.hasNext()){
			PhoneResponsibility respo = phoneResponsiblityItr.next();			
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
				<td><%=respo.getFullName() %></td>
				<td><%=HealthCenter.getHealthCenter(respo.getHealthCenterId()).getHealthCenterName() %></td>
				<td><%=respo.getJobDescription() %></td>
				<td><%=respo.getPhoneBrand() %></td>
				<td><%=respo.getApparatusSerialNumber() %></td>
				<td><%=respo.getBatterySerialNumber() %></td>
				<td><%=respo.getSimPinNumber() %></td>
				<td><%=respo.getPuk1() %></td>
				<td><%=respo.getPuk2() %></td>
				<td><%=respo.getPhoneBrand() %></td>
				<td><%=respo.getDateGivenOn() %></td>
				<td><%=respo.getDescription() %></td>
				<td>
					<a href="#.jsp" onclick="deleteThisPhoneResponsiblity(<%=respo.getId() %>);">Delete</a>
				</td>
			</tr>		
			<%
				String divId = "respoEditDiv"+respo.getId();
			%>
			<tr>
				<td colspan="14">
					<div id="<%=divId%>"></div>
				</td>
			</tr>	
			<%
			ctr++;
		}//end while loop
	%>
</table>