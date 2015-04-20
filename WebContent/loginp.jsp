<%@page import="jsp.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!String username = "Username";
	String password = "Password";%>
<%
	username = request.getParameter("username");
	password = request.getParameter("password");
	System.out.println(username);
	System.out.println(password);

	if (C_ceo.validate(username, password)) {

		session = request.getSession();
		session.setAttribute("user", username);

		session.setMaxInactiveInterval(120);
		String value = Integer.toString((int) (Math.random() * 2000));
		System.out.println("Random index = " + value);
		Cookie loginCookie = new Cookie("loginindex", value);
		Session.setlastSessionId("first", Integer.parseInt(value));
		loginCookie.setMaxAge(120);
		response.addCookie(loginCookie);
		response.sendRedirect("ceo.jsp");
	} else if (C_msg.validate(username, password)) {

		session = request.getSession();
		session.setAttribute("user", username);

		session.setMaxInactiveInterval(120);
		String value = Integer.toString((int) (Math.random() * 2000));
		System.out.println("Random index = " + value);
		Cookie loginCookie = new Cookie("loginindex", value);
		Session.setlastSessionId("first", Integer.parseInt(value));
		loginCookie.setMaxAge(120);
		response.addCookie(loginCookie);
		response.sendRedirect("msg.jsp");
	} else {
		response.sendRedirect("index.jsp");

	}
%>
