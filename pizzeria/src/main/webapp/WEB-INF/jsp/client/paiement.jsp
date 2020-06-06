<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<c:url value="/css/main.css" var="jstlCss" />
		<link href="${jstlCss}" rel="stylesheet" />
		<title>Paiement de votre commande</title>
	</head>
	<body>
	
	<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
	
	<div class="container">	

	<div class="welcomeBlockH1">
			<h1 class="text-secondary">Paiment</h1>
	</div>
	
	<p> Vous avez commandé <b>${nbPizza} pizzas</b> pour un montant total de ${montant}</p>
	<c:if test = "${SESSION_USER.role.equals(\"USER\")}">
		<p> Votre fidélité vous accorde une réduction de 10%, votre montant final est de ${montantreduit} </p>
	</c:if>
	<p> <b> Ci-dessous choisissez votre moyen de paiement</b></p>
	
	
	<form method="post" action="/client/panier/confirm" >
		<fieldset>
				<legend>Mode de paiement </legend>
				<input name="payMode" type="radio" value="1">
				<legend>Carte MasterCard </legend>
				<input name="payMode" type="radio" value="2">
				<legend>PayPal </legend>
				<input name="payMode" type="radio" value="3">			
				
		</fieldset>
		
			<fieldset>			
            	<input type="submit" name="ok" value="Payer">         
			</fieldset>
	</form>
		
   </div>
</body>
</html>