package br.com.projetoFinal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoFinal.persistence.TelefoneDao;


public class ExcluirTelefoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idTelefone = Integer.valueOf(request.getParameter("idTelefone"));
		
		TelefoneDao telefone = new TelefoneDao();
		
		try {
			if(telefone.delete(idTelefone)) {
				response.sendRedirect("consultarTelefone.jsp?pmensagem=Telefone excluido com sucesso");
			} else {
				response.sendRedirect("consultarTelefone.jsp?pmensagem=Erro ao excluir telefone");
				}
		} catch (SQLException  | IOException e) {
			e.printStackTrace();
		}
	}

}
