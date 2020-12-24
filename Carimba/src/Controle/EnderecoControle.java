package Controle;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Modelo.EnderecoJogo;

public class EnderecoControle{
	public boolean inserirE(EnderecoJogo end){
		boolean retorno = false;
		try {
			Conexao con = new Conexao();
			PreparedStatement ps = con.getCon().prepareStatement("INSERT INTO EnderecoJogo (rua,numero,pReferencia) VALUES (?,?,?)");
			ps.setString(1, end.getRua());
			ps.setInt(2, end.getNumero());
			ps.setString(3, end.getPReferencia());			
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
	public EnderecoJogo selecionarUm(EnderecoJogo end) {
		try {			
			Conexao con=new Conexao();
			PreparedStatement ps=con.getCon().prepareStatement("SELECT * FROM EnderecoJogo WHERE id=?;");
			ps.setInt(1,end.getIde());
			if(ps.execute()) {
				ResultSet rs=ps.executeQuery();
				if(rs != null) {
					if(rs.next()) {
						end.setRua(rs.getString("rua"));
						end.setNumero(rs.getInt("numero"));
						end.setPReferencia(rs.getString("pReferencia"));												
					}
				}
			}
			con.fecharConexao();
			return end;
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());
			return end;
		}
	}
	
	public EnderecoJogo selecionarUltimoE(){
		EnderecoJogo end = null;
		try {
			Conexao con=new Conexao();
			PreparedStatement ps=con.getCon().prepareStatement("SELECT * FROM EnderecoJogo;");
			if(ps.execute()) {
				ResultSet rs=ps.executeQuery();
				if(rs!=null) {
					end=new EnderecoJogo();
					while(rs.next()) {
						end.setIde(rs.getInt("id"));
						end.setRua(rs.getString("rua"));
						end.setNumero(rs.getInt("numero"));
						end.setPReferencia(rs.getString("pReferencia"));
					}
					con.fecharConexao();
					return end;
				}else {
					con.fecharConexao();
					return end;
				}
			}else {
				con.fecharConexao();
				return end;
			}
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());
		}
		return end;
	}
	public boolean atualizar(EnderecoJogo end){
        try{
            Conexao con=new Conexao();
            PreparedStatement ps=con.getCon().prepareStatement("UPDATE EnderecoJogo SET rua=?,numero=?,pReferencia=? WHERE id=?;");
            ps.setString(1,end.getRua());            
            ps.setInt(2,end.getNumero());           
            ps.setString(3,end.getPReferencia());
            ps.setInt(4, end.getIde());
            
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
	
	public boolean deletar(EnderecoJogo end){
        boolean retorno;
        try{
            Conexao con = new Conexao();
            PreparedStatement ps = con.getCon().prepareStatement("DELETE FROM EnderecoJogo WHERE id=?");
            ps.setInt(1,end.getIde());
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