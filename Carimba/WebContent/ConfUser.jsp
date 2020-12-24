<%@page import="Modelo.Usuario"%>
<%@page import="Controle.UsuarioControle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Configurações do Usuário</title>
<link rel="stylesheet" type="text/css" href="css/Coisas.css">
<link rel="icon" type="image/x-icon" href="imagem/logoI.png">
</head>
<body>
	<c:set var="user" value="${requestScope['user']}"></c:set>
	<c:set var="erro" value="${requestScope['erro']}"></c:set>
	<nav class='navbar navbar-expand-lg navbar-light bg-light'
		style='margin-bottom: 2%; background-color: #ff8aa1 !important'>
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
				<c:if test="${user.tipo.equals('Treinador')}">
					<li class='nav-item active'><a class='nav-link'
						href="${pageContext.request.contextPath}/Service?pagina=agendar&user=${user.usuario}">Agendar</a>
					</li>
				</c:if>
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
		<div
			class='d-flex align-items-center p-3 my-3 text-white-50 bg-red rounded shadow-sm'>
			<img class='mr-3' src='imagem/conf.png' width='48'>
			<div class='lh-100'>
				<h3 style='color: #fff !important' class='mb-0 lh-100'>Alterar
					dados</h3>
			</div>

		</div>
		<form method='post' action='Service'>
			<input type="hidden" name="servico" value="atualizar" />
			<h5 id='te'>Seus dados</h5>
			<div class='row'>
				<div class='col-md-3 mb-3'>
					<input type='hidden' name='usuario' value="${user.usuario}" /> <label>Seu
						nome: </label><input class='form-control' type='text' name='nome'
						value="${user.nome}" required /><br />
				</div>
			</div>
			<div class='row'>
				<div class='col-md-3 mb-3'>
					<label>Digite sua nova senha: </label><input type='password'
						class='form-control' name='senha' value="${user.senha}" required /><br>
				</div>
				<div class='col-md-3 mb-3'>
					<label>Confirmar nova senha: </label><input type='password'
						class='form-control' name='confSenha' value="${user.senha}"
						required />
				</div>
			</div>
			<input type='submit' name='update' class='btn-in'
				style='margin-left: 1%' value='Atualizar dados' />
		</form>
		<br>
		<hr>
		<c:if test="${user.tipo.equals('Jogador')}">
			<a id='sairT' href='#' style="margin-left: 2%">Sair do time</a>
		</c:if>
		<a id='del' href='#'>Deletar Conta</a> <input type='hidden'
			value="${user.usuario}" id='user'>
		<c:if test="${user.tipo.equals('Treinador')}">
			<p>
				<span style="font-weight: bold">Obs: </span>Se você deletar sua
				conta, seu time também será deletado! Seus jogadores ficarão sem
				time.
			</p>
		</c:if>
	</div>
	<br>
	<br>
	<script src='js/Jquery.js'></script>
	<script src='js/bootstrap.min.js'></script>
	<script src='js/sweet.js'></script>
	<script src="js/confUser.js"></script>
	<c:if test="${erro.equals('ok')}">
		<script>swal("Ok","Saída do time autorizada, agora você pode entrar em outro","success");</script>
	</c:if>
</body>
</html>