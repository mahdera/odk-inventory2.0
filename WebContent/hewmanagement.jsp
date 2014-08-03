<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>

<!-- Now comes the tabs section mahder -->
<div id="employeeSaveDiv"></div>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">HEW Details Tab</h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" onclick="showAddHEWForm();"><span>Add HEW</span></a></li>
					<li><a href="#.jsp" onclick="showListOfHEWs();"><span>View HEW</span></a></li> 
					<li><a href="#.jsp" onclick="showListOfHEWsForEdit();"><span>Edit HEW</span></a></li> 
					<li><a href="#.jsp" onclick="showListOfHEWsForDelete();"><span>Delete HEW</span></a></li> 
				</ul> 
			</div> <!-- /tabs --> 
			
			<h3 class="tit" style="border:1px solid #CCCCCC;">
				<%-- <%@include file="employeesortbar.jsp" %> --%>
			</h3> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the HEW details tab for manipulating HEW information</p>			
			</div>			
			<div id="hewDetailDiv"></div>
			<div class="fix"></div> 
</div>
