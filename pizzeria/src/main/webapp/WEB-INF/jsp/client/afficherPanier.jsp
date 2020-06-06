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
		<script src="<c:url value="/js/pizzaselected.js" />"></script>
		<title>Affichage du panier</title>
	</head>
	<body>
	<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
	
	<div class="container">	

	<div class="welcomeBlockH1">
			<h1 class="text-secondary">Panier</h1>
	</div>

	<c:if test="${nbPizza < 1 }">
	<div class="list-group">
	  <a href="#" class="list-group-item list-group-item-action active">
	    Votre panier est vide 
	  </a>

	</div>
	</c:if>

<c:if test="${nbPizza > 0 }">
	<p> Vous avez sélectionné ${nbPizza} d'un montant total ${montant} </p>
	<c:if test = "${SESSION_USER.role.equals(\"USER\")}">
	<p> Votre fidélité vous accorde une réduction de 10%, votre montant final est de ${montantreduit} </p>
	</c:if>
	
	<form method="post" action="/client/panier/del" name="listCart">
	
	
<ol class="breadcrumb">
  <li class="breadcrumb-item active">Les pizzas que vous avez selectionnées.
  <p> Vous pouver supprimer des pizzas de votre panier en les selectionnant</p>
  </li>
</ol>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Image</th>
      <th scope="col">Pizza</th>
      <th scope="col">Description</th>
      <th scope="col">Quantité</th>
      <th scope="col">Prix</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  
  <tbody>
  	<c:forEach items="${listepizzas}" var="pizza"  varStatus="theCount">  
	    <tr class="contentTR">	 
	      <td>
	      <input type="checkbox" id="pizza_${pizza.id}" name="pizza_${pizza.id}" value="${pizza.id}" />
		    <label for="pizza_${pizza.id}"><img src="/images/r${theCount.count}.jpg" alt="${pizza.libelle}" class="imgAutoSize" /></label>
	      </td>
	      <td><c:out value="${pizza.libelle}" /></td>
           <td>
	      <c:forEach items="${pizza.compoIngredient}" var="ing">
				<c:out value="${ing.nom}" />
		  </c:forEach>
	      </td>
	      <td>1</td>
	      <td><c:out value="${pizza.prix} "/></td>
	      <td><input type=button name="ok" value="Supprimer" onclick="confirmAction(this.listCart);"></td>
	    </tr> 
    </c:forEach>   
  </tbody>
</table>
				
<%-- 
						<b><c:out value="${pizza.libelle} "/>
						
						<c:out value="${ing.libelle}" /></b>
						<input type="checkbox" name="pizza_${pizza.id}" value="${pizza.id}">
						<c:forEach items="${pizza.compoIngredient}" var="ing">
						<c:out value="${ing.nom}" />
						</c:forEach>
						<b><c:out value="${pizza.prix} "/></b>
					</fieldset>	
				</c:forEach>
					</fieldset>
			<fieldset>
			
		</fieldset>
            <input type="submit" name="ok" value="Supprimer">
          --%>   
	
		<div class="mt-5 text-center">           
            <!-- Ajout des pizzas selectionnées-->
			<c:url value="/client/panier/paiement" var="url"></c:url>
            <a href="${url}" class="btn btn-primary">Confirmer votre commande</a>		
         </div>
		</form>
		</c:if>

		<div class="mt-5 text-center">
			<!-- Ajout des pizzas selectionnées-->
			<c:url value="/client/choix" var="url"></c:url>
            <a href="${url}" class="btn btn-secondary">Continuez votre achat</a>
		</div>
		
		</div>
	</body>
</html>