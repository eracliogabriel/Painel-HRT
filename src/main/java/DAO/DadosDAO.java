package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.Conexao;
import MODEL.Dados;


public class DadosDAO {

	public void adiciona(Dados dados) {
		
		try {
			Connection cont = Conexao.conectar();
			String SQL = "insert into usuario (email, senha) values (?,?)";
			PreparedStatement ps = cont.prepareStatement(SQL);
			ps.setString(1, dados.getEmail());
			ps.setString(2, dados.getSenha());
			ps.execute();
			ps.close();
			cont.close();
			
		} catch (SQLException ex) {
			System.out.println("Erro ao gravar dados de login" +ex.getMessage());
			ex.printStackTrace();
		}
	}
	
	public boolean adiciona2(Dados dados) {
		
		try {
			Connection cont = Conexao.conectar();
			String SQL = "insert into painel (nome_paciente) values (?)"; 
			PreparedStatement ps = cont.prepareStatement(SQL);
			ps.setString(1, dados.getNomeCompleto());

			
			ps.execute();
			ps.close();
			cont.close();
			return true;
		} catch (Exception e) {
			System.out.println("Erro ao gravar paciente no painel" +e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Dados> listarDados() {
		List<Dados> ls = new ArrayList<>();
		try {
			Connection cont = Conexao.conectar();
			PreparedStatement pst = cont.prepareStatement("select * from pessoas order by id");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Dados d = new Dados();
				d.setNomeCompleto(rs.getString("nome_completo"));
				d.setStatus(rs.getString("status"));

				ls.add(d);
			}
			cont.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ls;
	}

	public Dados getPessoa(long id) {
		Dados d = new Dados();
		try {
			Connection cont = Conexao.conectar();
			PreparedStatement pst = cont.prepareStatement("select * from pessoas where id = ? ");
			pst.setLong(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				d.setNomeCompleto(rs.getString("nome_completo"));
				d.setLocal(rs.getString("local"));
				d.setStatus(rs.getString("status"));

			}
			cont.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}
	public boolean apagar(Long id) {
		// TODO Auto-generated method stub
		return false;
	}
	public boolean alterar(Dados objD) {
		// TODO Auto-generated method stub
		return false;
	}

}
	