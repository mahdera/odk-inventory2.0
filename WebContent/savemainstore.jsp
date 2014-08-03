<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String mainStoreName = request.getParameter("mainStoreName");
	int healthCenterId = Integer.parseInt(request.getParameter("healthCenterId"));
	
	ApplicationContext appContext = new ClassPathXmlApplicationContext("spring.xml");
	
	MainStore mainStore = (MainStore) appContext.getBean("mainStore");
	mainStore.setMainStoreName(mainStoreName);
	mainStore.setHealthCenterId(healthCenterId);
	
	mainStore.addMainStore();
%>
<%@include file="showaddmainstoreform.jsp"%>
<p class="msg done">Main store saved successfully!</p>