package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Address;
import models.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.UserDao;

/**
 * Servlet implementation class UserController
 */

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("add user")) {
			User user = new User();
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			user.setPhone(request.getParameter("phone"));
			user.setPassword(request.getParameter("password"));
			
		
			
			// fetch addresses
			
			Address a1 = new Address();
			
			a1.setPermanent(Boolean.parseBoolean(request.getParameter("isPermanent")));
			a1.setHouseNo(request.getParameter("houseNo"));
			a1.setHouseName(request.getParameter("houseName"));
			a1.setStreet(request.getParameter("street"));
			a1.setZipCode(request.getParameter("zipCode"));
			a1.setCity(request.getParameter("city"));
			a1.setCountry(request.getParameter("country"));
			
			Address a2 = new Address();
			
			a2.setPermanent(Boolean.parseBoolean(request.getParameter("pIsPermanent")));
			a2.setHouseNo(request.getParameter("permanentHouseNo"));
			a2.setHouseName(request.getParameter("permanentHouseName"));
			a2.setStreet(request.getParameter("permanentStreet"));
			a2.setZipCode(request.getParameter("permanentZipCode"));
			a2.setCity(request.getParameter("permanentCity"));
			a2.setCountry(request.getParameter("permanentCountry"));
			
			List<Address> addresses = new ArrayList<Address>();
			addresses.add(a1);
			addresses.add(a2);
			
			user.setAddresses(addresses);
			
			UserDao.insertUser(user);
			
			String msg = user.getName() + " is registered successfully";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}else if(action.equalsIgnoreCase("update user")) {
			User user = new User();
			user.setId(Integer.parseInt(request.getParameter("id")));
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			user.setPhone(request.getParameter("phone"));
			user.setPassword(request.getParameter("password"));
			
			// fetching addresses
			List<Address> addresses = new ArrayList<Address>();
			
			Address a1 = new Address();
			a1.setId(Integer.parseInt(request.getParameter("localAddressId")));
			a1.setUserId(user.getId());
			a1.setPermanent(Boolean.parseBoolean(request.getParameter("isPermanent")));
			a1.setHouseNo(request.getParameter("houseNo"));
			a1.setHouseName(request.getParameter("houseName"));
			a1.setStreet(request.getParameter("street"));
			a1.setZipCode(request.getParameter("zipCode"));
			a1.setCity(request.getParameter("city"));
			a1.setCountry(request.getParameter("country"));
			
			// permanent address
			Address a2 = new Address();
			a2.setId(Integer.parseInt(request.getParameter("permanentAddressId")));
			a2.setUserId(user.getId());
			a2.setPermanent(Boolean.parseBoolean(request.getParameter("pIsPermanent")));
			a2.setHouseNo(request.getParameter("permanentHouseNo"));
			a2.setHouseName(request.getParameter("permanentHouseName"));
			a2.setStreet(request.getParameter("permanentStreet"));
			a2.setZipCode(request.getParameter("permanentZipCode"));
			a2.setCity(request.getParameter("permanentCity"));
			a2.setCountry(request.getParameter("permanentCountry"));
			
			addresses.add(a1);
			addresses.add(a2);
			
			user.setAddresses(addresses);
			
			// call update method
			
			UserDao.updateUser(user);
			
			
			
			request.setAttribute("updateSuccessMsg", "user updated successfully");
			request.getRequestDispatcher("edit-user.jsp").forward(request, response);
		}
		
	}

}











