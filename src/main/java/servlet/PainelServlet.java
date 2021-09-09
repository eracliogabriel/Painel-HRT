package servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
		objD.setStatus(req.getParameter("status"));
		objD.setLocal(req.getParameter("local"));
		objD.setInicioPrev(req.getParameter("inicio_previsto"));
		objD.setInicioCir(req.getParameter("inicio_cirurgia"));
		objD.setFimCir(req.getParameter("fim_cirurgia"));
		objD.setSaidaPrev(req.getParameter("saida_prevista"));

		
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
