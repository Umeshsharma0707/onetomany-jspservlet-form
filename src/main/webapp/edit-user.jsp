<%@page import="models.Address"%>
<%@page import="models.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit User</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
  <div class="container mt-5">
    <h2 class="mb-4">User Information </h2>
    
    <h2><a href="all-users.jsp">show all users</a></h2>
    
    <!-- update success msg  -->
        <% String updateSuccessMsg = (String)request.getAttribute("updateSuccessMsg"); %>
        <%if(updateSuccessMsg != null){ %>
        <span style="color: red; background: beige;">
        	<%out.print(updateSuccessMsg); %>
        </span>
        <%} %>
    
    <% int id = Integer.parseInt(request.getParameter("id")); %>
    <% User user = UserDao.getUserById(id); %>
    <form action="UserController" method="post">
      <div class="row mb-3">
        <div class="col-md-6">
        <input type="hidden" class="form-control" name="id" value="<%= user.getId() %>" id="id" >
          <label for="name" class="form-label">Name</label>
          <input type="text" class="form-control" name="name" value="<%= user.getName() %>" id="name" required>
        </div>
        <div class="col-md-6">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" name="email" value="<%=user.getEmail() %>" id="email" required>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-6">
          <label for="phone" class="form-label">Phone</label>
          <input type="tel" class="form-control" name="phone" value="<%= user.getPhone() %>" id="phone" required>
        </div>
        <div class="col-md-6">
          <label for="password" class="form-label">password</label>
          <input type="password" class="form-control" name="password" value="<%= user.getPassword() %>" id="password" required>
        </div>
      </div>
      
          <div class="card">
      <div class="card-body">
      <h3>Address : </h3>
      <div class="col-md-4">
          <label for="isPermanet" class="form-label">Is Permanent </label>
          <input type="checkbox"  name="isPermanent" value="true" id="isPermanent"  disabled="disabled" <%= user.getAddresses().get(0).isPermanent() ? "checked" : "" %>>
        </div>
            <div class="row mb-3">
             
        <div class="col-md-4">
        
        <!-- local address id  -->
        <input type="hidden" name="localAddressId" value="<%= user.getAddresses().getFirst().getId() %>">
        
          <label for="houseNo" class="form-label">House Number</label>
          
          <input type="text" class="form-control" value="<%= user.getAddresses().getFirst().getHouseNo() %>" name="houseNo" id="houseNo" required>
        </div>
        <div class="col-md-4">
          <label for="buildingName" class="form-label">Building Name</label>
          <input type="text" class="form-control" value="<%= user.getAddresses().getFirst().getHouseName() %>" name="houseName" id="buildingName" required>
        </div>
        <div class="col-md-4">
          <label for="street" class="form-label">Street</label>
          <input type="text" class="form-control" name="street" value="<%= user.getAddresses().getFirst().getStreet() %>"  id="street" required>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-4">
          <label for="zipCode" class="form-label">Zip Code</label>
          <input type="text" class="form-control" name="zipCode" value="<%= user.getAddresses().getFirst().getZipCode() %>" id="zipCode" required>
        </div>
        <div class="col-md-4">
          <label for="city" class="form-label">City</label>
          <input type="text" class="form-control" name="city" value="<%= user.getAddresses().getFirst().getCity() %>" id="city" required>
        </div>
        <div class="col-md-4">
          <label for="country" class="form-label">Country</label>
          <input type="text" class="form-control" name="country" value="<%= user.getAddresses().getFirst().getCountry() %>"  id="country" required>
        </div>
      </div>
      </div>
      </div>
      <div class="card">
      <div class="card-body">
      <h3>Permanent Address : </h3>
      <% Address permanentAddress = user.getAddresses().get(1); %>
      
       <!-- local address id  -->
        <input type="hidden" name="permanentAddressId" value="<%= permanentAddress.getId() %>">
      
      <label for="isPermanet" class="form-label">Is Permanent </label>
          <input type="checkbox" name="pIsPermanent" id="isPermanent" value="true" <%= permanentAddress.isPermanent() ? "checked" : "" %> >

            <div class="row mb-3">
        <div class="col-md-4">
          <label for="houseNo" class="form-label">House Number</label>
          <input type="text" class="form-control" name="permanentHouseNo" value="<%=permanentAddress.getHouseNo() %>" id="PhouseNo" required>
        </div>
        <div class="col-md-4">
          <label for="buildingName" class="form-label">Building Name</label>
          <input type="text" class="form-control" name="permanentHouseName" value="<%=permanentAddress.getHouseName() %>" id="PbuildingName" required>
        </div>
        <div class="col-md-4">
          <label for="street" class="form-label">Street</label>
          <input type="text" class="form-control"  name="permanentStreet" value="<%=permanentAddress.getStreet() %>" id="Pstreet" required>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-4">
          <label for="zipCode" class="form-label">Zip Code</label>
          <input type="text" class="form-control"  name="permanentZipCode" value="<%=permanentAddress.getZipCode() %>" id="PzipCode" required>
        </div>
        <div class="col-md-4">
          <label for="city" class="form-label">City</label>
          <input type="text" class="form-control"  name="permanentCity" value="<%=permanentAddress.getCity() %>" id="Pcity" required>
        </div>
        <div class="col-md-4">
          <label for="country" class="form-label">Country</label>
          <input type="text" class="form-control" name="permanentCountry" value="<%= permanentAddress.getCountry() %>" id="Pcountry" required>
        </div>
      </div>
      </div>
      </div>
      <button type="submit" name="action" value="update user" class="btn btn-primary">Submit</button>
    </form>
  </div>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

