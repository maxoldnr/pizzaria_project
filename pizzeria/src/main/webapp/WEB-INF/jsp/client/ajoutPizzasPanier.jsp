<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ajout de pizza dans le panier</title>
		<c:url value="/css/main.css" var="jstlCss" />
		<link href="${jstlCss}" rel="stylesheet" />
	</head>
	<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>

	<div class="container">

	<div class="welcomeBlockH1">
	<h1 class="text-secondary">Bienvenue sur le site MIAM-MIAM</h1>
	</div>
	<form method="post" action="/client/panier/add" class="mb-5">
		<fieldset>
				<legend>Les pizzas</legend>
				<!-- Itérations des éléments de la carte -->
			<div class="row">
				<c:forEach items="${listepizzas}" var="pizza" varStatus="theCount">					
					
					  <div class="col">
						  	<figure>
						 
						  	<ul>
							  <li class="contentPizza">
						  <h2 class="titrePizza"><c:out value="${pizza.libelle}"/></h2>
							  <input type="checkbox" id="pizza_${pizza.id}" name="pizza_${pizza.id}" value="${pizza.id}" />
							    <label for="pizza_${pizza.id}"><img src="/images/r${theCount.count}.jpg" alt="${pizza.libelle}" /></label>
							    <div> Ajouter</div>
	  						
						<c:forEach items="${pizza.compoIngredient}" var="ing">							
							<c:out value="${ing.nom}, " />
						</c:forEach>
							  </li>						  		
	  						</ul>	  						
						   </figure>				
					 </div>
				</c:forEach>
			</div>
				
			</fieldset>		
			
		<div class="text-center">			
            	<input type="submit" name="ok" value="Ajouter au Panier" class="btn btn-primary btn-lg" />            
			</div>

		</form>
		</div> 

	</body>
</html>