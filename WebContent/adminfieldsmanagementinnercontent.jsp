<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%
	Account account = (Account) session.getAttribute("account");
	//String functionalityName = "examinationManagement";
	//Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	//Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	
	if(User.getUser(account.getUserId()).getUserType().equalsIgnoreCase("Administrator")){	
%>
<div>	
	<!-- Tabs --> 
			
			<h3 class="tit">Administrator Fields Tab</h3> 
			<div class="tabs box"> 
				<ul> 
					<!-- <li><a href="#.jsp" onclick="showCategoryInnerMenu();"><span>Category</span></a></li> -->
					<li><a href="#.jsp" onclick="showHealthCenterInnerMenu();"><span>HC</span></a></li>
					<li><a href="#.jsp" onclick="showHealthPostInnerMenu();"><span>HP</span></a></li>					
					<li><a href="#.jsp" onclick="showItemReorderLevelInnerMenu();"><span>Item Reorder Level</span></a></li>
					<li><a href="#.jsp" onclick="showMainStoreInnerMenu();"><span>Main Store</span></a></li>
					<li><a href="#.jsp" onclick="showItemsOnMainStoreInnerMenu();"><span>Main Store Detail</span></a></li>
					<li><a href="#.jsp" onclick="showStockInnerMenu();"><span>Stock</span></a></li>
					<li><a href="#.jsp" onclick="showItemsOnHealthPostStockInnerMenu();"><span>Stock Detail</span></a></li>
					<li><a href="#.jsp" onclick="showPhoneResponsibilityInnerMenu();"><span>Phone Responsibility</span></a></li>					
					<li><a href="#.jsp" onclick="showUserInnerMenu();"><span>User</span></a></li>
					<li><a href="#.jsp" onclick="showInitializeInnerMenu();"><span>Initialize</span></a></li>									
				</ul> 
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the administrator fields tab for manipulating fields</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div>
			
</div>
<%
	}else{
		out.print("<p class='msg error'>Only users with Administrator account can use this module!!</p>");
	}
%>
