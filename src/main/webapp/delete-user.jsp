<%@page import="org.apache.tomcat.util.buf.UDecoder"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete User</title>
</head>
<body>
	<% int id = Integer.parseInt(request.getParameter("id")); %>
	<% UserDao.deleteUserById(id); %>
	<% String msg = "user with id : " + id + " has been deleted sucessfully"; %>
	<% request.setAttribute("deleteMsg", msg);%>
	<% request.getRequestDispatcher("all-users.jsp").forward(request, response); %>
</body>
</html>