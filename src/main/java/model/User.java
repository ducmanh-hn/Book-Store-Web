package model;

import java.sql.Date;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer user_id;
	private String name;
	private Date dateOfBirth;
	@Column(length = 10)
	private String phone;
	private String gender;
	private String address;
	private String email;
	private String password;
	@ManyToOne
	@JoinColumn(name = "role_id")
	private Role role;
	
	
	public User() {
		// TODO Auto-generated constructor stub
	}


	public User(Integer user_id, String name, Date dateOfBirth, String phone, String gender, String address,
			String email, String password, Role role) {
		this.user_id = user_id;
		this.name = name;
		this.dateOfBirth = dateOfBirth;
		this.phone = phone;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.password = password;
		this.role = role;
	}


	public User(String name, Date dateOfBirth, String phone, String gender, String address, String email,
			String password, Role role) {
		this.name = name;
		this.dateOfBirth = dateOfBirth;
		this.phone = phone;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.password = password;
		this.role = role;
	}


	public Integer getUser_id() {
		return user_id;
	}


	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Date getDateOfBirth() {
		return dateOfBirth;
	}


	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public Role getRole() {
		return role;
	}


	public void setRole(Role role) {
		this.role = role;
	}


	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", name=" + name + ", dateOfBirth=" + dateOfBirth + ", phone=" + phone
				+ ", gender=" + gender + ", address=" + address + ", email=" + email + ", password=" + password
				+ ", role=" + role + "]";
	}


	@Override
	public int hashCode() {
		return Objects.hash(email);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return Objects.equals(email, other.email);
	}
	
	
}
