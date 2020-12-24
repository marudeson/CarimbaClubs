package Controle;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Modelo.Time;

public class TimeControle {
	public boolean deletar(Time time) {
		try {
			Conexao con=new Conexao();
			PreparedStatement pse=con.getCon().prepareStatement("DELETE FROM timee WHERE id=?;");
			pse.setInt(1, time.getIdt());
			if(!pse.execute()) {
				con.fecharConexao();
				return true;
			}else {
				con.fecharConexao();
				return false; 
			}
		}catch(Exception e) {
			System.out.println("Erro no deletar do time: "+e.getMessage());
			return false;
		}
	}
	public Time selecionarUm(Time time) {
		Time retorno=null;
		try {
			Conexao con=new Conexao();
			PreparedStatement pse=con.getCon().prepareStatement("SELECT * FROM timee WHERE nome=?;");
			pse.setString(1, time.getNome());
			if(pse.execute()) {
				ResultSet rse=pse.executeQuery();
				if(rse.next()) {
					retorno=new Time();
					retorno.setIdt(rse.getInt("id"));
					retorno.setNome(rse.getString("nome"));
				}
			}
			con.fecharConexao();
			return retorno;
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());
			return retorno;
		}
	}
	public Time selecionarId(Time time) {
		Time retorno=null;
		try {
			Conexao con=new Conexao();
			PreparedStatement pse=con.getCon().prepareStatement("SELECT * FROM timee WHERE id=?;");
			pse.setInt(1, time.getIdt());
			if(pse.execute()) {
				ResultSet rse=pse.executeQuery();
				if(rse.next()) {
					retorno=new Time();
					retorno.setIdt(rse.getInt("id"));
					retorno.setNome(rse.getString("nome"));
				}
			}
			con.fecharConexao();
			return retorno;
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());
			return retorno;
		}
	}
	
	public boolean inserir(Time time) {
		try {
			Conexao con=new Conexao();
			PreparedStatement pse=con.getCon().prepareStatement("INSERT INTO timee(nome) VALUES(?);");
			pse.setString(1, time.getNome());
			if(!pse.execute()) {
				con.fecharConexao();
				return true;
			}else {
				con.fecharConexao();
				return false;
			}
		}catch(Exception e) {
			System.out.println("Erro geral inserir: "+e.getMessage());
			return false;
		}
	}
}
