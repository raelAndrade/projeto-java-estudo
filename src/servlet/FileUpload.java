package servlet;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;

import dao.UsuarioDao;

@WebServlet("/pages/fileUpload")
public class FileUpload extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private UsuarioDao usuarioDao = new UsuarioDao();

	public FileUpload() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		try {
			String acao = request.getParameter("acao");
			if(acao.equalsIgnoreCase("carregar")) {
				RequestDispatcher view = request.getRequestDispatcher("upload.jsp");
				request.setAttribute("listaUserImagem", usuarioDao.getUsuarios());
				view.forward(request, response);
				
			}else if(acao.equalsIgnoreCase("download")) {
				String iduser = request.getParameter("iduser");
				String imagem = usuarioDao.buscaImagem(iduser);
				if(imagem != null) {
					
					/* Seta o cabeçalho */
					response.setHeader("Content-Disposition", "attachment;filename=imagem_"+ iduser +".png");
					
					/* Pega somente imagem pura */
					String imagemPura = imagem.split(",")[1];
					
					/* Converte base 64 em bytes */
					byte [] imageBytes = new Base64().decodeBase64(imagemPura);
					
					/* Coloca os bytes em um objeto de entrada para processar */
					InputStream inputStream = new ByteArrayInputStream(imageBytes);
					
					/* Inicio - Escrever dados na resposta */
					int read = 0;
					byte[] bytes = new byte[1024];
					OutputStream outputStream = response.getOutputStream();
					
					while((read = inputStream.read(bytes)) != -1) {
						outputStream.write(bytes, 0, read);
					}
					outputStream.flush();
					outputStream.close();
					/* Fim - Escrever dados na resposta */
				}
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
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
