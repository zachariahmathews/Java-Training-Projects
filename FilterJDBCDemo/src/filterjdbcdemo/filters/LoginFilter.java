package filterjdbcdemo.filters;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import filterjdbcdemo.db.SQLConnUtil;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

    
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse res=(HttpServletResponse) response;
		boolean valid=false;
		System.out.println("inside filter");
		SQLConnUtil sqlutil=SQLConnUtil.getInstance();
		Connection conn=sqlutil.openConnection();
		try {
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery("select * from T_0998_Login where userid='"+req.getParameter("username")+"' and password='"+req.getParameter("password")+"'");
			while(rs.next()){
				valid=true;
				System.out.println("Successfully logged in");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(!valid){
			System.out.println("invalid");
			res.sendRedirect("index.html");
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
