<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Gestion de la carte</title>
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
		<fieldset>
				<legend>La carte</legend>
				<!-- Itérations des éléments de la carte -->
				<c:forEach items="${listepizzas}" var="pizza">
					<fieldset>
						<b><c:out value="${pizza.libelle}"/></b>
						<ul>
							<!-- Itérations des ingrédients de la pizza -->
							<c:forEach items="${pizza.compoIngredient}" var="ingredient">
								<li><c:out value="${ingredient.nom}"/></li>
							</c:forEach>
						</ul>
						<b><c:out value="${pizza.prix}"/>€</b>
						<c:url value="/gerant/carte/pizza/del" var="url">
                           <c:param name="id" value="${pizza.id}"/>
                        </c:url>
                        <a href="${url}">Supprimer</a>
                        <c:url value="/gerant/carte/pizza/upd/${pizza.id}" var="url">
                        </c:url>
                        <a href="${url}">Modifier</a>
					</fieldset>
				</c:forEach>
		</fieldset>
		<fieldset>
			<!-- Ajout d'une pizza -->
			<c:url value="/gerant/carte/pizza/add" var="url">
            </c:url>
            <a href="${url}">Ajouter Pizza</a>
		</fieldset>
		
		</div></div>
	</body>
</html>