<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="et.edu.aau.odkinventory.server.classes.*" %>
<%@page import="java.util.*" %>

<!-- Now comes the tabs section mahder -->
<div id="employeeSaveDiv"></div>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">Mother Details Tab</h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" onclick="showAddMotherForm();"><span>Add Mother</span></a></li>
					<li><a href="#.jsp" onclick="showListOfMothers();"><span>View Mothers</span></a></li> 
					<li><a href="#.jsp" onclick="showListOfMothersForEdit();"><span>Edit Mother</span></a></li> 
					<li><a href="#.jsp" onclick="showListOfMothersForDelete();"><span>Delete Mother</span></a></li> 
				</ul> 
			</div> <!-- /tabs --> 
			
			<h3 class="tit" style="border:1px solid #CCCCCC;">
				<%-- <%@include file="employeesortbar.jsp" %> --%>
			</h3> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the Mother details tab for manipulating Mother information</p>			
			</div>			
			<div id="hewDetailDiv"></div>
			<div class="fix"></div> 
</div>
