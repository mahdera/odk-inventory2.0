<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "hewManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	User user = User.getUser(account.getUserId());
	
	if(role.isWritable()){
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
							%>
							<option value="<%=mother.getId() %>"><%=mother.getMotherFullName() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Last Visit Date:</td>
			<td>
				<input type="text" name="txtlastvisitdate" id="txtlastvisitdate"/> 
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtlastvisitdate')" />
			</td>
		</tr>
		<tr>
			<td>Next Scheduled Date:</td>
			<td>
				<input type="text" name="txtnextscheduleddate" id="txtnextscheduleddate"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtnextscheduleddate')" />
			</td>
		</tr>
		<tr>
			<td>Actual Visit Date:</td>
			<td>
				<input type="text" name="txtactualvisitdate" id="txtactualvisitdate"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtactualvisitdate')" />
			</td>
		</tr>		
		<tr>
			<td></td>
			<td>
				<input type="button" value="Save" onclick="saveSchedule(document.getElementById('slctmother').value,
				document.getElementById('txtlastvisitdate').value,document.getElementById('txtnextscheduleddate').value,
				document.getElementById('txtactualvisitdate').value);"/>
				<input type="reset" value="Clear All"/>
			</td>
		</tr>
	</table>
</form>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>