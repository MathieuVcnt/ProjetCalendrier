<%@page import="java.sql.Date"%>
<%@page import="org.springframework.format.annotation.DateTimeFormat"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.time.Month"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.time.LocalDate"%>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body>
<%
Date date =  Date.valueOf(request.getParameter("date"));
%>
<div align="center">
<br><br>
<h1>Bienvenue sur la page des Rendez-vous</h1>
<br><br>
<h5>A quelle heure souhaitez-vous prendre rendez-vous pour la date du <%=date %> ?</h5><br><br>

<c:if test="${msg!=null}">
	<p style="color: green">${msg}</p>
</c:if>
<div style="width:60%">
<table class="table table-bordered">
  <thead class="table-dark">
  	<tr align="center">
  		<th style="width: 40%" >Créneau </th>
  		<th style="width: 40%" >Réservations </th>
  	</tr>
  </thead>
  <tbody>
  <%
List<String> heure = new ArrayList<String>();
for(int h=8;h<21;h++){
	if(h<10){
		heure.add(date + " 0"+h+":00");	
	}else{
		heure.add(date + " "+h+":00");
	}
}
int i=8;
  %>
  <c:forEach items="<%=heure %>" var="element">
    <tr>
      <td align="center"><%=i %>h</td>
      <td>
      <form action="" method="post">
      	<div class="d-flex justify-content-center">
      	<input type="hidden" name="heure" value="${element}">
      	<button type="submit">Reserver</button>
 		</div>
 	  </form>
 	  </td>
    </tr>
      <%i++;%>
    </c:forEach>
  </tbody>
</table>
  </div>
	<div class="mx-auto" style="width: 200px;">
		&emsp;&emsp; <div class="btn-group" role="group" aria-label="Basic example">
		<a href="menumedecin" class="btn btn-outline-secondary">Retour au Menu</a>
	</div>
	</div>
	</div>
</body>
</html>
