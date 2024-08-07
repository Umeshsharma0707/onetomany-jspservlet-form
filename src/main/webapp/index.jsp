<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Complex form</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
  <div class="container mt-5">
    <h2 class="mb-4">User Information Form</h2>
    
    <h2><a href="all-users.jsp">show all users</a></h2>
    
    <% String msg = (String)request.getAttribute("msg"); %>
    <% if(msg!=null){ %>
    <span style="color: red;background: beige; ">
    	<% out.print(msg); %>
    </span>
    <%} %>
    <form action="UserController" method="post">
      <div class="row mb-3">
        <div class="col-md-6">
          <label for="name" class="form-label">Name</label>
          <input type="text" class="form-control" name="name" id="name" required>
        </div>
        <div class="col-md-6">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" name="email" id="email" required>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-6">
          <label for="phone" class="form-label">Phone</label>
          <input type="tel" class="form-control" name="phone" id="phone" required>
        </div>
        <div class="col-md-6">
          <label for="password" class="form-label">password</label>
          <input type="password" class="form-control" name="password" id="password" required>
        </div>
      </div>
      
          <div class="card">
      <div class="card-body">
      <h3>Address : </h3>
      <div class="col-md-4">
          <label for="isPermanet" class="form-label">Is Permanent </label>
          <input type="checkbox"  name="isPermanent" value="false" id="isPermanent" disabled="disabled">
        </div>
            <div class="row mb-3">
             
        <div class="col-md-4">
          <label for="houseNo" class="form-label">House Number</label>
          <input type="text" class="form-control" name="houseNo" id="houseNo" required>
        </div>
        <div class="col-md-4">
          <label for="buildingName" class="form-label">Building Name</label>
          <input type="text" class="form-control" name="houseName" id="buildingName" required>
        </div>
        <div class="col-md-4">
          <label for="street" class="form-label">Street</label>
          <input type="text" class="form-control" name="street" id="street" required>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-4">
          <label for="zipCode" class="form-label">Zip Code</label>
          <input type="text" class="form-control" name="zipCode" id="zipCode" required>
        </div>
        <div class="col-md-4">
          <label for="city" class="form-label">City</label>
          <input type="text" class="form-control" name="city" id="city" required>
        </div>
        <div class="col-md-4">
          <label for="country" class="form-label">Country</label>
          <input type="text" class="form-control" name="country" id="country" required>
        </div>
      </div>
      </div>
      </div>
      <div class="card">
      <div class="card-body">
      <h3>Permanent Address : </h3>
      <label for="isPermanet" class="form-label">Is Permanent </label>
          <input type="checkbox"  name="pIsPermanent" value="true" id="isPermanent" checked>
            <div class="row mb-3">
        <div class="col-md-4">
          <label for="houseNo" class="form-label">House Number</label>
          <input type="text" class="form-control" name="permanentHouseNo" id="PhouseNo" required>
        </div>
        <div class="col-md-4">
          <label for="buildingName" class="form-label">Building Name</label>
          <input type="text" class="form-control" name="permanentHouseName" id="PbuildingName" required>
        </div>
        <div class="col-md-4">
          <label for="street" class="form-label">Street</label>
          <input type="text" class="form-control"  name="permanentStreet" id="Pstreet" required>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-4">
          <label for="zipCode" class="form-label">Zip Code</label>
          <input type="text" class="form-control"  name="permanentZipCode" id="PzipCode" required>
        </div>
        <div class="col-md-4">
          <label for="city" class="form-label">City</label>
          <input type="text" class="form-control"  name="permanentCity" id="Pcity" required>
        </div>
        <div class="col-md-4">
          <label for="country" class="form-label">Country</label>
          <input type="text" class="form-control" name="permanentCountry" id="Pcountry" required>
        </div>
      </div>
      </div>
      </div>
      <button type="submit" name="action" value="add user" class="btn btn-primary">Submit</button>
    </form>
  </div>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

