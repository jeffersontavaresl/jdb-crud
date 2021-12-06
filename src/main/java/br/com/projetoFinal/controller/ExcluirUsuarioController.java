package br.com.projetoFinal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoFinal.persistence.UsuarioDao;

public class ExcluirUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.valueOf(request.getParameter("idUsuario"));
		
		UsuarioDao usuario = new UsuarioDao();
		
		try {
			if(usuario.delete(idUsuario)) {
                response.sendRedirect("usuario.jsp?pmensagem=Usuario excluido com sucesso");
			} else {
				response.sendRedirect("usuario.jsp?pmensagem=Usuario atrelado a um telefone. Erro ao excluir.");
			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}

}
