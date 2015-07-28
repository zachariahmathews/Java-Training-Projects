package com.envestnet.doit.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import com.envestnet.doit.dao.beans.TaskBean;


public class ConvertListUtil {

public static List<TaskBean> convert(ResultSet rs){
		
		List<TaskBean> tasks=new ArrayList<TaskBean>();
		try {
			while(rs.next()){
				TaskBean t=new TaskBean();
				t.setTaskid(rs.getInt("taskid"));
				t.setUserid(rs.getString("userid"));
				t.setCategory(rs.getString("category"));
				t.setTask(rs.getString("task"));
				String[] date=rs.getString("taskdate").split("-");
				String[] time=rs.getString("tasktime").split(":");
				t.setTasktime(LocalTime.of(Integer.parseInt(time[0]), Integer.parseInt(time[1])));
				t.setTaskdate(LocalDate.of(Integer.parseInt(date[0]), Integer.parseInt(date[1]), Integer.parseInt(date[2])));
				t.setPriority(rs.getInt("priority"));
				t.setTaskgroup(rs.getInt("taskgroup"));
				t.setDone(rs.getString("done").charAt(0));
				tasks.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tasks;
	}
}