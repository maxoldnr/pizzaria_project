<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link href="/css/gerant.css" rel="stylesheet" />
		<meta charset="UTF-8">
		<title>Modification d'une commande</title>
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
	  <h1>Modification d'une commande</h1>
		  <form method="post" action="/gerant/commandes/update" >
			   <input type="hidden" name="action" value="update">
			   <input type="hidden" name="numero" value=${commande.numero}>
			   
			   <!-- Affichage de la commande sélectionnée -->
			   <table>
					<th>Id commande</th>
					<th>Date et heure</th>
					<th>Id client</th>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Status</th>
			   		<tr>
						<td><c:out value="${commande.numero}"/></td>
						<td><c:out value="${commande.date}"/></td>
						<td><c:out value="${commande.user_id.id}"/></td>
						<td><c:out value="${commande.user_id.nom}"/></td>
						<td><c:out value="${commande.user_id.prenom}"/></td>
						<td><c:out value="${commande.status}"/></td>	   
			   		</tr>
		   		</table>
			   		
			   <label>
				   <input type="radio" name="status" value="Terminee"> Terminée
				   <input type="radio" name="status" value="En cours"> En cours
			   </label>
			   <input type="submit" value="Modifier status">
		  </form>
		  </div></div>
	</body>
</html>