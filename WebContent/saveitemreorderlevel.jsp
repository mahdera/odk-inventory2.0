<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	long stockId = Long.parseLong(request.getParameter("stockId"));
	String iCode = request.getParameter("itemCode");
	float reorderLevel = Float.parseFloat(request.getParameter("reorderLevel"));
	float emergencyReorderLevel = Float.parseFloat(request.getParameter("emergencyReorderLevel"));
	
	ApplicationContext appContext = new ClassPathXmlApplicationContext("spring.xml");
	
	ItemReorderLevel itemReorderLevel = (ItemReorderLevel) appContext.getBean("itemReorderLevel"); 
	//new ItemReorderLevel(stockId,iCode,reorderLevel,emergencyReorderLevel);
	
	itemReorderLevel.setStockId(stockId);
	itemReorderLevel.setItemCode(iCode);
	itemReorderLevel.setReorderLevel(reorderLevel);
	itemReorderLevel.setEmergencyReorderLevel(emergencyReorderLevel);
	
	itemReorderLevel.addItemReorderLevel();
%>
<%@include file="showadditemreorderlevelform.jsp"%>
<p class="msg done">Item reorder level saved successfully!</p>