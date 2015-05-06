<%@page import="jsp.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!String username = "Username";
	String password = "Password";
	String message="User login successfully ";%>
<%
	username = request.getParameter("username");
	password = request.getParameter("password");
	System.out.println(username);
	System.out.println(password);

	try{
		if (Ceo.validate(username, password)) {
	
			session = request.getSession();
			session.setAttribute("user", username);
	
			session.setMaxInactiveInterval(120);
			String value = Integer.toString((int) (Math.random() * 2000));
			System.out.println("Random index = " + value);
			Cookie loginCookie = new Cookie("loginindex", value);
			Session.setlastSessionId("first", Integer.parseInt(value));
			loginCookie.setMaxAge(1800);
			response.addCookie(loginCookie);
			response.sendRedirect("ceo.jsp?error="+message);
		}
		
		else if (Msg.validate(username, password)) 
		{
	
			session = request.getSession();
			session.setAttribute("user", username);
	
			session.setMaxInactiveInterval(120);
			String value = Integer.toString((int) (Math.random() * 2000));
			System.out.println("Random index = " + value);
			Cookie loginCookie = new Cookie("loginindex", value);
			Session.setlastSessionId("first", Integer.parseInt(value));
			loginCookie.setMaxAge(1800);
			response.addCookie(loginCookie);
			response.sendRedirect("msg.jsp?error="+message);
		} 
		
		else 
		{
			if(username=="" || password=="" || (username=="" && password==""))
			{
				response.sendRedirect("index.jsp?error="+message);
			}
			message="No user or password matched" ;
	      	response.sendRedirect("error.jsp?error="+message);
		}
	}
	catch(Exception e)
	{
        e.printStackTrace();
	}
	
	
%>
