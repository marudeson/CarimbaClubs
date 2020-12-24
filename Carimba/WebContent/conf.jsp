<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Você tem certeza?</title>
</head>
<body id='h'>
	<input type="hidden" id="id" value="${requestScope['id']}" />
	<input type="hidden" id="user" value="${requestScope['user']}" />
	<script src="js/Jquery.js"></script>
	<script src="js/sweet.js"></script>
	<script>
		let user = document.getElementById("user");
		let id = document.getElementById("id");
		document.getElementById("h").onload = function(){	
			swal({
		        title:"Atenção",
		        text:"Você tem certeza que deseja apagar essa pontuação? Ela não poderá ser recuperada.",
		        icon:"warning",
		        buttons:['Não','Sim'],
		        dangerMode:true
		    }).then(function(isConfirm){
		        if(isConfirm){
		            window.location.href="Service?pagina=deletrear&id="+id.value+"&user="+user.value;
		        }else{            
					window.location.href="Service?pagina=placar&user="+user.value; 					
		        }
		    });
		}

	</script>
</body>
</html>