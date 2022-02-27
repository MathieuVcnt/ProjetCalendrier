<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    </ul>
    <form:form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/logout" method="post">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" value="logout">Deconnexion</button>
    </form:form>
  </div>
</nav>
<div class="text-center">
<h1>Bienvenue sur votre menu ! Monsieur <security:authentication property="principal.username"/></h1>
<br><br>
<h3>Voulez-vous prendre un rendez-vous à la piscine ? <br><a href="menupiscine">Rendez-vous piscine</a></h3>
<br><br>
<h3>Voulez-vous prendre un rendez-vous chez le médecin ? <br><a href="menumedecin">Rendez-vous médecin</a></h3>
</div>
</body>
</html>
