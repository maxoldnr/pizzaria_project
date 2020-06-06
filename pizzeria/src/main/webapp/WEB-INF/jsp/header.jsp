<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary" role="navigation">
<div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
  <a class="navbar-brand" href="/client/choix/">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

     <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
    </ul>
    </div>    
    		
	<c:if test = "${SESSION_ADMIN.role.equals(\"ADMINISTRATOR\")}">		
	    <div class="mx-auto order-0">
	       <a class="navbar-brand mx-auto" href="/gerant/carte">Menu Gérant</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
	            <span class="navbar-toggler-icon"></span>
	        </button>      
	    </div>
    </c:if>
    
   <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
   	<ul class="nav navbar-nav navbar-right ml-auto">
   		<li class="nav-item"><a class="nav-link" href="/client/panier/afficher">Afficher le panier</a></li>      	
      	<c:if test = "${!SESSION_USER.role.equals(\"USER\") and !SESSION_ADMIN.role.equals(\"ADMINISTRATOR\")}">
		<li class="nav-item"><a class="nav-link" href="/login"><span class="glyphicon glyphicon-log-in"></span>Connexion</a></li>
		<li class="nav-item"><a class="nav-link" href="/inscription"><span class="glyphicon glyphicon-user"></span>Inscription</a></li>
		</c:if>
		<c:if test = "${SESSION_USER.role.equals(\"USER\") or SESSION_ADMIN.role.equals(\"ADMINISTRATOR\")}">
		<li class="nav-item"><a class="nav-link" href="/logout_user"><span class="glyphicon glyphicon-log-in"></span>Déconnexion</a></li>	
		</c:if>
    </ul>
  </div>
 
</nav>