package DB;
import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	
	public static Connection conectar() /*throws SQLException /* throws Exception */ {
		try {
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://chunee.db.elephantsql.com:5432/wvdyubwf";
			String usuarioDb = "wvdyubwf";
			String senhaDb = "DgoBFGcptTnWt1hOtiGoxt4yZ9lm5eqD";
			return DriverManager.getConnection(url, usuarioDb, senhaDb);
		} catch (Exception e) {
			System.out.println("Erro de conexão" +e.getMessage());
			e.printStackTrace();
			return null;
		}

	}

	public Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}
}