package br.com.projetoFinal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projetoFinal.persistence.LoginDao;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");

		LoginDao login = new LoginDao();
		
		try {
			if(login.usuarioExiste(email)) {
				if(login.podeLogar(email, senha)) {
					
					request.getSession().setAttribute("email", email);
					request.getSession().setAttribute("senha", senha);
                	RequestDispatcher dispatcher = request.getRequestDispatcher("/inicio.jsp");
            		dispatcher.forward(request, response);

	                } else {
	                	RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp?pmensagem=Usuario ou senha incorretos. Tente novamente!");
	            		dispatcher.forward(request, response);
				}
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp?pmensagem=Falha ao realizar o login!! Usuario nao existe.");
        		dispatcher.forward(request, response);

			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}	

	}
}
