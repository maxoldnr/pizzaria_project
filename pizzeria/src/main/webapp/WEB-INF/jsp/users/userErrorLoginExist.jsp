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

<title>Inscription page error login</title>
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
	<h1>Ce login existe dans notre base</h1>
    </div>
    
    <div class="form-content">
			   
	<h2 class="errorform">Ce login existe déjà, merci d'en choisir un autre.</h2>
	
				   
			<p style="text-align:center;"><a href="/inscription">Revenir en arrière</a></p>


    </div>
  </div>
  

</div>  
     
</div>   

</body>
</html>