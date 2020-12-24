package Controle;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    
        private Connection con;
	public Conexao() {
		Conexao();
	}
	public Connection Conexao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String banco = "carimba";
			String url = "jdbc:mysql://localhost/" + banco;
			String user = "root";
			String senha = "";
			this.setCon(DriverManager.getConnection(url,user,senha));
			if(this.getCon() != null) {
				System.out.println("Conectado com sucesso");
				return this.getCon();
			}else {
				return null;
			}
		}catch(ClassNotFoundException e){
			System.out.println("Erro na biblioteca: " + e.getMessage());
			return null;
		}catch(SQLException e){
			System.out.println("Erro no banco: " + e.getMessage());
			return null;
		}catch(Exception e){
			System.out.println("Erro geral: " + e.getMessage());
			return null;
		}
	}	
	
	public void fecharConexao() {
		try{
			this.getCon().close();
		}catch(SQLException e) {
			System.out.println("Erro no banco: " + e.getMessage());
		}
	}
	      
        public Connection getCon() {
		return con;
	}
	public void setCon(Connection con) {
		this.con = con;
	}
    
}
