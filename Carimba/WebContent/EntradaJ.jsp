<%@ page import="Modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Bem vindo</title>
<link rel="stylesheet" type="text/css" href="css/Coisas.css">
<link rel="icon" type="image/x-icon" href="imagem/logoI.png">
</head>
<body>
	<c:set var="user" value="${requestScope['user']}"></c:set>
	<c:set var="cT" value="${requestScope['cT']}"></c:set>
	<c:set var="time" value="${cT.selecionarId(user.time)}"></c:set>
	<div class='modal fade' id='exampleModalLong' tabindex='-1'
		role='dialog' aria-labelledby='exampleModalLongTitle'
		aria-hidden='true'>
		<div class='modal-dialog' role='document'>
			<div class='modal-content'>
				<div class='modal-header'>
					<h4 class='modal-title' id='exampleModalLongTitle'>Entrar no
						time</h4>
					<button type='button' class='close' data-dismiss='modal'
						aria-label='Close'>
						<span aria-hidden='true'>&times;</span>
					</button>
				</div>
				<div class='modal-body'>
					<form action='Service' method='post'>
						<input type="hidden" name="servico" value="timear" /> <input
							type="hidden" name="user" value="${user.usuario}" /> <label
							for='nome'>Nome do Time: </label> <br> <input type='text'
							name='nome' id='nome' placeholder="Opcional" /> <br> <br>
						<label for='senha'>Senha para participar: </label> <br> <input
							type='text' name='senha' placeholder="Obrigatório"
							onkeypress="return onlynumber()" id='senha' required /> <br>
						<small>Você deve pedir a senha ao seu treinador.</small> <br>
						<br> <input type='submit' class='btn btn-info'
							value='Participar' />
					</form>
				</div>
				<div class='modal-footer'>
					<button type='button' class='btn btn-secondary'
						data-dismiss='modal'>Cancelar</button>
				</div>
			</div>
		</div>
	</div>

	<nav class='navbar navbar-expand-lg navbar-light bg-light'
		style='margin-bottom: 4%; background-color: #ffd4e0 !important'>
		<a class='navbar-brand'
			href='${pageContext.request.contextPath}/Service?pagina=home'><img
			src='imagem/loguinho.png' width='50'></a>
		<button class='navbar-toggler' type='button' data-toggle='collapse'
			data-target='#navbarsExample05' aria-controls='navbarsExample05'
			aria-expanded='false' aria-label='Toggle navigation'>
			<span class='navbar-toggler-icon'></span>
		</button>
		<div class='collapse navbar-collapse' id='navbarsExample05'>
			<ul class='navbar-nav mr-auto'>
				<li class='nav-item active'><a class='nav-link'
					href="${pageContext.request.contextPath}/Service?pagina=jogos&user=${user.usuario}">Seus
						jogos</a></li>
				<li class='nav-item active'><a class='nav-link'
					href="${pageContext.request.contextPath}/Service?pagina=confUser&user=${user.usuario}">Configurações</a>
				</li>
				<li class='nav-item dropdown'><a
					class='nav-link dropdown-toggle' href='#' id='dropdown05'
					data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>Mais</a>
					<div class='dropdown-menu' aria-labelledby='dropdown05'>
						<a class='dropdown-item'
							href="${pageContext.request.contextPath}/Service?pagina=ajuda&user=${user.usuario}"
							target='_blank'>Tutorial</a> <a class='dropdown-item'
							href='${pageContext.request.contextPath}/Service?pagina=login'>Sair</a>
					</div></li>
			</ul>
		</div>
	</nav>

	<div class='container'>
		<c:if test="${user.time.idt==1}">
			<a href='#'><button id='mais' type='button' data-toggle='modal'
					data-target='#exampleModalLong'>
					<img src='imagem/mais.png' title='Entrar em um time? Aperte aqui'
						style='margin-bottom: 10%'>
				</button></a>
			<section class='jumbotron text-center'>
				<h1 class='jumbotron-heading'>Bem vindo ao CarimbaClubs</h1>
				<p class='lead text-muted'>
					Olá
					<c:out value="${user.usuario}"></c:out>
					, Você ainda não faz parte de nenhum time, aperte no botão ali em
					cima e entre no seu time.
				</p>
			</section>
		</c:if>
		<c:if test="${user.time.idt!=1}">
			<section class='jumbotron text-center'>
				<h1 class='jumbotron-heading'>Bem vindo ao CarimbaClubs</h1>
				<p class='lead text-muted'>
					Olá
					<c:out value="${user.usuario}"></c:out>
					, Você faz parte do time
					<c:out value="${time.nome}"></c:out>
					. Fique atento as suas mensagens pois a qualquer momento poderá ser
					o dia de seu jogo
				</p>
				<p>
					<a
						href="${pageContext.request.contextPath}/Service?pagina=jogos&user=${user.usuario}"
						class='btn btn-secondary my-2' id='bt'>Ver jogos agendados</a>
				</p>
			</section>
		</c:if>
	</div>
	<script src="js/soNume.js"></script>
	<c:import url="includes/footer.jsp"></c:import>