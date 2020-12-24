package Modelo;

public class Agenda{
	private int id;		
	private String timeAdv;
	public Usuario user = new Usuario();
	public DataT getData() {
		return data;
	}
	public void setData(DataT data) {
		this.data = data;
	}
	public EnderecoJogo getEnd() {
		return end;
	}
	public void setEnd(EnderecoJogo end) {
		this.end = end;
	}
	public DataT data = new DataT();
	public EnderecoJogo end = new EnderecoJogo();
	private String hora;	
	public int getId() {
		return id;
	}
	public Usuario getUser() {
		return user;
	}
	public void setUser(Usuario user) {
		this.user = user;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public String getTimeAdv() {
		return timeAdv;
	}
	public void setTimeAdv(String timeAdv) {
		this.timeAdv = timeAdv;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}	
	
	
}