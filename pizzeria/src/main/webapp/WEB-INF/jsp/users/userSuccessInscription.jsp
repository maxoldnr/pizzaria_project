<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8" />
<c:url value="/css/main.css" var="jstlCss" />
<c:url value="/css/users.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />
<title>Inscription page</title>
</head>
<body>
<div id="headerfixed">
<nav class="nav nav-pills nav-justified">
  <a class="nav-link active" href="/">Accueil</a>
</nav>
</div>
<div class="container">

  
  
<!-- Form-->
<div class="form">
  <div class="form-toggle"></div>
  <div class="form-panel one">
    	
    <div class="form-header">
<h1>Inscription réalisée avec Succèss</h1>	
    </div>
    
    <div class="form-content">
		   
	<h2 class="errorform">Vos informations d'inscription</h2>
	
				   
			<p>Nom: ${nom}</p>
			
			<p>Prénom: ${prenom}</p>
				
			<p>Login: ${login}</p>
			<p>Pwd: ${passwd}</p>
			
			<p>Role: ${role}</p>
			<p>Adresse: ${adresse}</p>


 <div class="formbutton"><button type="button" class="btn btn-success"> <a href="/login" role="button">Aller à votre page de connexion</a></button></div>
    </div>
  </div>
  

</div>  
     
</div> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>  

</body>
</html>