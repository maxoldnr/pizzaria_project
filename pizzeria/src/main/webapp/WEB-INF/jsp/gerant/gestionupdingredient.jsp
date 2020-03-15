<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modification ingredient</title>
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

	  <h1>Modification d'un ingredient</h1>
		  <form method="post" action="/gerant/ingredients/update">
			   <input type="hidden" name="action" value="update" />
			   <input type="hidden" name="id" value=${ingredient.id} />
			   <label for="Nom">Nom </label>
			   <input type="text" name="nom" value=${ingredient.nom}>
			   <label for="prix">Prix</label>
			   <input type="text" name="prix" value=${ingredient.prix}>
			   <input type="submit" value="Ajouter" />
		  </form>
		  
		  </div></div>
	</body>
</html>