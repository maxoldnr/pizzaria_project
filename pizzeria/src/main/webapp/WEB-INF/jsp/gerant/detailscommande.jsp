<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="/css/gerant.css" rel="stylesheet" />
		<meta charset="UTF-8">
		<title>Détail de la commande</title>
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
				<legend>Informations générales</legend>
					<p>Id commande : ${commande.numero}</p>
					<p>Date et heure : ${commande.date} </p>
					<p>Id client : ${commande.user_id.id} </p>
					<p>Nom : ${commande.user_id.nom}</p>
					<p>Prénom : ${commande.user_id.prenom}</p>
					<p>Status : ${commande.status}</p>

		</fieldset>
		<fieldset>
			<legend>Liste des pizzas</legend>
			<!-- Itérations  des pizzas -->
			<c:forEach items="${commande.pizzas}" var="pizza">
				<fieldset>
					<b><c:out value="${pizza.libelle}"/></b>
					<ul>
						<!-- Itérations des ingrédients de la pizza -->
						<c:forEach items="${pizza.compoIngredient}" var="ingredient">
							<li><c:out value="${ingredient.nom}"/></li>
						</c:forEach>
					</ul>

				</fieldset>
			</c:forEach>

		</fieldset>

		</div></div>
	</body>
</html>