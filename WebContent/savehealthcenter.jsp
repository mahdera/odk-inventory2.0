<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String healthCenterName = request.getParameter("healthCenterName");
	String description = StringEscapeUtils.escapeSql(request.getParameter("description"));
	String woreda = request.getParameter("woreda");
	String kebele = request.getParameter("kebele");
	String gote = request.getParameter("gote");
	String googleMap = StringEscapeUtils.escapeSql(request.getParameter("googleMap"));
	
	
	//HealthCenter healthCenter = new HealthCenter(healthCenterName,description);
	ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring.xml");
	HealthCenter healthCenter = (HealthCenter) applicationContext.getBean("healthCenter");
	healthCenter.setHealthCenterName(healthCenterName);
	healthCenter.setDescription(description);
	healthCenter.addHealthCenter();
	HealthCenter fetchedHealthCenter = HealthCenter.fetchHealthCenterUsing(healthCenterName,description);
	//now save the location of the health center...
	//HealthCenterLocation healthCenterLocation = new HealthCenterLocation(woreda,kebele,gote,googleMap,fetchedHealthCenter.getId());
	
	HealthCenterLocation healthCenterLocation = (HealthCenterLocation) applicationContext.getBean("healthCenterLocation");
	healthCenterLocation.setWoreda(woreda);
	healthCenterLocation.setKebele(kebele);
	healthCenterLocation.setGote(gote);
	healthCenterLocation.setGoogleMap(googleMap);
	healthCenterLocation.setHealthCenterId(fetchedHealthCenter.getId());
	
	healthCenterLocation.addHealthCenterLocation();
%>
<%@include file="showaddhealthcenterform.jsp" %>
<p class="msg done">Health center saved successfully!</p>