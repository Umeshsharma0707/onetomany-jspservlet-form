package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connections.DBConnection;
import models.Address;
import models.User;

public class UserDao {
	public static void insertUser(User user ) {
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "insert into users (name,email,phone,password) values (?,?,?,?)";
			PreparedStatement pst = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			// setting data
			
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPhone());
			pst.setString(4, user.getPassword());
			
			pst.executeUpdate();
			
			
			int userId = -1;
            try (ResultSet generatedKeys = pst.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    userId = generatedKeys.getInt(1);
                }
            }
            
			
            System.out.println(userId);
            
            UserDao.insertUserAddress(user, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void insertUserAddress(User user,int userId) {
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "insert into users_addresses (userId,houseNo,houseName,street,zipCode,city,country,isPermanent) values (?,?,?,?,?,?,?,?)";
			PreparedStatement pst = connection.prepareStatement(sql);
			
			for(Address address : user.getAddresses()) {
				pst.setInt(1, userId);
				pst.setString(2, address.getHouseNo());
				pst.setString(3, address.getHouseName());
				pst.setString(4, address.getStreet());
				pst.setString(5, address.getZipCode());
				pst.setString(6, address.getCity());
				pst.setString(7, address.getCountry());
				pst.setBoolean(8, address.isPermanent());
				pst.addBatch();
			}
			
			int[] executeBatch = pst.executeBatch();
			System.out.println("rows affected : " + executeBatch.length);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<User> getAllUsers(){
		List<User> users = new ArrayList<User>();
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "select * from users";
			PreparedStatement pst = connection.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				User user = new User();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				
				List<Address> allAddressesOfUser = getAllAddressesOfUser(user.getId());
				user.setAddresses(allAddressesOfUser);
				users.add(user);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return users;
		
	}
	public static List<Address> getAllAddressesOfUser(int userId){
		
		List<Address> addresses = new ArrayList<Address>();
		
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "select * from users_addresses where userId = ?";
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Address address = new Address();
				address.setId(rs.getInt("id"));
				address.setUserId(rs.getInt("userId"));
				address.setHouseNo(rs.getString("houseNo"));
				address.setHouseName(rs.getString("houseNo"));
				address.setStreet(rs.getString("street"));
				address.setZipCode(rs.getString("zipCode"));
				address.setCity(rs.getString("city"));
				address.setCountry(rs.getString("country"));
				address.setPermanent(rs.getBoolean("isPermanent"));
				addresses.add(address);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return addresses;
		
	}
	public static User getUserById(int id) {
		User user = null;
		
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "select * from users where id = ?";
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();

			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				List<Address> allAddressesOfUser = getAllAddressesOfUser(user.getId());
				user.setAddresses(allAddressesOfUser);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
	
	public static void deleteUserById(int id) {
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "delete from users where id = ?";
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// update user
	
	public static void updateUser(User user) {
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "update users set name = ?,email=?,phone=?,password = ? where id = ?";
			PreparedStatement pst = connection.prepareStatement(sql);
			
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPhone());
			pst.setString(4, user.getPassword());
			pst.setInt(5, user.getId());
			
			pst.executeUpdate();
			
			updateUserAddress(user);
			
			System.out.println("user updated");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void updateUserAddress(User user) {
		try {
			Connection connection = DBConnection.createConnection();
			String sql = "update users_addresses set houseNo=?,houseName=?,street=?,zipCode=?,city=?,country=?,isPermanent=? where id=? and userId = ?";
			PreparedStatement pst = connection.prepareStatement(sql);
			
			for(Address address : user.getAddresses()) {
				pst.setString(1, address.getHouseNo());
				pst.setString(2, address.getHouseName());
				pst.setString(3, address.getStreet());
				pst.setString(4, address.getZipCode());
				pst.setString(5, address.getCity());
				pst.setString(6, address.getCountry());
				pst.setBoolean(7, address.isPermanent());
				pst.setInt(8, address.getId());
				pst.setInt(9, address.getUserId());
				
				pst.addBatch();
			}
			int[] updatedRows = pst.executeBatch();
			
			System.out.println("updated rows : " + updatedRows.length);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}





