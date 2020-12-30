package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDao;

@WebServlet("/pages/fileUpload")
public class FileUpload extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private UsuarioDao usuarioDao = new UsuarioDao();

	public FileUpload() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			// Usar a variável fileUpload para salvar no banco de dados
			String fileUpload = request.getParameter("fileUpload");
			System.out.println(fileUpload); // Imagem em base 64
			
			// Nesse momento faz o insert no banco de dados
			usuarioDao.gravarImagem(fileUpload);
			
			response.getWriter().write("Upload realizado com sucesso");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Erro ao realizar Upload");
		}
	}

}
