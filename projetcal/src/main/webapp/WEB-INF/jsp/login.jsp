<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<div class="card text-center">
<c:if test='${not empty param.inscription}'>
 <div class="card-header">
    <h1>Bienvenue sur la page d'inscription</h1>
  </div>
  <div class="card-body">
    <form:form action="/inscription" method="post">
    	<fieldset>
   	    <c:if test='${not empty param.badInfo}'>
        	<h3 style="color: red">Nom déjà existant !</h3>
        </c:if>
		<br><br>
		<div class="form-group">
			<label for="username">Login</label><br>
			<input type="text" id="username" name="username" placeholder="Username" required="">
		</div>
		<br>
		<div class="form-group">
			<label for="password">Mot de passe</label> <br>
			<input type="password" id="password" name="password" placeholder="Password" required="">
		</div><br>
		<div class="form-group">
    		<label for="email">Adresse mail</label> <br>
    		<input type="email" id="email" name="email" placeholder="Email" required="">
  		</div>
  		<div class="form-group">
    		<label for="tel">Téléphone</label> <br>
    		<input type="tel" id="tel" name="tel" placeholder="0614744514" required="">
  		</div>
   		<button type="submit" class="btn btn-primary">Submit</button>
   		<br><br>
   	    </fieldset>
  	</form:form>
  	</div>
</c:if>
</div>
<c:if test='${empty param.inscription}'>
<div class="card text-center">
 <div class="card-header">
    <h1>Bienvenue sur la page de connexion</h1>
  </div>
  <div class="card-body">
    <form:form action="${pageContext.request.contextPath}/index" method="post">
    	<fieldset>
		<c:if test="${param.error!=null}">
    		<p style="color: red">Login ou mot de passe incorrect</p>
		</c:if>
		<c:if test="${param.logout!=null}">
			<p style="color: green">Déconnexion réussie!</p>
		</c:if>
		<c:if test="${msg!=null}">
			<p style="color: green">${msg}</p>
		</c:if>
		<br><br>
		<div class="form-group">
			<label for="username">Login</label><br>
			<input type="text" name="username" placeholder="Username">
		</div>
		<br><br>
		<div class="form-group">
			<label for="password">Mot de passe</label> <br>
			<input type="password" name="password" placeholder="Password">
		</div>
   		<button type="submit" class="btn btn-primary">Submit</button>
   		<br><br>
   	    </fieldset>
  	</form:form>
  	<div class="card-footer text-muted">  
  		<p>Vous n'êtes pas encore inscrit ? <a href="/login?inscription=true">S'inscrire</a></p>
 </div>
</div>

</div>
</c:if>
</body>
</html>
