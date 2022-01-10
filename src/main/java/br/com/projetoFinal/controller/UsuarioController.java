package br.com.projetoFinal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoFinal.model.Usuario;
import br.com.projetoFinal.persistence.UsuarioDao;

public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastro.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsuarioDao user = new UsuarioDao();

		// VERIFICA SE OS CAMPOS DIGITADOS ESTÃO EM BRANCO
		if (request.getParameter("senha").isBlank() || request.getParameter("nome").isBlank()) {
			response.sendRedirect("cadastro.jsp?pmensagem=Usuario ou senha em branco!!");
		} else {
			try {
				String nome = request.getParameter("nome").trim();
				String senha = request.getParameter("senha").trim();
				String email = request.getParameter("email").trim();
				
				Usuario usuario = new Usuario(nome, email, senha);
				if (user.insert(usuario)) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp?pmensagem=Usuario cadastro com sucesso!");
					dispatcher.forward(request, response);
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp?pmensagem=E-mail ja existe no sistema!");
					dispatcher.forward(request, response);
				}
			} catch (SQLException | IOException e) {
				e.printStackTrace();
			}
		}
	}
}
