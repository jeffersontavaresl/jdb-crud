package br.com.projetoFinal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoFinal.model.Telefone;
import br.com.projetoFinal.persistence.TelefoneDao;


public class TelefoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TelefoneDao tel = new TelefoneDao();
		Telefone telefone = null;
		
		Integer ddd = Integer.valueOf(request.getParameter("ddd").trim());
		String numero = request.getParameter("numero").trim();
		String tipo = request.getParameter("tipo");
		Integer idUsuario = Integer.valueOf(request.getParameter("idUsuario"));
		
		telefone = new Telefone(ddd, numero, tipo, idUsuario);
		
		try {
			if(tel.insert(telefone)) {
				response.sendRedirect("consultarTelefone.jsp?pmensagem=Telefone cadastrado com sucesso!");

			} else {
				response.sendRedirect("consultarTelefone.jsp?pmensagem=Erro ao cadastrar telefone!");
			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}
	
}
