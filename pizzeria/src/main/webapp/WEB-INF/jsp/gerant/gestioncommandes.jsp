<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="/css/gerant.css" rel="stylesheet" />
		<meta charset="UTF-8">
		<title>Liste des commandes</title>
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
				<legend>Commandes En Cours</legend>
				<table>
					<th>Id commande</th>
					<th>Date et heure</th>
					<th>Id client</th>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Status</th>
					<!-- Itérations des éléments de la liste des commandes -->
					<c:forEach items="${listecommandes}" var="commande">
						<c:if test = "${commande.status.equals(\"En cours\")}">
							<tr>
								<td><c:out value="${commande.numero}"/></td>
								<td><c:out value="${commande.date}"/></td>
								<td><c:out value="${commande.user_id.id}"/></td>
								<td><c:out value="${commande.user_id.nom}"/></td>
								<td><c:out value="${commande.user_id.prenom}"/></td>
								<td><c:out value="${commande.status}"/></td>
								<td>
		                          <c:url value="/gerant/commandes/update/${commande.numero}" var="url">
		                          </c:url>
		                          <a href="${url}">Modifier</a>
                        		</td>
								<td>
		                          <c:url value="/gerant/commandes/details/${commande.numero}" var="url">
		                          </c:url>
		                          <a href="${url}">Détails</a>
                        		</td>                         		               
							</tr>
						</c:if>	
					</c:forEach>
				</table>
		</fieldset>
		<fieldset>
			<legend>Commandes Terminées</legend>
				<table>
					<th>Id commande</th>
					<th>Date et heure</th>
					<th>Id client</th>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Status</th>
					<!-- Itérations des éléments de la liste des commandes -->
					<c:forEach items="${listecommandes}" var="commande">
						<c:if test = "${commande.status.equals(\"Terminee\")}">
							<tr>
								<td><c:out value="${commande.numero}"/></td>
								<td><c:out value="${commande.date}"/></td>
								<td><c:out value="${commande.user_id.id}"/></td>
								<td><c:out value="${commande.user_id.nom}"/></td>
								<td><c:out value="${commande.user_id.prenom}"/></td>
								<td><c:out value="${commande.status}"/></td>
								<td>
		                          <c:url value="/gerant/commandes/update/${commande.numero}" var="url">
		                          </c:url>
		                          <a href="${url}">Modifier</a>
                        		</td>
								<td>
		                          <c:url value="/gerant/commandes/details/${commande.numero}" var="url">
		                          </c:url>
		                          <a href="${url}">Détails</a>
                        		</td>                            		              
							</tr>
						</c:if>	
					</c:forEach>
				</table>
		</fieldset>
		</div></div>
	</body>
</html>