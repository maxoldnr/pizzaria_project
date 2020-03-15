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
<div class="container">

  
  
<!-- Form-->
<div class="form">
  <div class="form-toggle"></div>
  <div class="form-panel one">
    
    <div class="form-header">
	<h1>Connexion Admin</h1>
    </div>
    
    <div class="form-content">
			   
	<h2 class="errorform">Espace Admin Connecté </h2>
	
				   
			<p>Login: ${loginIn}</p>
			
			<p>Nom: ${nom}</p>
			<p>Prénom: ${prenom}</p>
				
			<p>Login: ${login}</p>
			<p>PwdDB: ${pwdIn}</p>
			<p>Role: ${roleIn}</p>
			<p>Adresse: ${adresse}</p>
			<p>PWD posted: ${pwdposted}</p>
			<p>SESSION ADMIN Role : ${SESSION_ADMIN.role}</p>
			<p>SESSION ADMIN ID : ${SESSION_ADMIN.id}</p>

    </div>
  </div>
  

</div>  
     
</div>   

</body>
</html>