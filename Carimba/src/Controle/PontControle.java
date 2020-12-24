package Controle;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.Pont;

public class PontControle {	
	public boolean inserirPont(Pont pon){
		boolean retorno = false;
		try { 
			Conexao con = new Conexao();
			PreparedStatement ps = con.getCon().prepareStatement("INSERT INTO pont (tAdv,carim) VALUES (?,?)");
			ps.setString(1, pon.getTAdv());
			ps.setString(2, pon.getCarim());						
			if(!ps.execute()) {
				retorno = true;
			}
			con.fecharConexao();
		}catch(SQLException e){
			System.out.println("Erro de SQL: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("Erro geral: " + e.getMessage());
		}
		return retorno;
	}
	public ArrayList<Pont> selecionarTodos(){
		ArrayList<Pont> pontu=new ArrayList<Pont>();		
		try {
			Conexao con=new Conexao();
			PreparedStatement ps=con.getCon().prepareStatement("SELECT * FROM pont;");
			if(ps.execute()) {
				ResultSet rs=ps.executeQuery();
				if(rs!=null) {					
					while(rs.next()) {
						Pont po=new Pont();
						po.setId(rs.getInt("id"));
						po.setTAdv(rs.getString("tAdv"));
						po.setCarim(rs.getString("carim"));
						pontu.add(po);
					}
					con.fecharConexao();					
				}else {
					con.fecharConexao();					
				}
			}else {
				con.fecharConexao();				
			}
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());
		}
		return pontu;
	}
	public Pont selecionarUm(Pont pom){
		Pont retorno=null;		
		try {
			Conexao con=new Conexao();
			PreparedStatement pse=con.getCon().prepareStatement("SELECT * FROM pont WHERE id=?;");
			pse.setInt(1,pom.getId());
			if(pse.execute()) {
				ResultSet rs=pse.executeQuery();
				if(rs!=null) {					
					if(rs.next()) {
						retorno=new Pont();
						retorno.setId(rs.getInt("id"));
						retorno.setTAdv(rs.getString("tAdv"));
						retorno.setCarim(rs.getString("carim"));
					}
				}
			}
			con.fecharConexao();
			return retorno;
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());
			return retorno;
		}
	}
		
	public boolean deletar(Pont pon) {
		boolean naeloob=false;
		try {
			Conexao con = new Conexao();
			PreparedStatement pse = con.getCon().prepareStatement("DELETE FROM pont WHERE id=?;");
			pse.setInt(1, pon.getId()); 
			if(!pse.execute()) {
				naeloob = true;
			}
		}catch(Exception e) {
			System.out.println("Erro no deletrear: "+e.getMessage());
		}
		return naeloob;
	}
}
