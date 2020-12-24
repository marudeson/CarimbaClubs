 package Controle;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Modelo.Agenda;



public class AgendarControle {
	public boolean atualizar(Agenda agen) {
		try {
			Conexao con=new Conexao();
			PreparedStatement ps = con.getCon().prepareStatement("UPDATE Agendar SET timeAdv=?, hora=? WHERE id=?;");
			ps.setString(1, agen.getTimeAdv());
			ps.setString(2, agen.getHora());
			ps.setInt(3, agen.getId());
			if(!ps.execute()) {
				con.fecharConexao();
				return true;
			}else {
				con.fecharConexao();
				return false;
			}
		}catch(Exception e) {
			System.out.println("Erro no atualizar da agendinha: "+e.getMessage());
			return false;
		}
	}
	public boolean inserirA(Agenda agen){
		boolean retorno = false;
		try {
			Conexao con = new Conexao();
			PreparedStatement ps = con.getCon().prepareStatement("INSERT INTO Agendar(timeAdv,dataId,endId,hora,userId) VALUES(?,?,?,?,?);");					
			ps.setString(1, agen.getTimeAdv());
			ps.setInt(2, agen.end.getIde());
		    ps.setInt(3, agen.data.getIdd());
			ps.setString(4, agen.getHora());
			ps.setInt(5, agen.user.getId());			
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
	
	public ArrayList<Agenda> selecionarTodos(){
		ArrayList<Agenda> agend=new ArrayList<Agenda>();		
		try {
			Conexao con=new Conexao();
			PreparedStatement ps=con.getCon().prepareStatement("SELECT * FROM Agendar;");
			if(ps.execute()) {
				ResultSet rs=ps.executeQuery();
				if(rs!=null) {					
					while(rs.next()) {
						Agenda agen=new Agenda();
						agen.setId(rs.getInt("id"));						
						agen.setTimeAdv(rs.getString("timeAdv"));
						agen.end.setIde(rs.getInt("dataId"));
						agen.data.setIdd(rs.getInt("dataId"));
						agen.setHora(rs.getString("hora"));
						agen.user.setId(rs.getInt("userId"));
						agend.add(agen);
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
		return agend;
	}
	public void selecionarUm(Agenda agen) {
		try {			
			Conexao con=new Conexao();
			PreparedStatement ps=con.getCon().prepareStatement("SELECT * FROM Agendar WHERE id=?;");
			ps.setInt(1,agen.getId());
			if(ps.execute()) {
				ResultSet rs=ps.executeQuery();
				if(rs != null) {
					if(rs.next()) {
						agen.user.setId(rs.getInt("userId"));						
						agen.setTimeAdv(rs.getNString("timeAdv"));
						agen.end.setIde(rs.getInt("dataId"));
						agen.data.setIdd(rs.getInt("dataId"));
						agen.setHora(rs.getString("hora"));						 
					}
				}
			}
			con.fecharConexao();			
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());			
		}
	}
	public boolean deletarPorUserId(Agenda agen) {
		try {
			Conexao con = new Conexao();
			PreparedStatement ps = con.getCon().prepareStatement("DELETE FROM Agendar WHERE userId=?;");					
			ps.setInt(1, agen.user.getId());
			if(!ps.execute()) {
				con.fecharConexao();
				return true;
			}else {
				con.fecharConexao();
				return false;
			}
		}catch(Exception e) {
			System.out.println("Erro no deleteAgenda: "+e.getMessage());
			return false;
		}
	}
	public boolean deletar(Agenda agen){
        boolean retorno;
        try{
            Conexao con = new Conexao();
            PreparedStatement ps = con.getCon().prepareStatement("DELETE FROM Agendar WHERE id=?");
            ps.setInt(1,agen.getId());
            if(!ps.execute()){
                con.fecharConexao();
                retorno=true;
            }else{
                con.fecharConexao();
                retorno=false;
            }
        }catch(Exception e){
            System.out.println("Erro: "+ e.getMessage());
            retorno=false;
        }
        return retorno;
    }
	
}