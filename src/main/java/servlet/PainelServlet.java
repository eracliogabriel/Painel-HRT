package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DadosDAO;
import MODEL.Dados;

@WebServlet ("/painelServlet")
public class PainelServlet extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Dados objD = new Dados();
		DadosDAO objDao = new DadosDAO();
		
		long id = 0;
		if (req.getParameter("id") != null && req.getParameter("id") != "") {
			id = Long.parseLong(req.getParameter("id"));
		}
		String acao = req.getParameter("acao");
	
		if (acao != null && acao.equals("apagar")) {
			objDao.apagar(id);
		} else if(id > 0) {
			
		
		objD.setNomeCompleto(req.getParameter("nome_paciente"));
		objD.setStatus(req.getParameter("status"));
		objD.setLocal(req.getParameter("local"));
		objD.setInicioPrev(req.getParameter("inicio_previsto"));
		objD.setInicioCir(req.getParameter("inicio_cirurgia"));
		objD.setFimCir(req.getParameter("fim_cirurgia"));
		objD.setSaidaPrev(req.getParameter("saida_prevista"));
		objDao.alterar(objD);
		}else {
		
		objD.setNomeCompleto(req.getParameter("nome_paciente"));
		objD.setStatus(req.getParameter("status"));
		objD.setLocal(req.getParameter("local"));
		objD.setInicioPrev(req.getParameter("inicio_previsto"));
		objD.setInicioCir(req.getParameter("inicio_cirurgia"));
		objD.setFimCir(req.getParameter("fim_cirurgia"));
		objD.setSaidaPrev(req.getParameter("saida_prevista"));
		objDao.adiciona2(objD);
			}
		
		res.sendRedirect("painel.jsp");
		PrintWriter saida = res.getWriter();
		saida.println("<html>");
		saida.println("Erro ao gravar.");
		saida.println("</html>");
	}
}