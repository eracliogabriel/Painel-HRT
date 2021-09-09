package TESTE;

import java.sql.Connection;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import DB.Conexao;


public class est {
	public static void main(String[] args) throws SQLException {
		Connection connection = new Conexao().getConnection();
		JOptionPane.showMessageDialog(null, "***CONECTADO AO BANCO DE DADOS***");	
	}
}
