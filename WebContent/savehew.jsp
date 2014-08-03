<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String firstName = request.getParameter("firstName");
	String fatherName = request.getParameter("fatherName");
	String grandFatherName = request.getParameter("grandFatherName");
	String mobileNumber = request.getParameter("mobileNumber");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	
	ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring.xml");
	HEW hew = (HEW) applicationContext.getBean("hew");
	//new HEW(firstName,fatherName,grandFatherName,mobileNumber,healthPostId);
	hew.setFirstName(firstName);
	hew.setFatherName(fatherName);
	hew.setGrandFatherName(grandFatherName);
	hew.setMobileNumber(mobileNumber);
	hew.setHealthPostId(healthPostId);
	
	hew.addHEW();
%>
<%@include file="showaddhewform.jsp"%>
<p class="msg done">HEW saved successfully!</p>