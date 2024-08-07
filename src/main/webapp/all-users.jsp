<%@page import="dao.UserDao"%>
<%@page import="models.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Users</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
    	<h1><a href="index.jsp">Add new User</a></h1>
        <h2 class="mb-4">Users Table</h2>
        
        <!--delete success msg  -->
        <% String deleteMsg = (String)request.getAttribute("deleteMsg"); %>
        <%if(deleteMsg != null){ %>
        <span style="color: red; background: beige;">
        	<%out.print(deleteMsg); %>
        </span>
        <%} %>
        <table class="table table-responsive table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col" class="col-3">User Name</th>
                    <th scope="col" class="col-3">User Email Id</th>
                    <th scope="col" class="col-3">View and Edit User</th>
                    <th scope="col" class="col-3">Delete User</th>
                </tr>
            </thead>
            <tbody>
            <% List<User> users = UserDao.getAllUsers(); %>
            <% for(User user : users){ %>
                <tr>
                    <td><%=user.getName() %></td>
                    <td><%=user.getEmail() %></td>
                    <td><a href="edit-user.jsp?id=<%= user.getId()%>">View and Edit</a></td>
                    <td><a href="delete-user.jsp?id=<%= user.getId()%>">Delete User</a></td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>