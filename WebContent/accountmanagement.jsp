<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">Account Management Tab</h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" onclick="showChangeUsername();"><span>Change Username 
					</span></a></li> 
					<!-- <li><a href="#.jsp" onclick="showFunctionalityInnerMenu();"><span>Functionality</span></a></li>--> 
					<li><a href="#.jsp" onclick="showChangePassword();"><span>Change Password</span></a></li>
					<%
					Account acct = (Account) session.getAttribute("account");
					User user = User.getUser(acct.getUserId());
					if(user.getUserType().equalsIgnoreCase("Administrator")){
					%> 
					<li><a href="#.jsp" onclick="showResetUsersAccount();"><span>Reset User's Account</span></a></li>
					<%
					}
					%>					
				</ul> 
				<span id="ajaxLoaderSpanTab" style="visibility:hidden">
 					<img src="design/loading.gif" border="0"/>
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the account management tabs for manipulating fields</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
