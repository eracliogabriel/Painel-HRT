package servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String usuarioProv = "Administrador";
		String senhaProv = "admin";

		String email = req.getParameter("email");
		String senha = req.getParameter("senha");

		PrintWriter saida = res.getWriter();
		saida.println("<html>");

		if(email.equals(usuarioProv) && senha.equals(senhaProv)) {
			res.sendRedirect("gerenciador.jsp");	
		}else {
			saida.println("Login ou Senha incorreta");	
		}

		saida.println("</html>");


	}
}