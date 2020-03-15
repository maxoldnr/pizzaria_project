<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<link href="/css/gerant.css" rel="stylesheet" />
		<meta charset="UTF-8">
		<title>Liste des Clients</title>
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
				<legend>Clients</legend>
				<table>
					<th>Id User</th>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Adresse</th>
					<th>Role</th>
					<!-- Itérations des éléments de la liste des commandes -->
					<c:forEach items="${listeusers}" var="user">
						<c:if test = "${!user.role.equals(\"ADMINISTRATOR\")}">
							<tr>
								<td><c:out value="${user.id}"/></td>
								<td><c:out value="${user.nom}"/></td>
								<td><c:out value="${user.prenom}"/></td>
								<td><c:out value="${user.adresse}"/></td>
								<td><c:out value="${user.role}"/></td>
							</tr>	
						</c:if>
					</c:forEach>
				</table>
		</fieldset>
		</div></div>
	</body>
</html>