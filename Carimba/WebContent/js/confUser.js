let sairT = document.getElementById("sairT");
let deleta = document.getElementById("del");
let user = document.getElementById("user");
  	deleta.onclick = function(){
  		swal({
  	        title:"Atenção",
  	        text:"Você tem certeza que deseja deletar sua conta? Ela não poderá ser recuperada!",
  	        icon:"warning",
  	        buttons:['Não','Sim'],
  	        dangerMode:true
  	    }).then(function(isConfirm){
  	        if(isConfirm){  	        	
  	        	window.location.href="Service?pagina=delete&user="+user.value;
  	        }else{  	        	
  	        	window.location.href="Service?pagina=confUser&user="+user.getUsuario();			
  	        	
  	        }
  	    });
  	}
  	sairT.onclick = function(){
  		swal({
  	        title:"Atenção",
  	        text:"Você tem certeza que deseja sair do seu time?",
  	        icon:"warning",
  	        buttons:['Não','Sim'],
  	        dangerMode:true
  	    }).then(function(isConfirm){
  	        if(isConfirm){  	        	
  	        	window.location.href="Service?pagina=sairT&user="+user.value;
  	        }else{  	        	
  	        	window.location.href="Service?pagina=confUser&user="+user.getUsuario();			
  	        	
  	        }
  	    });
  	}