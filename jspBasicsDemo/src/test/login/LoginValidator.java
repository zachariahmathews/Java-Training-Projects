package test.login;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

public class LoginValidator {

	public boolean validate(HttpServletRequest request){
	
		if(request.getParameter("username").equalsIgnoreCase("zach")&&request.getParameter("password").equalsIgnoreCase("pass")){
			
			return true;
		}
		return false;
	}
}
