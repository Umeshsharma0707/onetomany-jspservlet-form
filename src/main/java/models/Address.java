package models;

public class Address {
		private int id;
		private int userId;
		private boolean isPermanent;
		private String houseNo;
		private String  houseName;
		private String street;
		private String zipCode;
		private String city;
		private String country;
		
		
		// getters , setters
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public String getHouseNo() {
			return houseNo;
		}
		public void setHouseNo(String houseNo) {
			this.houseNo = houseNo;
		}
		public String getHouseName() {
			return houseName;
		}
		public void setHouseName(String houseName) {
			this.houseName = houseName;
		}
		public String getStreet() {
			return street;
		}
		public void setStreet(String street) {
			this.street = street;
		}
		public String getZipCode() {
			return zipCode;
		}
		public void setZipCode(String zipCode) {
			this.zipCode = zipCode;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		
		public boolean isPermanent() {
			return isPermanent;
		}
		public void setPermanent(boolean isPermanent) {
			this.isPermanent = isPermanent;
		}
		@Override
		public String toString() {
			return "Address [id=" + id + ", userId=" + userId + ", isPermanent=" + isPermanent + ", houseNo=" + houseNo
					+ ", houseName=" + houseName + ", street=" + street + ", zipCode=" + zipCode + ", city=" + city
					+ ", country=" + country + "]";
		}
		
		
	
		
}
