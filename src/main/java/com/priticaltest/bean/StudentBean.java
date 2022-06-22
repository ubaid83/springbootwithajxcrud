package com.priticaltest.bean;

import java.io.File;
import java.sql.Date;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration

public class StudentBean {
	private String id;
	private String name;
	private String email;
	private String mobileNo;
	private Date  date;
	private String address;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}



	private String country ;

	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "StudentBean [id=" + id + ", name=" + name + ", email=" + email + ", mobileNo=" + mobileNo + ", date="
				+ date + ", address=" + address + ", country=" + country + "]";
	}
	
	
	

	

}
