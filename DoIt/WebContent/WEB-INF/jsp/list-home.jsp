<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="com.envestnet.doit.beans.Task"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DoIt - Home</title>
<link rel="stylesheet" href="css/bootstrap-datepicker3.min.css" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/bootstrap-select.min.css" />
<link rel="stylesheet" href="css/bootstrap-timepicker.min.css" />
</head>
<body onload="datepick()" style="background-image: url('img/bg.jpg');">
	<div id="container">
		<header class="header fixed-top clearfix"> <!--logo start-->
		<div class="brand">

			<!-- <a href="index.html" class="logo">  -->
			<!-- <img src="images/logo.png" alt=""> -->
			<p class="logo">DoIt!</p>
			<!-- </a> -->
			<div class="sidebar-toggle-box">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
		</div>
		<!--logo end-->
		<div class="top-nav clearfix">
			<!--search & user info start-->
			<ul class="nav pull-right top-menu">

				<!-- user login dropdown start-->
				<li class="dropdown"><a data-toggle="dropdown"
					class="dropdown-toggle" href="#"> <img alt="" src="img/bg.jpg">
						<span class="username"> <%=request.getSession().getAttribute("userid")%></span>
						<b class="caret"></b>
				</a>
					<ul class="dropdown-menu extended logout">
						<li><a href="Controller?handler=logout"><span
								class="glyphicon glyphicon-off"></span>&nbsp; Log Out</a></li>
					</ul></li>
				<!-- user login dropdown end -->

			</ul>
			<!--search & user info end-->
		</div>
		</header>
		<aside>
		<div id="sidebar" class="nav-collapse">
			<!-- sidebar menu start-->
			<div class="leftside-navigation">
				<ul class="sidebar-menu" id="nav-accordion">
					<li><a href="index.html"> <i class="fa fa-dashboard"></i>
							<span>Dashboard</span>
					</a></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-laptop"></i> <span>Layouts</span>
					</a>
						<ul class="sub">
							<li><a href="boxed_page.html">Boxed Page</a></li>
							<li><a href="horizontal_menu.html">Horizontal Menu</a></li>
							<li><a href="language_switch.html">Language Switch Bar</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-book"></i> <span>UI Elements</span>
					</a>
						<ul class="sub">
							<li><a href="general.html">General</a></li>
							<li><a href="buttons.html">Buttons</a></li>
							<li><a href="typography.html">Typography</a></li>
							<li><a href="widget.html">Widget</a></li>
							<li><a href="slider.html">Slider</a></li>
							<li><a href="tree_view.html">Tree View</a></li>
							<li><a href="nestable.html">Nestable</a></li>
							<li><a href="grids.html">Grids</a></li>
							<li><a href="calendar.html">Calender</a></li>
							<li><a href="draggable_portlet.html">Draggable Portlet</a></li>
						</ul></li>
					<li><a href="fontawesome.html"> <i class="fa fa-bullhorn"></i>
							<span>Fontawesome </span>
					</a></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-th"></i> <span>Data Tables</span>
					</a>
						<ul class="sub">
							<li><a href="basic_table.html">Basic Table</a></li>
							<li><a href="responsive_table.html">Responsive Table</a></li>
							<li><a href="dynamic_table.html">Dynamic Table</a></li>
							<li><a href="editable_table.html">Editable Table</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-tasks"></i> <span>Form Components</span>
					</a>
						<ul class="sub">
							<li><a href="form_component.html">Form Elements</a></li>
							<li><a href="advanced_form.html">Advanced Components</a></li>
							<li><a href="form_wizard.html">Form Wizard</a></li>
							<li><a href="form_validation.html">Form Validation</a></li>
							<li><a href="file_upload.html">Muliple File Upload</a></li>

							<li><a href="dropzone.html">Dropzone</a></li>
							<li><a href="inline_editor.html">Inline Editor</a></li>

						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-envelope"></i> <span>Mail </span>
					</a>
						<ul class="sub">
							<li><a href="mail.html">Inbox</a></li>
							<li><a href="mail_compose.html">Compose Mail</a></li>
							<li><a href="mail_view.html">View Mail</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class=" fa fa-bar-chart-o"></i> <span>Charts</span>
					</a>
						<ul class="sub">
							<li><a href="morris.html">Morris</a></li>
							<li><a href="chartjs.html">Chartjs</a></li>
							<li><a href="flot_chart.html">Flot Charts</a></li>
							<li><a href="c3_chart.html">C3 Chart</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- sidebar menu end-->
		</div>
		</aside>

		<section id="main-content"> <section class="wrapper">
		<!-- page start--> <%
 	if(request.getParameter("handler").equals("edit-link")){
 		
 	List<Task> tasks=(List<Task>) getServletContext().getAttribute("tasks");
 	Task task=null;
 	for(Task temp:tasks) {
 		if(temp.getDisplayid()==Integer.parseInt(request.getParameter("index"))){
 	
 	task=temp;
 	break;
 		}
 	}
 %>
		<form action="Controller">
			<input type="hidden" name="taskid" value="<%=task.getTaskid()%>">
			Enter the task : <input type="text" name="task"
				value="<%=task.getTask()%>"> <br> Priority : <select
				name="priority">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select> <br> Date: <input type="text" id="datepicker1" name="taskdate"
				value="<%=task.getTaskdatetime().toLocalDate()%>"> <br>
			Time:
			<div class="input-append bootstrap-timepicker">
				<input id="timepicker1" type="text" class="input-small"
					value="<%=task.getTaskdatetime().toLocalTime().format(DateTimeFormatter.ofPattern("hh:mm a"))%>">
				<span class="add-on"><i class="icon-time"></i></span>
			</div>
			<input type="hidden" name="handler" value="edit-page"> <input
				type="submit" value="Edit"> <br>
		</form>
		<%
			}
			else{
		%>
		<form action="Controller" class="form-add">
			<div class="add-wrap">
				Enter the task : <input type="text" name="task" class="form-control">
				<br> Priority : <select name="priority" class="selectpicker">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select> <br> Date: <input type="text" id="datepicker1" name="taskdate"
					class="form-control"> <br> Time:
				<div class="input-append bootstrap-timepicker">
					<input id="timepicker1" type="text"
						class="input-small form-control"> <span class="add-on"><i
						class="icon-time"></i></span>
				</div>
				<input type="hidden" name="handler" value="list-add"> <input
					type="submit" value="Add"> <br>
			</div>
		</form>
		<%
			}
		%> <br>
		<hr>
		<h1><%=request.getSession().getAttribute("userid")%></h1>
		<hr>
		<table width="100%" class="table">
			<tr>
				<td>Priority</td>
				<td>Task Description</td>
				<td>Task Time</td>
				<td>Task Date</td>
				<td></td>
			</tr>
			<%
				int i = 0;
					//System.out.println("After-jsp: "+((List<Task>)getServletContext().getAttribute("tasks")).size());
					for (Task t : (List<Task>) getServletContext()
							.getAttribute("tasks")) {

						t.setDisplayid(++i);
						if (t.getUserid().equals(
								request.getSession().getAttribute("userid"))) {
							//System.out.println(t.getTask()+" "+t.getUserid()+" "+t.getDone());
							if (t.getDone() == 'n'
									&& t.getTaskdatetime().isAfter(LocalDateTime.now())) {
			%>
			<tr>
				<td><%=t.getPriority()%></td>
				<td><%=t.getTask()%></td>
				<td><%=t.getTaskdatetime().toLocalTime().format(DateTimeFormatter.ofPattern("hh:mm a"))%></td>
				<td><%=t.getTaskdatetime().toLocalDate().toString()%></td>
				<td><a href="Controller?handler=edit-link&index=<%=i%>">Edit</a></td>
				<td><a href="Controller?handler=remove&index=<%=i%>">Remove</a></td>
				<td><a href="Controller?handler=done&index=<%=i%>">Done</a></td>
			</tr>
			<%
				}}}
			%>
		</table>

		<!-- page end--> </section> </section>



	</div>
	<script type="text/javascript">
		function datepick() {

			$('.selectpicker').selectpicker();
			$('#timepicker1').timepicker();
			$('#datepicker1').datepicker({
				format : "yyyy-mm-dd",
				autoclose : true
			});

		}
	</script>
	<script src="js/jquery-2.1.4.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/bootstrap-timepicker.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
</body>
</html>