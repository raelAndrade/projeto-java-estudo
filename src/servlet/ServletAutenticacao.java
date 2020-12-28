package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

@WebServlet("/pages/servletAutenticacao")
public class ServletAutenticacao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletAutenticacao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		String url = request.getParameter("url");
		
		// Nesse momento pode ser feito uma validação no banco de dados
		if(login.equalsIgnoreCase("admin") && senha.equalsIgnoreCase("123")) {
			
			User user = new User();
			user.setLogin(login);
			user.setSenha(senha);
			
			// Adiciona usuário logado na sessão
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			session.setAttribute("usuario", user);
			
			// Redireciona para o sistema e autoriza
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
		}else { // Se o login falhou
			// Redireciona para o login novamente
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login/autenticar.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
