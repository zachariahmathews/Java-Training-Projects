package com.envestnet.doit.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Set;

import com.envestnet.doit.beans.Task;
import com.envestnet.doit.dao.LoadDAO;
import com.envestnet.doit.db.SQLConnUtil;
import com.envestnet.doit.util.ConvertListUtil;

public class LoadDAOImpl implements LoadDAO {

	@Override
	public List<Task> load() {
		SQLConnUtil sqlconn=SQLConnUtil.getInstance();
		Connection conn=sqlconn.openConnection();
		List<Task> tasks=null;
		try {
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery("select * from TASK");
			tasks=ConvertListUtil.convert(rs);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally{
			sqlconn.closeConnection();
		}
		return tasks;
	}

}
