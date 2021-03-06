package com.envestnet.doit.util;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.envestnet.doit.beans.Task;
import com.envestnet.doit.dao.beans.TaskBean;

public class SortListUtil {

	public static List<Task> sort(List<Task> tasks) {

		/* Sort the given list of Task based on the datetime data */

		Collections.sort(tasks, new Comparator<Task>() {

			@Override
			public int compare(Task o1, Task o2) {

				return (o1.getTaskdatetime().compareTo(o2.getTaskdatetime()));
			}
		});
		return tasks;
	}

	void test() {
	}

}
