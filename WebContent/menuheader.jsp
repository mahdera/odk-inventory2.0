<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>
<!-- Menu --> 
	<div id="menu" class="box">		
		<%
			//int languId = Integer.parseInt(session.getAttribute("langId").toString());
			List<Functionality> functionalityList = Functionality.getAllFunctionalities();
			Iterator<Functionality> functionalityItr = functionalityList.iterator();
			Account acct = (Account)session.getAttribute("account");		
			User user1 = User.getUser(acct.getUserId());
		%> 
		<ul class="box"> 
			<%
			String lblMenuName = null;
			while(functionalityItr.hasNext()){
				Functionality functionality = functionalityItr.next();
				if(functionality.getFunctionalityName().equals("userManagement") && 
						!user1.getUserType().equals("Data Clerk")){
					
					String labelId = "lbl"+functionality.getMenuName();
					
			%>
				<li><strong><a href="#" title="<%=functionality.getDescription()+" : "+lblMenuName%>" onclick="performThisFunction('<%=functionality.getFunctionalityName() %>')"><span><%=functionality.getMenuName()%></span></a></strong></li>
			<%
				}
				else if(!functionality.getFunctionalityName().equals("userManagement")){
					System.out.println(functionality.getFunctionalityName());
					//String labelId = "lbl"+functionality.getMenuName();
					
					%>
						<li><strong><a href="#" title="<%=functionality.getDescription()%>" onclick="performThisFunction('<%=functionality.getFunctionalityName() %>')"><span><%=functionality.getMenuName()%></span></a></strong></li>
					<%
				}
			}//end while loop
			%>			 
		</ul> 
 
	</div> <!-- /header --> 