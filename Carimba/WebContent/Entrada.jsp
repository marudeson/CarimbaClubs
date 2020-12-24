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
	<c:set var="resul" value="${requestScope['resul']}"></c:set>
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
					href="${pageContext.request.contextPath}/Service?pagina=agendar&user=${user.usuario}">Agendar</a>
				</li>
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

	<section class='jumbotron text-center'>
		<div class='container'>
			<h1 class='jumbotron-heading'>
				Seja Bem vindo
				<c:out value="${user.tipo}"></c:out>
			</h1>
			<h4 class='lead text-muted'>
				Repasse essa <span style="font-weight: bold">senha</span> para os
				integrantes do seu time: <span style="font-weight: bold"><c:out
						value="${user.time.idt}"></c:out></span>. Ela servirá para que eles
				possam participar do mesmo
			</h4>
			<p class='lead text-muted'>Aqui você poderá fazer o agendamento
				dos seu jogos, fique atento ao dia do jogo para não perdê-lo.</p>
			<p>
				<a
					href="${pageContext.request.contextPath}/Service?pagina=agendar&user=${user.usuario}"
					class='btn btn-primary my-2' id='bt'>Agendar Jogo</a> <a
					href="${pageContext.request.contextPath}/Service?pagina=jogos&user=${user.usuario}"
					class='btn btn-secondary my-2' id='btd'>Ver jogos agendados</a>
			</p>
		</div>
	</section>

	<div class='container'>
		<div class='my-3 p-3 bg-white rounded box-shadow'>
			<h6 class='border-bottom border-gray pb-2 mb-0'>Participantes do
				time</h6>
			<c:set var="chave" value="${false}"></c:set>
			<c:forEach items="${resul}" var="atual">
				<c:if test="${!atual.tipo.equals('Treinador')}">
					<c:set var="chave" value="${true}"></c:set>
					<div class='media text-muted pt-3'>
						<img
							data-src='holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1'
							alt='' class='mr-2 rounded'>
						<p
							class='media-body pb-3 mb-0 small lh-125 border-bottom border-gray'>
							<strong class='d-block text-gray-dark'>Jogador: <c:out
									value="${atual.usuario}"></c:out> | Camisa: <c:out
									value="${atual.ncamisa}"></c:out></strong>
						</p>
					</div>
				</c:if>
			</c:forEach>
			<c:if test="${!chave}">
				<br>
				<p>Não há nenhum partipante em seu time, envie a senha do time
					para os seus jogadores!</p>
			</c:if>
		</div>
		<a
			href="${pageContext.request.contextPath}/Service?pagina=ajuda&user=${user.usuario}"
			target='_blank' target='_blank'> <img src='imagem/ajuda.png'
			title='Está com dúvidas? Aperte aqui' id='help'
			style='margin-bottom: 10%'>
		</a>
	</div>
	<c:import url="includes/footer.jsp"></c:import>