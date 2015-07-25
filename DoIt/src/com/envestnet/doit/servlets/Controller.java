package com.envestnet.doit.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.envestnet.doit.beans.Task;
import com.envestnet.doit.handlers.LoadHandler;
import com.envestnet.doit.handlers.LoginHandler;
import com.envestnet.doit.handlers.UpdateHandler;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
	public void init() throws ServletException {
		
		LoadHandler lh=new LoadHandler();
    	getServletContext().setAttribute("tasks", lh.load());
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request,response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String handlerName=request.getParameter("handler");
		
		if("login".equals(handlerName)){
			
			LoginHandler lh=new LoginHandler(request);
			if(lh.login())
				try {
					
					requestForward(request, response, "list-home.jsp");
				} catch (IOException | ServletException e) {
					
					e.printStackTrace();
				}
			else{
				try {
					
					request.setAttribute("login", false);
					requestForward(request, response, "login.jsp");					
				} catch (IOException | ServletException e) {
					
					e.printStackTrace();
				}
			}
		}
		else if("list-add".equals(handlerName)){
			
			List<Task> tasks=(List<Task>) getServletContext().getAttribute("tasks");
			UpdateHandler uh=new UpdateHandler(request);
			tasks.add(uh.update());
			getServletContext().setAttribute("tasks", tasks);
			try {
				
				requestForward(request, response, "list-home.jsp");					
			} catch (IOException | ServletException e) {
				
				e.printStackTrace();
			}
		}
	}
	
	private void requestForward(HttpServletRequest request, HttpServletResponse response,String dest) throws IOException, ServletException {
		
		RequestDispatcher rd=getServletContext().getRequestDispatcher("/WEB-INF/jsp/"+dest);
		rd.forward(request, response);
	}

}
