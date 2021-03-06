package com.envestnet.doit.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.envestnet.doit.dao.SignupDAO;
import com.envestnet.doit.dao.beans.UserBean;
import com.envestnet.doit.db.SQLConnUtil;

public class SignupDAOImpl implements SignupDAO {

	@Override
	public boolean signup(UserBean userBean) {
		
		System.out.println(userBean.getUserid()+" "+userBean.getPassword());
		SQLConnUtil sql=SQLConnUtil.getInstance();
		Connection conn=sql.openConnection();
		try {
			
			Statement st=conn.createStatement();
			PreparedStatement ps=conn.prepareStatement("insert into user values(?,?)");
			ps.setString(1, userBean.getUserid());
			ps.setString(2, userBean.getPassword());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			
			System.out.println("exception");
			return false;
		}
		finally{
			sql.closeConnection();
		}
	}

}
