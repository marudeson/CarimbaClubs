<%@ page import="Modelo.Usuario"%>
<%@ page import="Modelo.Agenda"%>
<%@ page import="Modelo.EnderecoJogo"%>
<%@page import="Controle.UsuarioControle"%>
<%@page import="Controle.AgendarControle"%>
<%@page import="Controle.EnderecoControle"%>
<%@page import="Controle.DataControle"%>
<%-- <%@page import="java.util.ArrayList" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Seus jogos</title>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" type="text/css" href="css/Coisas.css">
<link rel="icon" type="image/x-icon" href="imagem/logoI.png">
</head>
<body id="bodyJ">
	<c:set var="user" value="${requestScope['user']}"></c:set>
	<c:set var="cT" value="${requestScope['cT']}"></c:set>
	<c:set var="time" value="${cT.selecionarId(user.time)}"></c:set>
	<nav class='navbar navbar-expand-lg navbar-light bg-light'
		style='margin-bottom: 4%; background-color: #ff8aa1 !important'>
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
					href="${pageContext.request.contextPath}/Service?pagina=entrada&user=${user.usuario}">Home</a>
				</li>
				<c:if test="${user.tipo.equals('Jogador')}">
					<li class='nav-item active'><a class='nav-link'
						href="${pageContext.request.contextPath}/Service?pagina=confUser&user=${user.usuario}">Configurações</a>
					</li>
				</c:if>
				<c:if test="${user.tipo.equals('Treinador')}">
					<li class='nav-item active'><a class='nav-link'
						href="${pageContext.request.contextPath}/Service?pagina=agendar&user=${user.usuario}">Agendar</a>
					</li>
				</c:if>
				<li class='nav-item dropdown'><a
					class='nav-link dropdown-toggle' href='#' id='dropdown05'
					data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>Mais</a>
					<div class='dropdown-menu' aria-labelledby='dropdown05'>
						<c:if test="${user.tipo.equals('Treinador')}">
							<a class='dropdown-item'
								href="${pageContext.request.contextPath}/Service?pagina=confUser&user=${user.usuario}">Configurações</a>
						</c:if>
						<a class='dropdown-item'
							href="${pageContext.request.contextPath}/Service?pagina=ajuda&user=${user.usuario}"
							target='_blank'>Tutorial</a> <a class='dropdown-item'
							href="${pageContext.request.contextPath}/Service?pagina=login">Sair</a>
					</div></li>
			</ul>
		</div>
	</nav>
	<div class='page-wrapper chiller-theme'>
		<main class='page-content'>
		<div class='container-fluid'>
			<h3>Seus jogos</h3>
			<hr style='margin-bottom: 2%'>
			<div class='table-responsive'>
				<c:if test="${user.tipo.equals('Treinador')}">
					<table class='table'>
						<thead class='thead-dark'>
							<tr>
								<th scope='col'>Seu time</th>
								<th scope='col'>Adversário</th>
								<th scope='col'>Rua</th>
								<th scope='col'>Nº</th>
								<th scope='col'>Ponto de referência</th>
								<th scope='col'>Data</th>
								<th scope='col'>Horário</th>
								<th scope='col'>Atualizar</th>
								<th scope='col'>Deletar</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="endC" value="${requestScope['endC']}"></c:set>
							<c:set var="dataC" value="${requestScope['dataC']}"></c:set>
							<c:set var="userC" value="${requestScope['userC']}"></c:set>
							<c:set var="tamanho" value="${requestScope['size']}"></c:set>
							<c:set var="lista" value="${requestScope['lista']}"></c:set>
							<c:choose>
								<c:when test="${tamanho!=0}">
									<c:set var="chave" value="${false}"></c:set>
									<c:forEach items="${lista}" var="agenmo">
										<c:set var="listaUser"
											value="${userC.selecionar(agenmo.user.id)}"></c:set>
										<c:if test="${listaUser.time.idt.equals(user.time.idt)}">
											<c:set var="end" value="${endC.selecionarUm(agenmo.end)}"></c:set>
											<c:set var="data" value="${dataC.selecionarUm(agenmo.data)}"></c:set>
											<tr>
												<td><c:out value="${time.nome}"></c:out></td>
												<td><c:out value="${agenmo.timeAdv}"></c:out></td>
												<td><c:out value="${end.rua}"></c:out></td>
												<td><c:out value="${end.numero}"></c:out></td>
												<td><c:out value="${end.PReferencia}"></c:out></td>
												<td><c:out value="${data.dia}/${data.mes}/${data.ano}"></c:out></td>
												<td><c:out value="${agenmo.hora}"></c:out></td>
												<td><a
													href='${pageContext.request.contextPath}/Service?pagina=edit&id=${agenmo.id}'><img
														style='margin-left: 5%' src='imagem/edit.png'></a></td>
												<td><a
													href='${pageContext.request.contextPath}/Service?pagina=confirma&id=${agenmo.id}'><img
														style='margin-left: 5%' src='imagem/deletar.png'></a></td>
											</tr>
											<c:set var="chave" value="${true}"></c:set>
										</c:if>
									</c:forEach>
						</tbody>
					</table>
					<c:if test="${!chave}">
						</tbody>
						</table>
						<center>
							<h4>
								Você ainda não possui nenhum jogo agendado! Agende: <a
									href="${pageContext.request.contextPath}/Service?pagina=agendar&user=${user.usuario}">Agendar</a>
							</h4>
						</center>
					</c:if>
					</c:when>
					<c:otherwise>
						</tbody>
						</table>
						<center>
							<h4>
								Você ainda não possui nenhum jogo agendado! Agende: <a
									href="${pageContext.request.contextPath}/Service?pagina=agendar&user=${user.usuario}">Agendar</a>
							</h4>
						</center>
					</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${user.tipo.equals('Jogador')}">
					<table class='table'>
						<thead class='thead-dark'>
							<tr>
								<th scope='col'>Seu time</th>
								<th scope='col'>Adversário</th>
								<th scope='col'>Rua</th>
								<th scope='col'>Nº</th>
								<th scope='col'>Ponto de referência</th>
								<th scope='col'>Data</th>
								<th scope='col'>Horário</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="endC" value="${requestScope['endC']}"></c:set>
							<c:set var="dataC" value="${requestScope['dataC']}"></c:set>
							<c:set var="userC" value="${requestScope['userC']}"></c:set>
							<c:set var="tamanho" value="${requestScope['size']}"></c:set>
							<c:set var="lista" value="${requestScope['lista']}"></c:set>
							<c:choose>
								<c:when test="${tamanho!=0}">
									<c:set var="chave" value="${false}"></c:set>
									<c:forEach items="${lista}" var="agenmo">
										<c:set var="listaUser"
											value="${userC.selecionar(agenmo.user.id)}"></c:set>
										<c:if test="${listaUser.time.idt.equals(user.time.idt)}">
											<c:set var="end" value="${endC.selecionarUm(agenmo.end)}"></c:set>
											<c:set var="data" value="${dataC.selecionarUm(agenmo.data)}"></c:set>
											<tr>
												<td><c:out value="${time.nome}"></c:out></td>
												<td><c:out value="${agenmo.timeAdv}"></c:out></td>
												<td><c:out value="${end.rua}"></c:out></td>
												<td><c:out value="${end.numero}"></c:out></td>
												<td><c:out value="${end.PReferencia}"></c:out></td>
												<td><c:out value="${data.dia}/${data.mes}/${data.ano}"></c:out></td>
												<td><c:out value="${agenmo.hora}"></c:out></td>
											</tr>
											<c:set var="chave" value="${true}"></c:set>

										</c:if>
									</c:forEach>
						</tbody>
					</table>
					<a
						href="${pageContext.request.contextPath}/Service?pagina=placar&user=${user.usuario}"
						class='btn btn-primary my-2' style="float: right;"
						title="Registre seu jogo" id='bt'>Registrar Pontuação</a>
					<c:if test="${!chave}">
						</tbody>
						</table>
						<center>
							<h4>Seu treinador ainda não agendou nenhum jogo!</h4>
						</center>
					</c:if>
					</c:when>
					<c:otherwise>
						</tbody>
						</table>
						<center>
							<h4>Seu treinador ainda não agendou nenhum jogo!</h4>
						</center>
					</c:otherwise>
					</c:choose>
				</c:if>

			</div>
		</div>
		</main>
	</div>
	<input type='hidden' value="${user.usuario}" id='user'>

	<script src='js/Jquery.js'></script>
	<script src='js/bootstrap.min.js'></script>
	<script src='js/conf.js'></script>
</body>
</html>