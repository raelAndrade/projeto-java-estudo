package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.User;

@WebFilter(urlPatterns = {"/pages/acessoAoSistema.jsp"})
public class FilterAutenticacao implements Filter {

	// Faz alguma coisa quando a aplicação é derrubada
	@Override
	public void destroy() { }

	// Intercepta todas as requisições
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		// Retorna null caso não esteja logado
		User user = (User) session.getAttribute("usuario");
		
		if(user == null) { // Usuario não logado
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login/autenticar.jsp");
			dispatcher.forward(request, response);
			return; // para o processo para redirecionar
		}		
		
		// Executa as ações do request e response
		chain.doFilter(request, response); // O chain é responsável por fazer a execução do nosso request e response
		
		System.out.println("Interceptando ...");
	}

	// Executa alguma coisa quando a aplicação é iniciada
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
