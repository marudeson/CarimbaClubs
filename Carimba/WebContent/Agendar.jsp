<%@ page import="Modelo.Usuario"%>
<%@ page import="Controle.UsuarioControle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Faça seu agendamento</title>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" type="text/css" href="css/Coisas.css">
<link rel="icon" type="image/x-icon" href="imagem/logoI.png">
</head>

<body>
	<c:set var="user" value="${requestScope['user']}"></c:set>
	<c:set var="ag" value="${requestScope['ag']}"></c:set>
	<c:if test="${ag!=null}">
		<nav class='navbar navbar-expand-lg navbar-light bg-light'
			style='margin-bottom: 2%; background-color: #ffd4e0 !important'>
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
						href="${pageContext.request.contextPath}/Service?pagina=entrada&user=${ag.user.usuario}">Home</a>
					</li>
					<li class='nav-item active'><a class='nav-link'
						href="${pageContext.request.contextPath}/Service?pagina=jogos&user=${ag.user.usuario}">Ver
							Jogos</a></li>
					<li class='nav-item dropdown'><a
						class='nav-link dropdown-toggle' href='#' id='dropdown05'
						data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>Mais</a>
						<div class='dropdown-menu' aria-labelledby='dropdown05'>
							<a class='dropdown-item'
								href="${pageContext.request.contextPath}/Service?pagina=confUser&user=${ag.user.usuario}">Configurações</a>
							<a class='dropdown-item'
								href="${pageContext.request.contextPath}/Service?pagina=ajuda&user=${ag.user.usuario}"
								target='_blank'>Tutorial</a> <a class='dropdown-item'
								href="${pageContext.request.contextPath}/Service?pagina=login">Sair</a>
						</div></li>
				</ul>
			</div>
		</nav>

		<main role='main' class='container'>
		<div
			class='d-flex align-items-center p-3 my-3 text-white-50 bg-red rounded shadow-sm'>
			<img class='mr-3' src='imagem/agenda.png' alt='' width='48'
				height='48'>
			<div class='lh-100'>
				<h4 style='color: #fff !important' class='mb-0 lh-100'>Editar
					jogo</h4>
				<small>2020</small>
			</div>
		</div>
		<div class='my-3 p-3 bg-white rounded shadow-sm'>
			<br>
			<form method='post' action='Service'>
				<input type='hidden' name='uSer' value="${ag.user.usuario}" /> <input
					type='hidden' name='tabId' value="${ag.id}" /> <input
					type='hidden' name='endId' value="${ag.end.ide}" /> <input
					type='hidden' name='dataId' value="${ag.data.idd}" /> <input
					type="hidden" name="servico" value="edit" /> <input type='hidden'
					name='userId' value="${ag.user.id}" />
				<div class='row'>
					<div class='col-md-3 mb-3'>
						<label for='ATime'>Time adversário</label> <input type='text'
							class='form-control' id='ATime' maxlength="100" name='timeA'
							placeholder='Time adversário' value='${ag.timeAdv}' required>
					</div>
				</div>
				<br>
				<h6>Endereço do Jogo:</h6>
				<div class='row'>
					<div class='col-md-4 mb-3'>
						<label for='rua'>Rua</label> <input type='text'
							class='form-control' id='rua' name='rua' maxlength="100"
							placeholder='Rua' value='${ag.end.rua}' required>
					</div>
					<div class='col-md-2 mb-3'>
						<label for='numero'>Número</label> <input type='text'
							class='form-control' value="${ag.end.numero}" name='numero'
							id='numero' maxlength="5" onkeypress="return onlynumber()"
							placeholder='Nº' required>
					</div>
					<div class='col-md-4 mb-3'>
						<label for='pReference'>Ponto de referência</label> <input
							type='text' class='form-control' value="${ag.end.PReferencia}"
							name='pReferencia' id='pReference' maxlength="100"
							placeholder='Um lugar próximo ao ponto' required>
					</div>
				</div>
				<br>
				<h6>Data e Horário:</h6>
				<div class='row'>
					<div class='col-md-2 mb-2'>
						<div class='form-group'>
							<label for='dia'>Dia</label> <select class="form-control"
								id='dia' name='dia' required>
								<option><c:out value="${ag.data.dia}"></c:out></option>
								<option>1</option>
								<c:forEach var="i" begin="2" end="31">
									<option><c:out value="${i}"></c:out></option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class='col-md-2 mb-2'>
						<div class='form-group'>
							<label for='mes'>Mês</label> <select class="form-control"
								id='mes' name='mes' required>
								<option><c:out value="${ag.data.mes}"></c:out></option>
								<option>1</option>
								<c:forEach var="i" begin="2" end="12">
									<option><c:out value="${i}"></c:out></option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class='col-md-2 mb-2'>
						<label for='ano'>Ano</label> <input type='text'
							class='form-control' id='ano' data-ls-module="charCounter"
							maxlength="4" onkeypress="return onlynumber()"
							placeholder='Ano do jogo' value="${ag.data.ano}" name='ano'
							required>
					</div>

					<div class='col-md-2 mb-3'>
						<label for='hora'>Em que horário?</label> <input type='time'
							value="${ag.hora}" class='form-control' id='hora' name='hora'
							required>
					</div>
				</div>
				<br>
				<div class='col-md-2 mb-6'>
					<input type='submit' class='btn-in btn-block' value='Editar'>
				</div>
			</form>
			<br>
		</div>
		</main>
	</c:if>

	<c:if test="${ag==nul}">
		<nav class='navbar navbar-expand-lg navbar-light bg-light'
			style='margin-bottom: 2%; background-color: #ffd4e0 !important'>
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
					<li class='nav-item dropdown'><a
						class='nav-link dropdown-toggle' href='#' id='dropdown05'
						data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>Mais</a>
						<div class='dropdown-menu' aria-labelledby='dropdown05'>
							<a class='dropdown-item'
								href="${pageContext.request.contextPath}/Service?pagina=confUser&user=${user.usuario}">Configurações</a>
							<a class='dropdown-item'
								href="${pageContext.request.contextPath}/Service?pagina=ajuda&user=${user.usuario}"
								target='_blank'>Ajuda</a> <a class='dropdown-item'
								href="${pageContext.request.contextPath}/Service?pagina=login">Sair</a>
						</div></li>
				</ul>
			</div>
		</nav>

		<main role='main' class='container'>
		<div
			class='d-flex align-items-center p-3 my-3 text-white-50 bg-red rounded shadow-sm'>
			<img class='mr-3' src='imagem/agenda.png' alt='' width='48'
				height='48'>
			<div class='lh-100'>
				<h4 style='color: #fff !important' class='mb-0 lh-100'>Agendar
					jogo</h4>
				<small>2020</small>
			</div>
		</div>
		<div class='my-3 p-3 bg-white rounded shadow-sm'>
			<br>
			<form method='post' action='Service'>
				<input type='hidden' name='uSer' value="${user.usuario}" /> <input
					type="hidden" name="servico" value="agendar" /> <input
					type='hidden' name='userId' value="${user.id}" />
				<h6>Atenção: Seu time será preenchindo automaticamente.</h6>
				<div class='row'>
					<div class='col-md-3 mb-3'>
						<label for='ATime'>Time adversário</label> <input type='text'
							class='form-control' id='ATime' maxlength="100" name='timeA'
							placeholder='Time adversário' value='' required>
					</div>
				</div>
				<br>
				<h6>Endereço do Jogo:</h6>
				<div class='row'>
					<div class='col-md-4 mb-3'>
						<label for='rua'>Rua</label> <input type='text'
							class='form-control' id='rua' name='rua' maxlength="100"
							placeholder='Rua' value='' required>
					</div>
					<div class='col-md-2 mb-3'>
						<label for='numero'>Número</label> <input type='text'
							class='form-control' name='numero' id='numero' maxlength="5"
							onkeypress="return onlynumber()" placeholder='Nº' required>
					</div>
					<div class='col-md-4 mb-3'>
						<label for='pReference'>Ponto de referência</label> <input
							type='text' class='form-control' name='pReferencia'
							id='pReference' maxlength="100"
							placeholder='Um lugar próximo ao ponto' required>
					</div>
				</div>
				<br>
				<h6>Data e Horário:</h6>
				<div class='row'>
					<div class='col-md-2 mb-2'>
						<div class='form-group'>
							<label for='dia'>Dia</label> <select class="form-control"
								id='dia' name='dia' required>
								<option>1</option>
								<c:forEach var="i" begin="2" end="31">
									<option><c:out value="${i}"></c:out></option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class='col-md-2 mb-2'>
						<div class='form-group'>
							<label for='mes'>Mês</label> <select class="form-control"
								id='mes' name='mes' required>
								<option>1</option>
								<c:forEach var="i" begin="2" end="12">
									<option><c:out value="${i}"></c:out></option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class='col-md-2 mb-2'>
						<label for='ano'>Ano</label> <input type='text'
							class='form-control' id='ano' data-ls-module="charCounter"
							maxlength="4" onkeypress="return onlynumber()"
							placeholder='Ano do jogo' name='ano' required>
					</div>

					<div class='col-md-2 mb-3'>
						<label for='hora'>Em que horário?</label> <input type='time'
							class='form-control' id='hora' name='hora' required>
					</div>
				</div>
				<br>
				<div class='col-md-2 mb-6'>
					<input type='submit' class='btn-in btn-block' value='Agendar'>
				</div>
			</form>
			<br>
		</div>
		</main>
	</c:if>
	<script src="js/soNume.js"></script>
	<c:import url="includes/footer.jsp"></c:import>