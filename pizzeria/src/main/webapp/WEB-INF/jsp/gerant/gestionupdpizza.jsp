<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modifier une pizza</title>
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />
	</head>
	<body>
		<c:if test = "${!SESSION_ADMIN.role.equals(\"ADMINISTRATOR\")}">
			<jsp:forward page="/"/>
		</c:if>
	<div id="framecontent">
<div class="innertube">

<jsp:include page="/WEB-INF/jsp/gerant/menuGerant.jsp"></jsp:include>

</div>
</div>

<div id="maincontent">
<div class="innertube">

		<div class="ajout">
          <form method="post" action="/gerant/carte/pizza/upd" >
		   <input type="hidden" name="action" value="modifier">
		   <input type="hidden" name="id" value="${pizza.id}">
		   <label>Nom<input type="text" name="libelle" value="${pizza.libelle}"> </label>
		   <label>Prix<input type="text" name="prix" value="${pizza.prix}"></label>
		   
		   <!-- Choix des ingrédients à ajouter -->
		   <ul>
				<c:forEach items="${listeingredients}" var="ingredient">
				    <c:set var="bingredient" value="false" />
					<c:forEach items="${pizza.compoIngredient}" var="ingredientpizza">
						<c:if test = "${ingredientpizza.id == ingredient.id}">
							<c:set var="bingredient" value="true" />
						</c:if>
					</c:forEach>
					<li><input type="checkbox" name="ingre${ingredient.id}" value="${ingredient.id}" ${bingredient=="true"?"checked":""}>${ingredient.nom}</li>
				</c:forEach>	
		   </ul>
		   
		   <input type="submit" value="Modifier">
		  </form>
		</div>
		</div></div>
	</body>
</html>