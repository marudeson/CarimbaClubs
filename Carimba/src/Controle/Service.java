package Controle;
import java.util.ArrayList;
import Modelo.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Service
 */
@WebServlet("/Service")
public class Service extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pagina=request.getParameter("pagina").toString();
		Usuario user = new Usuario();
		UsuarioControle controle = new UsuarioControle();
		switch(pagina) {
			case "confD":
				request.setAttribute("id", request.getParameter("id"));
				request.setAttribute("user", request.getParameter("user"));
				request.getRequestDispatcher("conf.jsp").forward(request, response);
				break;
			case "edit":
				Agenda ag=new Agenda();
				AgendarControle aca=new AgendarControle();
				EnderecoControle ec=new EnderecoControle();
				DataControle dc=new DataControle();
				ag.setId(Integer.parseInt(request.getParameter("id")));
				aca.selecionarUm(ag);
				ag.user=controle.selecionar(ag.user.getId());
				ag.end=ec.selecionarUm(ag.end);
				ag.data=dc.selecionarUm(ag.data);
				request.setAttribute("ag", ag);
				request.getRequestDispatcher("Agendar.jsp").forward(request, response);
				break;			
			case "home":
				request.getRequestDispatcher("index.jsp").forward(request, response);
				break;
			case "cadastro":
				request.getRequestDispatcher("Cadastro.jsp").forward(request, response);
				break;
			case "login":
				request.getRequestDispatcher("Login.jsp").forward(request, response);
				break;
			case "ajuda":
				user.setUsuario(request.getParameter("user"));
				user=controle.selecionarUm(user);
				request.setAttribute("user",user);
				request.getRequestDispatcher("Ajuda.jsp").forward(request, response);
				break;
			case "agendar":
				if(request.getParameter("user")!=null) {
					user.setUsuario(request.getParameter("user"));
					user=controle.selecionarUm(user);
					if(user!=null) {
						request.setAttribute("user", user);
						request.getRequestDispatcher("Agendar.jsp").forward(request, response);
					}
				}
				break;
			case "entrada":
				user.setUsuario(request.getParameter("user"));
				Usuario log=controle.selecionarUm(user);
				if(log.getUsuario()!=null) {
					TimeControle cT=new TimeControle();
					request.setAttribute("cT", cT);
					request.setAttribute("user",log);
					if(log.getTipo().equals("Treinador")) {
						ArrayList<Usuario> resul = controle.selecionarPorTime(log);
						request.setAttribute("resul",resul);
						request.getRequestDispatcher("Entrada.jsp").forward(request, response);
					}else {
						request.getRequestDispatcher("EntradaJ.jsp").forward(request, response);
					}
				}
				break;				
			case "jogos":
				user.setUsuario(request.getParameter("user"));
				request.setAttribute("user", controle.selecionarUm(user));
				AgendarControle agenda = new AgendarControle();
				EnderecoControle endC = new EnderecoControle();
				DataControle dataC = new DataControle();
				ArrayList<Agenda> agenmo=agenda.selecionarTodos();
				request.setAttribute("lista",agenmo);
				request.setAttribute("endC",endC);
				request.setAttribute("dataC",dataC);
				request.setAttribute("userC",controle);
				request.setAttribute("size", agenmo.size());
				TimeControle cT = new TimeControle();
				request.setAttribute("cT", cT);
				request.getRequestDispatcher("Jogos.jsp").forward(request, response);
				break;
			case "placar":
				user.setUsuario(request.getParameter("user"));
				request.setAttribute("user", controle.selecionarUm(user));
				PontControle pct = new PontControle(); 
				ArrayList<Pont> pontua=pct.selecionarTodos();
				request.setAttribute("pon", pontua);
				request.getRequestDispatcher("Placar.jsp").forward(request, response);
				break;
			case "confirma":
				request.setAttribute("id", request.getParameter("id"));
				request.getRequestDispatcher("Confirma.jsp").forward(request, response);
				break;
			case "agendel":
				Agenda agen = new Agenda();
				UsuarioControle userC = new UsuarioControle();
				AgendarControle agenc = new AgendarControle();  
				EnderecoControle end = new EnderecoControle();
				DataControle data = new DataControle();		
				agen.setId(Integer.parseInt(request.getParameter("id")));
				agenc.selecionarUm(agen);
				agen.user=userC.selecionar(agen.user.getId());					
				agenc.deletar(agen);	
				end.deletar(agen.end);
				data.deletar(agen.data);
				ArrayList<Agenda> agenm=agenc.selecionarTodos();
				request.setAttribute("user", controle.selecionarUm(agen.user));
				request.setAttribute("lista",agenm);
				request.setAttribute("endC",end);
				request.setAttribute("dataC",data);
				request.setAttribute("userC",controle);
				request.setAttribute("size", agenm.size());
				TimeControle c = new TimeControle();
				request.setAttribute("cT", c);
				request.getRequestDispatcher("Jogos.jsp").forward(request, response);	
				break;
			case "delete":
				user.setUsuario(request.getParameter("user"));
				user=controle.selecionarUm(user);
				if(user.getTipo().equals("Jogador")) {	
					if(controle.deletar(user)) {
						request.getRequestDispatcher("Login.jsp").forward(request, response);
					}else {
						response.getWriter().print("n�oo deletou");
					}
				}else {
					TimeControle tc=new TimeControle();
					AgendarControle ac=new AgendarControle();
					Agenda a=new Agenda();
					a.user.setId(user.getId());
					user.time=tc.selecionarId(user.time);
					if(ac.deletarPorUserId(a)) {
						if(controle.deletar(user)) {
							if(controle.atualizarTodosTime(user)) {
								if(tc.deletar(user.time)) {
									request.getRequestDispatcher("Login.jsp").forward(request, response);
								}
							}
						}
					}
				}
				break;
			case "sairT":
				user.setUsuario(request.getParameter("user"));				
				user = controle.selecionarUm(user);
				if(controle.sairT(user)) {
					request.setAttribute("erro", "ok");
					request.setAttribute("user", user);
					request.getRequestDispatcher("ConfUser.jsp").forward(request, response);
				}else {
					request.setAttribute("user", user);
					request.getRequestDispatcher("ConfUser.jsp").forward(request, response);
				}
				break;
			case "confUser":
				user.setUsuario(request.getParameter("user"));
				request.setAttribute("user", controle.selecionarUm(user));
				request.getRequestDispatcher("ConfUser.jsp").forward(request, response);
				break;
			case "deletrear":
				PontControle pc=new PontControle();
				Pont pon=new Pont();
				pon.setId(Integer.parseInt(request.getParameter("id")));
				if(pc.deletar(pon)) {
					user.setUsuario(request.getParameter("user"));
					request.setAttribute("user", controle.selecionarUm(user));					
					ArrayList<Pont> po=pc.selecionarTodos();
					request.setAttribute("pon", po);
					request.setAttribute("erro", "nope");
					request.getRequestDispatcher("Placar.jsp").forward(request, response);
				}else {
					response.getWriter().print("Seu time n�o foi deletado.");
				}
				break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String servico=request.getParameter("servico").toString();
		Usuario user = new Usuario();
		UsuarioControle controle = new UsuarioControle();
		switch(servico) {
			case "edit":
				Agenda agendinha=new Agenda();
				AgendarControle agendinhaC=new AgendarControle();
				EnderecoControle enderecoC=new EnderecoControle();
				DataControle datinhaC=new DataControle();
				agendinha.setId(Integer.parseInt(request.getParameter("tabId")));
				agendinha.setTimeAdv(request.getParameter("timeA")); 
				agendinha.setHora(request.getParameter("hora"));
				agendinha.data.setDia(Integer.parseInt(request.getParameter("dia")));
				agendinha.data.setMes(Integer.parseInt(request.getParameter("mes")));
				agendinha.data.setAno(Integer.parseInt(request.getParameter("ano")));
				agendinha.end.setNumero(Integer.parseInt(request.getParameter("numero")));
				agendinha.end.setPReferencia(request.getParameter("pReferencia"));
				agendinha.end.setRua(request.getParameter("rua"));
				agendinha.end.setIde(Integer.parseInt(request.getParameter("endId")));
				agendinha.data.setIdd(Integer.parseInt(request.getParameter("dataId")));
				agendinha.user.setUsuario(request.getParameter("uSer"));
				if(agendinhaC.atualizar(agendinha)) {
					if(enderecoC.atualizar(agendinha.end)) {
						if(datinhaC.atualizar(agendinha.data)) {
							agendinha.user=controle.selecionarUm(agendinha.user);
							ArrayList<Agenda> agenmodel=agendinhaC.selecionarTodos();
							request.setAttribute("lista",agenmodel);
							request.setAttribute("endC",enderecoC);
							request.setAttribute("dataC",datinhaC);
							request.setAttribute("userC",controle);
							request.setAttribute("size", agenmodel.size());
							TimeControle blob = new TimeControle();
							request.setAttribute("cT", blob);
							request.setAttribute("user", agendinha.user);
							request.getRequestDispatcher("Jogos.jsp").forward(request, response);
						}
					}
				}
				break;
			case "cadastrar":				
					user.setNome(request.getParameter("nome"));
					user.setUsuario(request.getParameter("usuario"));
					user.setSenha(request.getParameter("senha"));
					user.setTipo(request.getParameter("r"));
					user.setNcamisa(request.getParameter("joga"));					
					if(!user.getTipo().equals("Selecionar")) {
						if(request.getParameter("senha").equals(request.getParameter("confSenha"))) {
							if(user.getTipo().equals("Jogador")) {
								user.time.setIdt(1);
								if(controle.inserirUsuario(user)){			
									Usuario log=controle.selecionarUm(user);
									if(log.getUsuario()!=null){
										TimeControle cT=new TimeControle();
										request.setAttribute("cT", cT);
										request.setAttribute("user",log);
										request.getRequestDispatcher("EntradaJ.jsp").forward(request, response);
									}else {
										request.setAttribute("erro","erro");
										request.getRequestDispatcher("Cadastro.jsp").forward(request, response);
									}
								}else{
									request.setAttribute("erro", "usuario");
									request.getRequestDispatcher("Cadastro.jsp").forward(request, response);
								}
							}else {
								user.time.setNome(request.getParameter("time"));
								TimeControle cT=new TimeControle();
								if(cT.inserir(user.time)) {
									user.time=cT.selecionarUm(user.time);
									if(controle.inserirUsuario(user)) {
										Usuario log=controle.selecionarUm(user);
										request.setAttribute("user",log);
										request.setAttribute("cT", cT);
										ArrayList<Usuario> resul = controle.selecionarPorTime(log);
										request.setAttribute("resul",resul);
										request.getRequestDispatcher("Entrada.jsp").forward(request, response);
									}else {
										request.setAttribute("erro", "usuario");
										request.getRequestDispatcher("Cadastro.jsp").forward(request, response);
									}
								}else {
									request.setAttribute("erro", "time");
									request.getRequestDispatcher("Cadastro.jsp").forward(request, response);
								}
							}									
						}else {
							request.setAttribute("erro", "confS");
							request.getRequestDispatcher("Cadastro.jsp").forward(request, response);
					}									
				}else{
					request.setAttribute("erro", "selecione");
					request.getRequestDispatcher("Cadastro.jsp").forward(request, response);
				}
				break;
			case "logar":
				user.setUsuario(request.getParameter("usuario"));
				user.setSenha(request.getParameter("senha"));
				Usuario log=controle.selecionarUm(user);
				if(log.getUsuario()!=null) {			
					if(user.getSenha().equals(log.getSenha())) {
						TimeControle cT=new TimeControle();
						request.setAttribute("cT", cT);
						request.setAttribute("user", log);						
						if(log.getTipo().equals("Treinador")) {
							ArrayList<Usuario> resul = controle.selecionarPorTime(log);
							request.setAttribute("resul",resul);														
							request.getRequestDispatcher("Entrada.jsp").forward(request, response);
						}else {
							request.getRequestDispatcher("EntradaJ.jsp").forward(request, response);
						}
					}else {		
						request.setAttribute("erro", "senha");
						request.getRequestDispatcher("Login.jsp").forward(request, response);
					}
				}else {
					request.setAttribute("erro", "nCadastro");
					request.getRequestDispatcher("Login.jsp").forward(request, response);
				}
				break;
			case "agendar":
				Agenda magenda = new Agenda();
				EnderecoJogo mend = new EnderecoJogo();
				DataT mdata = new DataT();
				AgendarControle controleA = new AgendarControle();
				EnderecoControle controleE = new EnderecoControle();
				DataControle controleD = new DataControle();				
				magenda.setTimeAdv(request.getParameter("timeA"));
				mend.setRua(request.getParameter("rua"));
				mend.setNumero(Integer.parseInt(request.getParameter("numero")));
				mend.setPReferencia(request.getParameter("pReferencia"));
				mdata.setDia(Integer.parseInt(request.getParameter("dia")));
				mdata.setMes(Integer.parseInt(request.getParameter("mes")));
				mdata.setAno(Integer.parseInt(request.getParameter("ano")));
				magenda.setHora(request.getParameter("hora"));
				magenda.user.setId(Integer.parseInt(request.getParameter("userId")));			
				if(controleE.inserirE(mend)) {
					if(controleD.inserirD(mdata)) {
						EnderecoJogo end=controleE.selecionarUltimoE();
						DataT data = controleD.selecionarUltimoD();
						magenda.data.setIdd(data.getIdd());
						magenda.end.setIde(end.getIde());
						if(controleA.inserirA(magenda)) {																								
							user.setUsuario(request.getParameter("uSer"));	
							request.setAttribute("user", controle.selecionarUm(user));
							AgendarControle agenda = new AgendarControle();
							EnderecoControle endC = new EnderecoControle();
							DataControle dataC = new DataControle();
							UsuarioControle userC=new UsuarioControle();
							ArrayList<Agenda> agenmo=agenda.selecionarTodos();
							request.setAttribute("lista",agenmo);
							request.setAttribute("endC",endC);
							request.setAttribute("dataC",dataC);
							request.setAttribute("userC",userC);
							request.setAttribute("size", agenmo.size());
							TimeControle cT = new TimeControle();
							request.setAttribute("cT", cT);
							request.getRequestDispatcher("Jogos.jsp").forward(request, response);
						}else {
							response.getWriter().print("Algo deu errado");
						}
					}else {
						response.getWriter().print("Algo deu errado na data");
					}
				}else {				
					response.getWriter().print("Algo deu errado no endereço");
				}
				break;
			case "atualizar":
				user.setNome(request.getParameter("nome"));
				user.setSenha(request.getParameter("senha"));
				user.setUsuario(request.getParameter("usuario"));
				if(controle.atualizar(user)) {
					Usuario logB=controle.selecionarUm(user);
					if(logB.getUsuario()!=null) {
						request.setAttribute("user", logB);
						request.getRequestDispatcher("ConfUser.jsp").forward(request, response);
					}else {
						response.getWriter().print("Usu�rio inexistente");
					}
				}else {
					response.getWriter().print("N�o foi possível atualizar os dados");
				}
				break;
			case "timear":
				user.setUsuario(request.getParameter("user"));
				user.time.setIdt(Integer.parseInt(request.getParameter("senha")));
				if(controle.timear(user)) {
					user=controle.selecionarUm(user);
					request.setAttribute("user", user);
					TimeControle cT=new TimeControle();
					request.setAttribute("cT", cT);
					request.getRequestDispatcher("EntradaJ.jsp").forward(request, response);
				}else {
					response.getWriter().print("N�o deu pra entrar no time");
				}
				break;
			case "pon":
				Pont pon = new Pont();
				PontControle pc = new PontControle();
				pon.setTAdv(request.getParameter("ta"));
				pon.setCarim(request.getParameter("ca"));
				if(pc.inserirPont(pon)) {	
					user.setUsuario(request.getParameter("user"));
					request.setAttribute("user", controle.selecionarUm(user));
					ArrayList<Pont> po=pc.selecionarTodos();
					request.setAttribute("pon", po);
					request.getRequestDispatcher("Placar.jsp").forward(request, response);
				}else {
					response.getWriter().print("n deu");
				}
				
				break;
		}
	}

}
