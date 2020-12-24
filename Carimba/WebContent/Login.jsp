<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Faça seu login</title>
<link rel="stylesheet" type="text/css" href="css/style-sistem.css">
<link rel="icon" type="image/x-icon" href="imagem/logoI.png">
<style>
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

</head>

<body id="body">
	<c:set var="erro" value="${requestScope['erro']}"></c:set>
	<form class="form-signi" method="post" action="Service"
		style="border-radius: 24px; background-color:#fff;">
		<input type="hidden" name="servico" value="logar" />
		<h1
			style="color: #808080; text-align: center; margin-top: 12%; margin-bottom: 8%;">Fazer
			Login</h1>
		<div class="imaginha">
			<img src="imagem/user.png" width="24"> <input type="text"
				class="form-controle" placeholder=" Nome de Usuário" name="usuario" />
		</div>

		<br />
		<br />
		<div class="imaginha">
			<img src="imagem/pass.png"> <input type="password"
				class="form-controle" placeholder=" Senha" name="senha" />
		</div>
		<br>
		<br>
		<center>
			<input class="botao" type="submit" value="Entrar"> <br>
			<span style="font-size: 15px;"><a
				href="${pageContext.request.contextPath}/Service?pagina=cadastro"
				style="color: #f67; font-size:14pt;"> Cadastre-se!</a></span>
	</form>
	<script src='js/sweet.js'></script>
	<c:choose>
		<c:when test="${erro.equals('senha')}">
			<script>swal("Ops","Sua senha está incorreta","error");</script>
		</c:when>
		<c:when test="${erro.equals('nCadastro')}">
			<script>swal("Atenção:","Este usuário não foi cadastrado","warning");</script>
		</c:when>
	</c:choose>
</body>
</html>