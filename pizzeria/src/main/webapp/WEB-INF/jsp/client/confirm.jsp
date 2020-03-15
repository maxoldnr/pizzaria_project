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
<title>Confirmation du paiement</title>
</head>
<body>
	<div id="framecontent">
	<div class="innertube">
	
	<jsp:include page="/WEB-INF/jsp/client/menuClient.jsp"></jsp:include>
	
	</div>
	</div>
	
	<div id="maincontent">
	<div class="innertube">
     <p><b>votre commande est payée!</b></p>
     
    </div></div>
</body>
</html>