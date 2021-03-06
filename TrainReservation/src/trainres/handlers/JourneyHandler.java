package trainres.handlers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import trainres.beans.JourneyBean;
import trainres.beans.PassengerBean;

public class JourneyHandler {

	private HttpServletRequest request;

	public JourneyHandler(HttpServletRequest request) {
		
		this.request = request;
	}
	public void storeJourney(){
		
		JourneyBean jb=new JourneyBean(Integer.parseInt(request.getParameter("pid")),Integer.parseInt(request.getParameter("t_id")),request.getParameter("class"),Integer.parseInt(request.getParameter("available")));
		HttpSession session=request.getSession();
		session.setAttribute("available", false);
		session.setAttribute("journey", jb);
	}
}
