package Controle;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Modelo.Usuario;

public class UsuarioControle {
	public boolean inserirUsuario(Usuario user){
		boolean retorno = false;
		try { 
			Conexao con = new Conexao();
			PreparedStatement ps = con.getCon().prepareStatement("INSERT INTO usuario (nome,usuario,senha,tipo,ncamisa,timeId) VALUES (?,?,?,?,?,?)");
			ps.setString(1, user.getNome());			
			ps.setString(2, user.getUsuario());
			ps.setString(3, user.getSenha());
			ps.setString(4, user.getTipo());
			ps.setString(5, user.getNcamisa());
			ps.setInt(6, user.time.getIdt());
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
	public Usuario selecionar(int id) {
		Usuario user=new Usuario();
		try {						
			Conexao con=new Conexao();
			PreparedStatement ps=con.getCon().prepareStatement("SELECT * FROM usuario WHERE id=?;");
			ps.setInt(1,id);
			if(ps.execute()) {
				ResultSet rs=ps.executeQuery();
				if(rs != null) {
					if(rs.next()) {
						user.setId(rs.getInt("id"));					
						user.setNome(rs.getString("nome"));
						user.setUsuario(rs.getString("usuario"));
						user.setSenha(rs.getString("senha"));
						user.setTipo(rs.getString("tipo"));
						user.setNcamisa(rs.getString("ncamisa"));
						user.time.setIdt(rs.getInt("timeId"));
					}
				}
			}
			con.fecharConexao();		
			return user;
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());
			return user;
		}
	}
	public boolean atualizarTodosTime(Usuario user) {
		try{
            Conexao con=new Conexao();
            PreparedStatement ps=con.getCon().prepareStatement("UPDATE usuario SET timeId=? WHERE timeId=?;");
            ps.setInt(1,1);            
            ps.setInt(2,user.time.getIdt());
            if(!ps.execute()) {
	            con.fecharConexao();
	            return true;
            }else {
            	con.fecharConexao();
            	return false;
            }
        }catch(Exception e){
            System.out.println("Erro no tualizar: "+e.getMessage());
            return false;
        }
	}
	
	public boolean sairT(Usuario user) {
		try{
            Conexao con=new Conexao();
            PreparedStatement ps=con.getCon().prepareStatement("UPDATE usuario SET timeId=? WHERE usuario=?;");
            ps.setInt(1,1);            
            ps.setString(2,user.getUsuario());
            if(!ps.execute()) {
	            con.fecharConexao();
	            return true;
            }else {
            	con.fecharConexao();
            	return false;
            }
        }catch(Exception e){
            System.out.println("Erro no tualizar: "+e.getMessage());
            return false;
        }
	}
	public Usuario selecionarUm(Usuario user) {
		try {
			Usuario usuario=new Usuario();
			Conexao con=new Conexao();
			PreparedStatement ps=con.getCon().prepareStatement("SELECT * FROM usuario WHERE usuario=?;");
			ps.setString(1,user.getUsuario());
			if(ps.execute()) {
				ResultSet rs=ps.executeQuery();
				if(rs != null) {
					if(rs.next()) {
						usuario.setId(rs.getInt("id"));					
						usuario.setNome(rs.getString("nome"));
						usuario.setUsuario(rs.getString("usuario"));
						usuario.setSenha(rs.getString("senha"));
						usuario.setTipo(rs.getString("tipo"));
						usuario.setNcamisa(rs.getString("ncamisa"));						
						usuario.time.setIdt(rs.getInt("timeId"));
					}
				}
			}else {
				usuario=null;
			}
			con.fecharConexao();
			return usuario;
		}catch(Exception e) {
			System.out.println("Erro geral: "+e.getMessage());
			return null;
		}
	}
	public boolean atualizar(Usuario user){
        try{
            Conexao con=new Conexao();
            PreparedStatement ps=con.getCon().prepareStatement("UPDATE usuario SET nome=?,senha=? WHERE usuario=?;");
            ps.setString(1,user.getNome());            
            ps.setString(2,user.getSenha());
            ps.setString(3,user.getUsuario());
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
	
	public boolean deletar(Usuario user){
        boolean retorno;
        try{
            Conexao con = new Conexao();
            PreparedStatement ps = con.getCon().prepareStatement("DELETE FROM usuario WHERE usuario=?");
            ps.setString(1,user.getUsuario());
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
	public boolean timear(Usuario user){
        try{
            Conexao con=new Conexao();
            PreparedStatement ps=con.getCon().prepareStatement("UPDATE usuario SET timeId=? WHERE usuario=?;");
            ps.setString(2,user.getUsuario());            
            ps.setInt(1,user.time.getIdt());
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
	public ArrayList<Usuario> selecionarPorTime(Usuario user) {
		ArrayList<Usuario> retorno=null;
		try {							
			Conexao con=new Conexao();
			PreparedStatement ps=con.getCon().prepareStatement("SELECT * FROM usuario WHERE timeId=?;");
			ps.setInt(1,user.time.getIdt());
			if(ps.execute()) {
				ResultSet rs=ps.executeQuery();
				if(rs != null) {
					retorno=new ArrayList<Usuario>();
					while(rs.next()) {						
						Usuario usera=new Usuario();
						usera.setId(rs.getInt("id"));					
						usera.setNome(rs.getString("nome"));
						usera.setUsuario(rs.getString("usuario"));						
						usera.setSenha(rs.getString("senha"));
						usera.setTipo(rs.getString("tipo"));
						usera.setNcamisa(rs.getString("ncamisa"));	
						usera.time.setIdt(rs.getInt("timeId"));
						retorno.add(usera);
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
	
	
}
