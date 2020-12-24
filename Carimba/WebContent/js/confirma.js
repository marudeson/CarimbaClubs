let body = document.getElementById("body");
let id = document.getElementById("id");
body.onload = function(){	
	swal({
        title:"Atenção",
        text:"Você tem certeza que deseja apagar esse jogo? Ele não poderá ser recuperado.",
        icon:"warning",
        buttons:['Não','Sim'],
        dangerMode:true
    }).then(function(isConfirm){
        if(isConfirm){
            window.location.href="Service?pagina=agendel&id="+id.value;
        }else{            
			window.location.href="Service?pagina=jogos&user="+sessionStorage.getItem("user"); 					
        }
    });
}
