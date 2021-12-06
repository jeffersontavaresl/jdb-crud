package br.com.projetoFinal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoFinal.model.Usuario;
import br.com.projetoFinal.persistence.UsuarioDao;

public class AlterarDadosController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Usuario usuario = null;
		UsuarioDao user = new UsuarioDao();

		// VERIFICA SE OS CAMPOS DIGITADOS ESTÃO EM BRANCO
		   if (request.getParameter("senha").isBlank() || request.getParameter("nome").isBlank()) {
				response.sendRedirect("usuario.jsp?pmensagem=Usuario ou senha em branco!!");
		   } else {
			   try {
					Integer id = Integer.valueOf(request.getParameter("idUsuario"));
					String nome = request.getParameter("nome").trim();
					String senha = request.getParameter("senha").trim();
					String email = request.getParameter("email").trim();
					
					usuario = new Usuario(id, nome, email, senha);

					if (user.update(usuario)) {
						response.sendRedirect("inicio.jsp?pmensagem=Usuario atualizado com sucesso!");
					} else {
						response.sendRedirect("inicio.jsp?pmensagem=Erro ao atualizar usuario");
					}
				} catch (SQLException | IOException e) {
					e.printStackTrace();
				}
		   }
	}
}
