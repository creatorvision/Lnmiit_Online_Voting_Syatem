<%@page import="jsp.*,java.sql.*,java.util.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!String EventName = "name";
	java.sql.Date date = null;
	java.sql.Time startTime = null;
	java.sql.Time endTime = null;
	ArrayList<String> positions = new ArrayList<String>();%>

	<%
		try {

			M_ElectionEvent EE = new M_ElectionEvent();

			if (session.getAttribute("fname").equals("create_ee")) {

				positions.clear();
				SimpleDateFormat formatter = new SimpleDateFormat(
						"MM/dd/yyyy");
				System.out.println(session.getAttribute("fname"));

				EventName = request.getParameter("electionevent");
				System.out.println("testname" + EventName);
				date = new java.sql.Date(formatter.parse(
						request.getParameter("date")).getTime());

				String[] ids = request.getParameterValues("list");
				// this will get array of values of all checked checkboxes
				for (String id : ids) {
					// do something with id, this is checkbox value
					positions.add(id);
					System.out.println(id);
				}
				SimpleDateFormat timeformatter = new SimpleDateFormat(
						"HH:mm:ss");

				startTime = new java.sql.Time(timeformatter.parse(
						request.getParameter("starttime")).getTime());
				endTime = new java.sql.Time(timeformatter.parse(
						request.getParameter("endtime")).getTime());

				boolean iscreated = EE.createEE(EventName, date, startTime,
						endTime, positions);
				if (iscreated) {

					response.sendRedirect("ceo.jsp");
				}

				else
					;

			}

			else if (session.getAttribute("fname").equals("update_ee")) {
				
				positions.clear();

				SimpleDateFormat formatter = new SimpleDateFormat(
						"MM/dd/yyyy");
				System.out.println(session.getAttribute("fname"));

				EventName = request.getParameter("electionevent");
				System.out.println("testname" + EventName);
				date = new java.sql.Date(formatter.parse(
						request.getParameter("date")).getTime());

				String[] ids = request.getParameterValues("list");
				// this will get array of values of all checked checkboxes
				for (String id : ids) {
					// do something with id, this is checkbox value
					positions.add(id);
					System.out.println(id);
				}
				SimpleDateFormat timeformatter = new SimpleDateFormat(
						"HH:mm:ss");

				startTime = new java.sql.Time(timeformatter.parse(
						request.getParameter("starttime")).getTime());
				endTime = new java.sql.Time(timeformatter.parse(
						request.getParameter("endtime")).getTime());

				boolean isupdated = EE.updateEE(EventName, date, startTime,
						endTime, positions);
				if (isupdated) {
					response.sendRedirect("ceo.jsp");

				}

			}

			else if (session.getAttribute("fname").equals("delete_ee")) {

				EventName = request.getParameter("electionevent");
				System.out.println(session.getAttribute("fname"));
				boolean isdeleted = EE.deleteEE(EventName);

				if (isdeleted) {
					response.sendRedirect("ceo.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>


</body>
</html>