package Modelo;

public class Usuario {
	private int id;
	private String nome;
	private String usuario;
	private String senha;
	private String confirSenha;
	private String ncamisa;
	
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	private String tipo;	
	public Time time = new Time();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getConfirSenha() {
		return confirSenha;
	}
	public void setConfirSenha(String confirSenha) {
		this.confirSenha = confirSenha;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getNcamisa() {
		return ncamisa;
	}
	public void setNcamisa(String ncamisa) {
		this.ncamisa = ncamisa;
	}
	
}
