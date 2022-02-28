<%@page import="fr.da2i.projetcal.repository.UtilisateurRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Profil</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" >Bonjour <security:authentication property="principal.username"/></a>


  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/menu">Menu</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/menu">Mes réservations</a>
      </li>
    </ul>
    <form:form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/logout" method="post">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" value="logout">Deconnexion</button>
    </form:form>
  </div>
</nav>
<div class="card text-center">
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
            <span class="font-weight-bold"><security:authentication property="principal.username"/></span><span> </span></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-center">Profil</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Nom d'utilisateur</label><input type="text" class="form-control" value="${utilisateurs.username}"></div>
                    <div class="col-md-6"><label class="labels">Mot de passe</label><input type="password" class="form-control" value=""/> </div>
                </div>
                <div class="row mt-3">
                	<div class="col-md-12"><label class="labels">Adresse Mail</label><input type="email" class="form-control" value="${utilisateurs.email}"></div>
                    <div class="col-md-12"><label class="labels">Adresse</label><input type="text" class="form-control" value="${utilisateurs.adresse}"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6"><label class="labels">Ville</label><input type="text" class="form-control"  value="${utilisateurs.ville}"></div>
                    <div class="col-md-6"><label class="labels">Numéro de téléphone</label><input type="text" class="form-control" value="${utilisateurs.tel}" ></div>
                </div>
                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Sauvegarder</button></div>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>
