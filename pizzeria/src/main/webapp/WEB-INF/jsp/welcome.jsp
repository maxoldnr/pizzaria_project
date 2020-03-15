<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />

<title>Bienvenue sur le site MIAM-MIAM</title>
</head>

<body>

<jsp:include page="/WEB-INF/jsp/client/menuClient.jsp"></jsp:include>

<div id="framecontent">
<div class="innertube">

<jsp:include page="/WEB-INF/jsp/client/menuClient.jsp"></jsp:include>

</div>
</div>


<div id="maincontent">
<div class="innertube">
<div class="container">

<div class="welcomeBlockH1">
<h1 class="text-secondary">Bienvenue sur le site MIAM-MIAM</h1>
</div>


 <!-- ----------------  +++++++++++++++++++++++++++  -->
<div class="row">
  <div class="col">
  	<figure>
  		<img alt="pizza miam miam" src="/images/r1.jpg">
  		<figcaption>Pizza du jour</figcaption>
  		<p>Le top</p>
   </figure>
 </div>
  <div class="col">
 	<figure>
 		<img alt="pizza miam miam" src="/images/r2.jpg">
 		<figcaption>Pizza du jour</figcaption>
 		<p>Le top</p>
  </figure>
</div>
 <div class="col">
 	<figure>
 		<img alt="pizza miam miam" src="/images/r3.jpg">
 		<figcaption>Pizza du jour</figcaption>
 		<p>Le top</p>
  </figure>
</div>
  <div class="col">
 	<figure>
 		<img alt="pizza miam miam" src="/images/r4.jpg">
 		<figcaption>Pizza du jour</figcaption>
 		<p>Le top</p>
  </figure>
</div>
</div>
<div class="row">
  <div class="col">
  	<figure>
  		<img alt="pizza miam miam" src="/images/r5.jpg">
  		<figcaption>Pizza du jour</figcaption>
  		<p>Le top</p>
   </figure>
 </div>
  <div class="col">
 	<figure>
 		<img alt="pizza miam miam" src="/images/r6.jpg">
 		<figcaption>Pizza du jour</figcaption>
 		<p>Le top</p>
  </figure>
</div>
 <div class="col">
 	<figure>
 		<img alt="pizza miam miam" src="/images/r7.jpg">
 		<figcaption>Pizza du jour</figcaption>
 		<p>Le top</p>
  </figure>
</div>
  <div class="col">
 	<figure>
 		<img alt="pizza miam miam" src="/images/r8.jpg">
 		<figcaption>Pizza du jour</figcaption>
 		<p>Le top</p>
  </figure>
</div>
</div>

<div class="row">
<div class="col">
<button type="button" class="btn btn-success accbtn"><a href="/client/choix" role="button">Cliquer pour selectionner une pizza</a></button>
</div>
</div>
</div>
</div>
</div>



</body>

</html>