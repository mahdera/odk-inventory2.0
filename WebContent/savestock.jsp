<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*"%>
<%
	String stockName = request.getParameter("stockName");
	int healthPostId = Integer.parseInt(request.getParameter("healthPostId"));
	ApplicationContext appContext = new ClassPathXmlApplicationContext("spring.xml");
	Stock stock = (Stock) appContext.getBean("stock");
	stock.setStockName(stockName);
	stock.setHealthPostId(healthPostId);
	//new Stock(stockName,healthPostId);
	stock.addStock();
%>
<%@include file="showaddstockform.jsp"%>
<p class="msg done">Stock saved successfully!</p>