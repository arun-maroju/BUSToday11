<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.avengers.bus.entityModels.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stations List through Spring JDBC Template</title>
</head>
 <BODY BGCOLOR="yellow">
       <H1>Stations List through Spring JDBC Template </H1>

      <TABLE BORDER="1">
      <TR>
      <TH>Stop_Code</TH>
      <TH>Stop_Name</TH>
      </TR>
      <% 
      	
        List<Stations> slist=(List<Stations>)request.getAttribute("stationList");
		for(Stations s:slist){
	  %>
      	<TR>
       		  <TD> <%= s.getStop_id() %></td>
     		  <TD> <%= s.getStop_name() %></TD>
      </TR>
      <% 
      	} 
      %>
     </TABLE>
     </BODY>
</html>