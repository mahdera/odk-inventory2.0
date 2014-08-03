<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>

<!-- Now comes the tabs section mahder -->
<div id="employeeSaveDiv"></div>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">GRV Details Tab</h3> 
 
			<div class="tabs box"> 
				<ul> 
					<!-- <li><a href="#.jsp" onclick="showAddGRVForm();"><span>Add GRV</span></a></li> -->
					<li><a href="#.jsp" onclick="showListOfGRVs();"><span>View GRVs</span></a></li> 
					<li><a href="#.jsp" onclick="showListOfGRVsForEdit();"><span>Edit GRV</span></a></li> 
					<li><a href="#.jsp" onclick="showListOfGRVsForDelete();"><span>Delete GRV</span></a></li> 
				</ul> 
			</div> <!-- /tabs --> 
			
			<h3 class="tit" style="border:1px solid #CCCCCC;">
				<%-- <%@include file="employeesortbar.jsp" %> --%>
			</h3> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the GRV details tab for manipulating GRV information</p>			
			</div>			
			<div id="hewDetailDiv"></div>
			<div class="fix"></div> 
</div>
