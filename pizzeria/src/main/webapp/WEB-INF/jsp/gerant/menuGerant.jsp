<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Menu Gérant</title>
</head>
<body>
<div id="menu1">
<c:if test = "${SESSION_ADMIN.role.equals(\"ADMINISTRATOR\")}">

	<ul>
		<li class="lmenu AccueilG"><a href="/">Accueil</a></li>
		<li><a href="/gerant/carte/">Gestion carte</a></li>		
		<li><a href="/gerant/carte/pizza/add">Ajouter pizza</a></li>
		<li class="lmenu"><a href="/gerant/ingredients">Gestion des ingredients</a></li>
		<li class="lmenu"><a href="/gerant/commandes">Liste des commandes</a></li>
		<li class="lmenu"><a href="/gerant/users">liste des utilisateurs</a></li>
		<li><a href="/logout_admin">Déconnexion</a></li>	
	</ul>

</c:if>

<div>
<c:if test = "${SESSION_ADMIN.role.equals(\"ADMINISTRATOR\")}">
<p>Session Gérant Activé...</p>
</c:if>
</div>
</div>
</body>
</html>



