<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8" />
<meta name="author" content="Maxo L" />
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
	<h1>Espace d'inscription</h1>
    </div>
    
    <div class="form-content">
     
     <c:url value="/addformAction" var="urlform"></c:url>
  		<form:form modelAttribute="addformAction" method="post" action="addformAction">  
  		
 		  <div class="form-group">
          <form:label path="nom">Nom</form:label>
          <form:input type="text" path="nom" id="userlastname" name="userlastname" required="required"/>
        </div>
              
        <div class="form-group">
          <form:label path="prenom">Prénom</form:label>
          <form:input type="text" path="prenom" id="userfirstname" name="userfirstname" required="required"/>
        </div>
        
          <div class="form-group">
          <form:label path="adresse">Indiquer une adresse de livraison</form:label>
          <form:input type="text" path="adresse" id="adresse" name="adresse" />
        </div>

        
          <div class="form-group">
          <form:label path="login">Choisir un login</form:label>
          <form:input type="text" path="login" id="username" name="username" required="required"/>
        </div>
        
        <div class="form-group">
          <form:label path="passwd">Choisir un mot de passe</form:label>
          <form:input type="password" path="passwd" id="password" name="password" required="required"/>
        </div>
        <div class="form-group">
          <form:label path="cpasswd">Confirmer le mot de passe</form:label>
          <form:input type="password" path="cpasswd" id="cpassword" name="cpassword" required="required"/>
        </div>
        
     
          <form:input type="hidden" path="role" id="role" name="role" value="USER" />
          <form:input type="hidden" path="id" id="id" name="id" value="" />
        

        <div class="form-group">
          <button type="submit">Valider</button>
        </div>
      </form:form>
      
    </div>
  </div>
  

</div>  
     
</div>   

</body>
</html>