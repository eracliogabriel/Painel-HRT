package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;

import DAO.DadosDAO;
import MODEL.Dados;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet ("/painelServlet")
public class PainelServlet extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Dados objD = new Dados();

		objD.setNomeCompleto(req.getParameter("nome_paciente"));
//		objD.setStatus(req.getParameter("status"));
//		objD.setLocal(req.getParameter("local"));

		
		DadosDAO objDao = new DadosDAO();
		
		if (objDao.adiciona2(objD)) {
			res.sendRedirect("painel.jsp");
		} else {
			PrintWriter saida = res.getWriter();
			saida.println("<html>");
			saida.println("Erro ao gravar.");
			saida.println("</html>");
		}
	}
}
