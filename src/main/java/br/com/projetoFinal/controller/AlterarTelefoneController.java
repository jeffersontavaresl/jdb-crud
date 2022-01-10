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

public class AlterarTelefoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/alterarTelefone.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TelefoneDao teldao = new TelefoneDao();

		Integer idUsuario = Integer.valueOf(request.getParameter("idUsuario"));
		Integer idTelefone = Integer.valueOf(request.getParameter("idTelefone").trim());
		Integer ddd = Integer.valueOf(request.getParameter("ddd").trim());
		String numero = request.getParameter("numero").trim();
		String tipo = request.getParameter("tipo");

		Telefone telefone = new Telefone(idTelefone, ddd, numero, tipo);

		try {
			if (!teldao.findTelByNumber(numero, idUsuario)) {
				if (teldao.update(telefone)) {
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("/consultarTelefone.jsp?pmensagem=Telefone atualizado com sucesso!");
					dispatcher.forward(request, response);
				}
			} else {
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("/consultarTelefone.jsp?pmensagem=Telefone ja esta cadastrado na sua agenda!");
				dispatcher.forward(request, response);
			}
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
