<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="css/css.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
<link rel="icon" type="image/x-icon" href="imagem/logoI.png">
<title>Tutorial e Dúvidas Frequentes</title>

<style>
#ajuda {
	font-size: 50px;
	color: red;
	margin: 20px 19px;
	text-align: center;
	
}

.card {
	background-color: #ffd9dd;
	box-shadow: 2px 10px 5px #DC143C;
	color: #000;
}

.card-title {
	font-weight: bold;
}

.ultimo {
	float: left;
	width: 100%;
	text-align: center;
	padding: 3% 4%;
	background-color: #bf1548;
	color: #fff;
}

.social-icons a {
	font-size: 1.5em;
	color: #fff;
	margin: 1%;
	cursor: pointer;
}

.social-icons a:last-child {
	margin-right: 0px;
}

.social-icons a:hover {
	color: #000000;
}
</style>
</head>
<body style="background-color:#f67;">
	<c:set var="user" value="${requestScope['user']}"></c:set>
	<input type="hidden" name="pagina" value="ajuda">
	<h1 id="ajuda" style="color:#fff;">Tutorial e Dúvidas Frequentes</h1>
	<div class="row row-cols-1 row-cols-md-3"
		style="margin: 2px; padding: 10px 14px;">
		<c:if test="${user.tipo.equals('Treinador')}">
			<div class="col mb-4">
				<div class="card">
					<img src="imagem/ca5.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Para que serve a senha que eu recebo?</h5>
						<p class="card-text">Sua senha servirá para que os integrantes
							do seu time possam participar nele. Portanto repasse ela para
							eles!</p>
					</div>
				</div>
			</div>
			<div class="col mb-4">
				<div class="card">
					<img src="imagem/ca3.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Para que serve o Agendar?</h5>
						<p class="card-text">O agendar servirá para que você arquive
							os dados referentes ao seu jogo, como o local, o horário e data.
							Você poderá acessá-lo no menu ao clicar em "Agendar".</p>
					</div>
				</div>
			</div>
			<div class="col mb-4">
				<div class="card">
					<img src="imagem/ca2.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Qual a função da opção "Ver jogos
							agendados"?</h5>
						<p class="card-text">Após o Treinador fazer o agendamento, os
							usuarios que fazem parte deste time poderão ter acesso ao dados,
							desse modo poderão ficar atento ao dia dos seus jogos.</p>
					</div>
				</div>
			</div>
			<div class="col mb-4">
				<div class="card">
					<img src="imagem/ca1.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Como faço para deletar o jogo
							agendado?</h5>
						<p class="card-text">
							Você deve ir na página <a
								href="${pageContext.request.contextPath}/Service?pagina=jogos&user=${user.usuario}"
								style="font-weight: bold; text-decoration: underline red; color: #000">Ver
								jogos agendados</a> e procurar uma lixeira na sua tabela, ao clicar
							nela basta confirmar que deseja exclui-lo.
						</p>
					</div>
				</div>
			</div>
			<div class="col mb-4">
				<div class="card">
					<img src="imagem/ca4.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Como deleto meu time?</h5>
						<p class="card-text">Para deletar seu time você deverá ir na
							página de configuração e deletar sua conta, automaticamente seu
							time será excluido.</p>
					</div>
				</div>
			</div>
		</c:if>


		<c:if test="${user.tipo.equals('Jogador')}">
			<div class="col mb-4">
				<div class="card">
					<img src="imagem/ca2.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Como faço para participar do meu time?</h5>
						<p class="card-text">
							Quando estiver logado, vá na página <a
								style="font-weight: bold; text-decoration: underline red; color: #000"
								href="${pageContext.request.contextPath}/Service?pagina=entrada&user=${user.usuario}">HOME</a>
							clique no botão de mais, ponha o nome e a senha do seu time! Se o
							botão não estiver lá é porque você já faz parte de um time.
						</p>
					</div>
				</div>
			</div>

			<div class="col mb-4">
				<div class="card">
					<img src="imagem/ca1.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Qual a função da opção "Ver jogos
							agendados"?</h5>
						<p class="card-text">Após o Treinador fazer o agendamento, os
							usuarios que fazem parte deste time poderão ter acesso ao dados,
							desse modo poderão ficar atento ao dia dos seus jogos.</p>
					</div>
				</div>
			</div>

			<div class="col mb-4">
				<div class="card">
					<img src="imagem/Cc.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Para que serve o registrar pontuação?</h5>
						<p class="card-text">Se você é jogador, deve estar se
							perguntando isso. Essa página serve para que você possa se
							lembrar das suas vitórias. Poderá registrar quantas pessoas
							carimbou para acessar sempre que precisar!</p>
					</div>
				</div>
			</div>
			<div class="col mb-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Como posso sair do meu time?</h5>
						<p class="card-text">Para sair do seu time você deverá ir a
							página de configuração e apertar em sair time, depois deve
							confirmar.</p>
					</div>
				</div>
			</div>
		</c:if>
		<div class="col mb-4">
			<div class="card">
				<img src="imagem/ca4.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">O que faço na página de configuração?</h5>
					<p class="card-text">Nessa página você poderar alterar seus
						dados. Além disso, também poderá deletar sua conta</p>
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>




