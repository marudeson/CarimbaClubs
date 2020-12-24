let bodyJ = document.getElementById("bodyJ"); 
bodyJ.onload=function(){
	let user = document.getElementById("user");
	sessionStorage.setItem("user",user.value);
}; 
