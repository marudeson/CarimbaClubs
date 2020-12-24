<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Cadastre-se para fazer agendamento</title>
  <link rel="stylesheet" type="text/css" href="css/style-sistem.css">
  <link rel="icon" type="image/x-icon" href="imagem/logoI.png">
</head>
<style>
  @media ( max-width : 991px) {
    #cc {
	  display: none;
	}
}
*{ font-family: 'Ubuntu', sans-serif;}
 .botao{
 outline:none;
 color:#fff;
 cursor:pointer;
 background-color:#f67;

 

 }
 ::placeholder {
	color: #808080 !important;
}
</style>
<body>
  <c:set var="erro" value="${requestScope['erro']}"></c:set>
  <div class='container' >
		<!-- Hero Section -->
    <div class="gradient-overlay-half-dark-v3 bg-img-hero">
			<!-- Main Content -->
	  <div class="d-lg-flex align-items-lg-center height-85vh--lg">
	    <div class="container space-2 space-0--lg mt-lg-8">
		  <div class="row justify-content-lg-between align-items-lg-center">
		    <div class="col-lg-5 mb-7 mb-lg-0">
			  <img src='imagem/Cc.jpg' id='cc'>
			</div>
            <div class="col-lg-5"  >
							<!-- Signup Form -->
			<div class="bg-white shadow-sm rounded p-6"  >
			  <form class="form-signin" method="post" action="Service">
			    <input type="hidden" name="servico" value="cadastrar" />
                <h1 style="color: #808080; text-align: center; margin-top: 2px; margin-bottom: 5px;">Faça seu cadastro</h1>
				<label><strong>No seu time, você é:</strong></label> <br>
			    <select class="form-control" name='r' id='r' required>
				  <option>Selecionar</option>
				  <option>Jogador</option>\
				  <option>Treinador</option>
			   </select> <br> 
			   <input type="text" class="form-control"placeholder="Seu Nome" name="nome" required /><br> 
			   <input type="text" class="form-control" placeholder="Nome de Usuario"name="usuario" required><br> 
			   <input type="text" hidden="true" class="form-control" placeholder="Nome do seu time" id="trein" name="time" />
			   <br id='a' hidden="true">
			   <input type="text" hidden="true"
				class="form-control" placeholder="Número da sua camisa"
				id="joga" name="joga" /> <br id='b' hidden="true"> 
				<input type="password" class="form-control" placeholder="Senha"
				  name="senha" required> <br> <input
				  type="password" class="form-control" name="confSenha"
				  placeholder="Confirmar Senha" /> <br>
									<center>
										<input style="margin-top: 2px; margin-bottom: 5%; color:#fff;"
											class="botao" type="submit" value="Cadastrar"> <br>
							<span>Já tem cadastro?</span><a
											href="${pageContext.request.contextPath}/Service?pagina=login"
											style="color:#f67; font-size: 15px">faça seu login!</a>
									</center>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<c:import url="includes/footer.jsp"></c:import>
	<c:choose>
		<c:when test="${erro.equals('time')}">
			<script>swal("Atenção","Time já existente e cadastrado","warning");</script>
		</c:when>
		<c:when test="${erro.equals('erro')}">
			<script>swal("Ops","Desculpe, estamos com enfrentando turbulências","error");</script>
		</c:when>
		<c:when test="${erro.equals('usuario')}">
			<script>swal("Ops","Esse usuario já está cadastrado","error");</script>
		</c:when>
		<c:when test="${erro.equals('confS')}">
			<script>swal("Ops","Suas senhas devem ser idênticas.","error");</script>
		</c:when>
		<c:when test="${erro.equals('selecione')}">
			<script>swal("Atenção","Selecione o que você é no seu time.","warning");</script>
		</c:when>
	</c:choose>