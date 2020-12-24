<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrar Pontua��o</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" type="text/css" href="css/Coisas.css">
<link rel="icon" type="image/x-icon" href="imagem/logoI.png">
</head>
<body>
	<c:set var="user" value="${requestScope['user']}"></c:set>
	<c:set var="pon" value="${requestScope['pon']}"></c:set>
	<c:set var="erro" value="${requestScope['erro']}"></c:set>
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
				<li class='nav-item active'><a class='nav-link'
					href="${pageContext.request.contextPath}/Service?pagina=jogos&user=${user.usuario}">Ver
						Jogos</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class='modal fade' id='exampleModalLong' tabindex='-1'
			role='dialog' aria-labelledby='exampleModalLongTitle'
			aria-hidden='true'>
			<div class='modal-dialog' role='document'>
				<div class='modal-content'>
					<div class='modal-header'>
						<h4 class='modal-title' id='exampleModalLongTitle'>
							Aten��o</h4>
						<button type='button' class='close' data-dismiss='modal'
							aria-label='Close'>
							<span aria-hidden='true'>&times;</span>
						</button>
					</div>
					<div class='modal-body'>Seja Bem vindo! Voc� poder�
						colocar a pontu��o de seus jogos aqui, como sua agendinha
						pessoal do jogo!</div>
					<div class='modal-footer'>
						<button type='button' class='btn btn-secondary'
							data-dismiss='modal'>Ok</button>
					</div>
				</div>
			</div>
		</div>

		<div
			class='d-flex align-items-center p-3 my-3 text-white-50 bg-red rounded shadow-sm'>
			<img class='mr-3' src='imagem/agenda.png' alt='' width='48'
				height='48'>
			<div class='lh-100'>
				<h4 style='color: #fff !important' class='mb-0 lh-100'>Registrar
					Pontua��o</h4>
				<small>2020</small>
			</div>
		</div>
		<div class='my-3 p-3 bg-white rounded shadow-sm'>
			<a href='#'><button id='mais' type='button' data-toggle='modal'
					data-target='#exampleModalLong'>
					<img src='imagem/info.png' title='Informa��o'
						style='margin-bottom: 10%; float: right;'>
				</button></a>
			<h5>Suas vit�rias</h5>
			<form method="post" action="Service">
				<input type="hidden" name="servico" value="pon"> <input
					type="hidden" name="user" value="${user.usuario}">
				<div class='row'>
					<div class='col-md-4 mb-3'>
						<label for='ATime'>Contra que time voc�s venceram?</label> <input
							type='text' class='form-control' id='ATime' name='ta'
							placeholder='Nome do Time advers�rio' value='' required>
					</div>
					<div class='col-md-4 mb-3'>
						<label for='Ca'>Quantas pessoas voc� carimbou?</label> <input
							type='text' class='form-control' id='Ca' name='ca'
							placeholder='Quantas?' value='' required>
					</div>
				</div>
				<br> <input type="submit" class="btn" value="Registrar"
					style="float: right; color: #fff; margin-top: -6%;" id='bt'>
				<br>
			</form>
		</div>
	</div>
	<br>
	<br>
	<div class="row">
		<c:forEach items="${pon}" var="wont">
			<div class="col-lg-4 col-md-5 col-sm-6 ordem">
				<div class="card text-center hover-shadow-lg hover-translate-y-n10">
					<div class="px-4 py-5">
						<h5>
							Nome:
							<c:out value="${user.nome}"></c:out>
							Camisa:
							<c:out value="${user.ncamisa}"></c:out>
						</h5>
					</div>
					<div class="px-4 pb-5">
						<h5>
							Time advers�rio:
							<c:out value="${wont.TAdv}"></c:out>
						</h5>
						<h5>
							Sua pontua��o:
							<c:out value="${wont.carim}"></c:out>
						</h5>
						<small>Continue assim!</small> <br> <a id="delP"
							href="${pageContext.request.contextPath}/Service?pagina=confD&id=${wont.id}&user=${user.usuario}">Deletar</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<script src='js/sweet.js'></script>
	<c:if test="${erro.equals('nope')}">
		<script>swal("Ok","Placar deletado com sucesso","success");</script>
	</c:if>
	<c:import url="includes/footer.jsp"></c:import>