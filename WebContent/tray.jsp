<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<div id="tray" class="box">
	<p class="f-left box">
		<!-- Switcher -->
		<span class="f-left" id="switcher"> <a href="#" rel="1col"
			class="styleswitch ico-col1" title="Display one column"><img
				src="design/switcher-1col.gif" alt="1 Column" />
		</a> <a href="#" rel="2col" class="styleswitch ico-col2"
			title="Display two columns"><img src="design/switcher-2col.gif"
				alt="2 Columns" />
		</a> </span> Application: ODK-Inventory-2.0 | Open Data Kit Inventory System

	</p>

	<p class="f-right">
		<%
			Account account = (Account)session.getAttribute("account");
			int userId = account.getUserId();
			User user = User.getUser(userId);			
			//Employee empObj = Employee.getEmployee(account.getEmpId());
			//String logInMessage = user.getUserType()+" "+user.getFullName()+" Logged in";
		if(user.getUserType() != null){
			//Woreda userWoreda = Woreda.getWoreda(user.getWoredaId());
			String userFullName = user.getFirstName()+" "+user.getMiddleName()+" "+user.getLastName();
			String managesStr = null;
			if(user.getUserType().equalsIgnoreCase("hew")){
				HEWManagesHealthPost managesHP = HEWManagesHealthPost.getHEWManagesHealthPostForThisUser(user.getId());
				managesStr = "Health Post : "+HealthPost.getHealthPost(managesHP.getHealthPostId()).getHealthPostName();
			}else if(user.getUserType().equalsIgnoreCase("hc administrator") || user.getUserType().equalsIgnoreCase("nurse")){
				NurseManagesHealthCenter managesHC = NurseManagesHealthCenter.getNurseManagesHealthCenterForThisUser(user.getId());
				managesStr = "Health Center : "+HealthCenter.getHealthCenter(managesHC.getHealthCenterId()).getHealthCenterName();
			}else if(user.getUserType().equalsIgnoreCase("administrator")){
				managesStr = "All health centers";
			}
		%>			
		<%=user.getUserType()%>: <a href="#.jsp"><%=userFullName%> </a>: Manages <%=managesStr %>. Status [Logged in]
		<%
		}
		%>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>
		<a href="logout.jsp" id="logout">Log out</a>
		</strong>
		<br/>  
		
	</p>

</div>
<!--  /tray -->