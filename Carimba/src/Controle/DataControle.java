package Controle;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Modelo.DataT;

public class DataControle{
	public boolean atualizar(DataT data){
        try{
            Conexao con=new Conexao();
            PreparedStatement ps=con.getCon().prepareStatement("UPDATE DataT SET dia=?,mes=?,ano=? WHERE id=?;");
            ps.setInt(1,data.getDia());            
            ps.setInt(2,data.getMes());           
            ps.setInt(3,data.getAno());
            ps.setInt(4, data.getIdd());
            
            if(!ps.execute()) {
	            con.fecharConexao();
	            return true;
            }else {
            	con.fecharConexao();
            	return false;
            }
        }catch(Exception e){
            System.out.println("Erro bonitinho: "+e.getMessage());
            return false;
        }
    }
	public boolean inserirD(DataT data){
		boolean retorno = false;
		try {
			Conexao con = new Conexao();
			PreparedStatement ps = con.getCon().prepareStatement("INSERT INTO DataT (dia,mes,ano) VALUES (?,?,?)");
			ps.setInt(1, data.getDia());
			ps.setInt(2, data.getMes());
			ps.setInt(3, data.getAno());			
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
	public DataT selecionarUm(DataT data) {
		try {			
			Conexao con=new Conexao();
			PreparedStatement ps=con.getCon().prepareStatement("SELECT * FROM DataT WHERE id=?;");
			ps.setInt(1,data.getIdd());
			if(ps.execute()) {
				ResultSet rs=ps.executeQuery();
				if(rs != null) {
					if(rs.next()) {										
						data.setDia(rs.getInt("dia"));
						data.setMes(rs.getInt("mes"));
						data.setAno(rs.getInt("ano"));						
					}
				}
			}
			con.fecharConexao();
			return data;
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());
			return data;
		}
	}
	public boolean deletar(DataT data){
        boolean retorno;
        try{
            Conexao con = new Conexao();
            PreparedStatement ps = con.getCon().prepareStatement("DELETE FROM DataT WHERE id=?");
            ps.setInt(1,data.getIdd());
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
	public DataT selecionarUltimoD(){
		DataT data = null;
		try {
			Conexao con=new Conexao();
			PreparedStatement ps=con.getCon().prepareStatement("SELECT * FROM DataT;");
			if(ps.execute()) {
				ResultSet rs=ps.executeQuery();
				if(rs!=null) {
					data=new DataT();
					while(rs.next()) {
						data.setIdd(rs.getInt("id"));
						data.setDia(rs.getInt("dia"));
						data.setMes(rs.getInt("mes"));
						data.setAno(rs.getInt("ano"));
					}
					con.fecharConexao();
					return data;
				}else {
					con.fecharConexao();
					return data;
				}
			}else {
				con.fecharConexao();
				return data;
			}
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());
		}
		return data;
	}
}