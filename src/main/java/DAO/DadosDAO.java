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
			String SQL = "insert into painel (nome_paciente, status, local, inicio_previsto, inicio_cirurgia, fim_cirurgia, saida_prevista) values (?,?,?,?,?,?,?)"; 
			PreparedStatement ps = cont.prepareStatement(SQL);
			ps.setString(1, dados.getNomeCompleto());
			ps.setString(2, dados.getStatus());
			ps.setString(3, dados.getLocal());
			ps.setString(4, dados.getInicioPrev());
			ps.setString(5, dados.getInicioCir());
			ps.setString(6, dados.getFimCir());
			ps.setString(7, dados.getSaidaPrev());
			
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
			PreparedStatement pst = cont.prepareStatement("select * from painel order by id");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Dados d = new Dados();
				d.setId(rs.getLong("id"));
				d.setNomeCompleto(rs.getString("nome_paciente"));
				d.setStatus(rs.getString("status"));
				d.setLocal(rs.getString("local"));
				d.setInicioPrev(rs.getString("inicio_previsto"));
				d.setInicioCir(rs.getString("inicio_cirurgia"));
				d.setFimCir(rs.getString("fim_cirurgia"));
				d.setSaidaPrev(rs.getString("saida_prevista"));

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
			PreparedStatement pst = cont.prepareStatement("select * from painel where id = ?");
			pst.setLong(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				d.setNomeCompleto(rs.getString("nome_paciente"));
				d.setStatus(rs.getString("status"));
				d.setLocal(rs.getString("local"));
				d.setInicioPrev(rs.getString("inicio_previsto"));
				d.setInicioCir(rs.getString("inicio_cirurgia"));
				d.setFimCir(rs.getString("fim_cirurgia"));
				d.setSaidaPrev(rs.getString("saida_prevista"));


			}
			cont.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}
	
	public boolean apagar(long id) {
		try {
			Connection cont = Conexao.conectar();
			String SQL = "delete from painel where id = ?";
			PreparedStatement pst = cont.prepareStatement(SQL);
			pst.setLong(1, id);

			pst.execute();
			pst.close();
			cont.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean alterar(Dados dados) {
		try {
			Connection cont = Conexao.conectar();

			String sql = "update painel  set nome_paciente = ?, status = ?, local = ?, inicio_previsto = ?,"
					+ "inicio_cirurgia = ?, fim_cirurgia = ?, saida_prevista = ? where id = ?";

			PreparedStatement pst = cont.prepareStatement(sql);
			pst.setString(1, dados.getNomeCompleto());
			pst.setString(2, dados.getStatus());
			pst.setString(3, dados.getLocal());
			pst.setString(4, dados.getInicioPrev());
			pst.setString(5, dados.getInicioCir());
			pst.setString(7, dados.getFimCir());
			pst.setString(8, dados.getSaidaPrev());
			pst.setLong(9, dados.getId());

			pst.execute();
			pst.close();
			cont.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
	