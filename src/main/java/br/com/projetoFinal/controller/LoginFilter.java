package br.com.projetoFinal.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String loginURI = request.getContextPath() + "/login";
        String cadastroURI = request.getContextPath() + "/cadastro";
        

        boolean logado = session != null && session.getAttribute("email") != null;
        boolean loginRequest = request.getRequestURI().equals(loginURI);
        boolean cadastroRequest = request.getRequestURI().equals(cadastroURI);
        boolean cssRequest = request.getRequestURI().contains("css");
        boolean jpgRequest = request.getRequestURI().contains("jpg");


        if (logado || loginRequest || cadastroRequest || cssRequest || jpgRequest) {
            chain.doFilter(request, response);
        } else {
            response.sendRedirect(loginURI);
        }
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
