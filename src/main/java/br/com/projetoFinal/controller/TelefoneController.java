package br.com.projetoFinal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoFinal.model.Telefone;
import br.com.projetoFinal.persistence.TelefoneDao;


public class TelefoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/cadastrarTelefone.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TelefoneDao tel = new TelefoneDao();
		
		Integer ddd = Integer.valueOf(request.getParameter("ddd").trim());
		String numero = request.getParameter("numero").trim();
		String tipo = request.getParameter("tipo");
		Integer idUsuario = Integer.valueOf(request.getParameter("idUsuario"));
		
		Telefone telefone = new Telefone(ddd, numero, tipo, idUsuario);
		
		try {
			if(tel.insert(telefone)) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/consultarTelefone.jsp?pmensagem=Telefone cadastrado com sucesso!");
				dispatcher.forward(request, response);

			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/cadastrarTelefone.jsp?pmensagem=Erro ao cadastrar telefone!");
				dispatcher.forward(request, response);
			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}
	
}
