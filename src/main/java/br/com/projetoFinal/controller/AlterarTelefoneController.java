package br.com.projetoFinal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoFinal.model.Telefone;
import br.com.projetoFinal.persistence.TelefoneDao;

public class AlterarTelefoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TelefoneDao teldao = new TelefoneDao();
		Telefone telefone = null;
		
		Integer idTelefone = Integer.valueOf(request.getParameter("idTelefone").trim());
		Integer ddd = Integer.valueOf(request.getParameter("ddd").trim());
		String numero = request.getParameter("numero").trim();
		String tipo = request.getParameter("tipo");
		
		telefone = new Telefone(idTelefone, ddd, numero, tipo);
		try {
			if(teldao.update(telefone)) {
				response.sendRedirect("consultarTelefone.jsp?pmensagem=Telefone atualizado com sucesso!");

			} else {
				response.sendRedirect("consultarTelefone.jsp?pmensagem=Erro ao atualizar telefone!");
			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}

}

