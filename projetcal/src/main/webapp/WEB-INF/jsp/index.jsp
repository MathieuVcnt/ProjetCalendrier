<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
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

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" >Bonjour <security:authentication property="principal.username"/></a>


  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/profil?username=<security:authentication property="principal.username"/>">Mon Profil</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
      </li>
    </ul>
    <form:form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/logout" method="post">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" value="logout">Deconnexion</button>
    </form:form>
  </div>
</nav>
<%! 
	public class Cpt{
		private int val=0;
		
		public String getValeur(){
			return ""+val;
		}
		public void incremente(){
			val++;
		}
	}
	%>
	
	
<%	
	LocalDate dateJour = LocalDate.now();
	LocalDate date = null;
	if (request.getParameter("date") != null) {
		dateJour = LocalDate.parse(request.getParameter("date"));
	}
	if (dateJour.getMonthValue() < 10) {
		date = LocalDate.parse(dateJour.getYear() + "-0" + dateJour.getMonthValue() + "-01");
	} else {
		date = LocalDate.parse(dateJour.getYear() + "-" + dateJour.getMonthValue() + "-01");
	}
	%>
	<div align="center">
		<h2><%=date.getMonth() + "  " + date.getYear()%></h2>
	</div>
	<br>
	<br>
	<table class="table table-bordered ">
		<thead>
			<tr>
				<%
				for (int k = 0; k < 7; k++) {
				%>
				<th scope="col"><%=date.getDayOfWeek().MONDAY.plus(k)%></th>
				<%
				}
				%>
			</tr>
		</thead>
		<tbody>
			<%
			int nbrJourMoisPrecedent = date.getMonth().minus(1).maxLength();
			int mois = date.getMonthValue();
			int premierJour = date.withMonth(mois).getDayOfWeek().getValue();
			int ecart = premierJour - 1;
			int nbr = nbrJourMoisPrecedent - ecart;
			for (int i = 0; i < 6; i++) {
			%>
			<tr>
				<%
				if (i == 0) {
					for (int j = 1; j < 8; j++) {
						nbr++;
						if (nbr % nbrJourMoisPrecedent == 1 ) {
							nbr = 1;
						}
						if(nbr>7){
							%>
							<td class="table-secondary " ><p class="text-black-50"><%=nbr%></p></td>
							<%
						}else{
							%>
							<td onclick="location.href='index?date=<%=date%>'"><p class="text-body"><%=nbr%></p>
							<%
							Cpt global = (Cpt)session.getAttribute("global"+nbr);
								if(global==null){
									global=new Cpt();	
									session.setAttribute("global"+nbr,global);
								}
								global.incremente(); 
								%>
								<%=global.getValeur() %>
							
							</td>
							<%								
					}
					}
				} else if(i==4 || i==5){
					for (int j = 1; j < 8; j++) {
						nbr++;
						if (nbr % date.lengthOfMonth() == 1) {
							nbr = 1;
						}
						if(nbr<14){
							%>
							<td class="table-secondary"><p class="text-black-50"><%=nbr%></p></td>
							<%
						}else{
								%>
							<td onclick="location.href='index?date=<%=date%>'">
								<p class="text-body"><%=nbr%>
								</p>
								<%
								Cpt test = (Cpt)session.getAttribute("test"+nbr);
								if(test==null){
									test=new Cpt();	
									session.setAttribute("test"+nbr,test);
								}
								test.incremente(); 
								%>
								<%=test.getValeur() %>
							</td>
							<%							
						}
					}
				}else{
					
				for (int j = 1; j < 8; j++) {
					nbr++;
					if (nbr % date.lengthOfMonth() == 1) {
						nbr = 1;
					}
					
					%>
					<td onclick="location.href='index?date=<%=date%>'"><p class="text-body"><%=nbr%></p>
					<%
					Cpt ligne = (Cpt)session.getAttribute("ligne"+nbr);
					if(ligne==null){
						ligne=new Cpt();	
						session.setAttribute("ligne"+nbr,ligne);
					}
					ligne.incremente(); 
					%>
					<%=ligne.getValeur() %>
					</td>
					<%
					}
				}
				%>
			</tr>
			<%
			}
			
			%>
		</tbody>
	</table>
	<div class="mx-auto" style="width: 200px;">
	<form method="get" action="/index">
		<div class="btn-group" role="group" aria-label="Basic example">
			<a href="index?date=<%=date.minusMonths(1)%>" title="precedent"
				class="btn btn-outline-secondary">Précédent</a> &emsp;&emsp; 
			<a href="index?date=<%=date.plusMonths(1)%>" title="suivant"
				class="btn btn-outline-secondary">Suivant</a>
		</div>
	</form>
	</div>
</body>
</html>
