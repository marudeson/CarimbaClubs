<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<meta name="description" content="">
<title>Home | Carimba</title>
<link rel="stylesheet" type="text/css" href="css/cs.css">
<link rel="icon" type="image/x-icon" href="imagem/logoI.png">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

</head>

<body>
  <div class="text-center" id="inicio" >
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
	  <header class="masthead mb-auto">
	    <div class="inner" id="es5">
		  <h3 class="masthead-brand">CarimbaClubs</h3>
		  <nav class="nav nav-masthead justify-content-center">
		    <a class="nav-link active" href="${pageContext.request.contextPath}/Service?pagina=home">Home</a>
			<a class="nav-link" href="${pageContext.request.contextPath}/Service?pagina=cadastro">Cadastrar-se</a>
			<a class="nav-link" href="${pageContext.request.contextPath}/Service?pagina=login">Fazer Login</a>
		  </nav>
		</div>
	 </header>
	 <main role="main" class="inner cover" id="es5">
	   <div class="row justify-content-md-center">
	     <img src="imagem/logo.png" width="400" id="logo">
	   </div>
	   <p class="lead" style="font-size: 20px;">BEM VINDO AO CARIMBACLUBS, AQUI VOCÊ CONVIDAR SEU TIME E AGENDAR SUAS PARTIDAS DE CARIMBA!!</p>
	   <p class="lead">
	     <a href="${pageContext.request.contextPath}/Service?pagina=cadastro" class="btn btn-lg btn-secondary" id="es5"
		  style="border-radius: 25px; color: #f85c70;">Cadastre-se</a>
	   </p>
	 </main>
	 <div class="mastfoot mt-auto">
	   <div class="inner" id="es5">
	     <p>CC, 2020</p>
	   </div>
	</div>
  </div>
</div>
<div class="container" id="es5">
  <hr class="featurette-divider">
  <div class="row featurette">
    <div class="col-md-7">
	  <h2 class="featurette-heading">Gostou? <span class="text-muted">Que tal?</span></h2>
	  <p class="lead">O CARIMBA É UM ESPORTE DE POUCA EXPRESSÃO AQUI NO BRASIL. DESSA FORMA, RESOLVEMOS CRIAR ESSE SITE 
PARA TODOS OS  PÚBLICOS, TANTO OS NOVOS JOGADORES QUANTO OS MAIS EXPERIENTES.</p>
	</div>
	<div class="col-md-5">
	  <img src="imagem/time.gif">
	</div>
  </div>
  <hr class="featurette-divider">
  <div class="row justify-content-md-center">
    <img src="imagem/Queimada.png" width="400" id="es5">
  </div>
  <hr class="featurette-divider">
  <div class="row align-items-center justify-content-between mb-5	 pt-5 mb-lg-3 text-center" id="es5">
    <div class="col-sm-4 px-sm-4 pb-5">
	  <img src="imagem/agenda.png">
	  <h5 class="my-3 text-bold">Organização</h5>
	  <p class="text-gray-soft">Você podera entender facilmente como
			fazer seu agendamento a parti do momento que se cadastra.</p>
	</div>
	<div class="col-sm-4 px-sm-4 pb-5">
	  <img src="imagem/bol.png" id="bol">
	  <h5 class="my-3 text-bold">Cadastre-se</h5>
	  <p class="text-gray-soft">Não perca tempo! Não se esqueça de se
		cadastrar para acompanhar seus jogos.</p>
	</div>
	<div class="col-sm-4 px-sm-4 pb-5">
	  <img src="imagem/hel.png">
	  <h5 class="my-3 text-bold">Dúvidas?</h5>
	  <p class="text-gray-soft">Caso tenha dúvidas. Na sua página
		principal, siga para a página de ajuda ou entre em contato.</p>
	</div>
   </div>
</div>
<footer class="page-footer font-small unique-color-dark pt-4" style="background-color: #f85c70;" id="es5">
  <div class="container">
    <ul class="list-unstyled list-inline text-center py-2" id="es5" style="margin-bottom: 5%">
	  <li class="list-inline-item">
	    <h5 class="mb-1" style="color: #ffe8fe !important; margin-top: 12%">Não perca tempo!</h5>
	  </li>
	  <li class="list-inline-item"><a href="${pageContext.request.contextPath}/Service?pagina=cadastro"
		class="btn btn-rounded" style="border-color: #ffe8fe; color: #fff">Cadastre-se</a>
	  </li>
	</ul>
	<h5 class="text-uppercase" style="margin-top: -3%; color: #ffd6ea; text-align: center;">Contatos</h5>
    <div class="social-icons" style="text-align: center;">
      <a><i class="fa fa-google"></i></a> <a><i class="fa fa-twitter"></i></a>
     <a><i class="fa fa-facebook"></i></a> <a><i class="fa fa-instagram"></i></a> <a><i class="fa fa-whatsapp"></i></a>
     <a><i class="fa fa-linkedin"></i></a>
   </div>
  </div>
  <div class="footer-copyright text-center py-3" id="fu" style="background-color: #DC143C;">
		© 2020 Copyright: <a href="${pageContext.request.contextPath}/Service?pagina=home">
		CarimbaClubs</a>
  </div>

</footer>


</body>
</html>