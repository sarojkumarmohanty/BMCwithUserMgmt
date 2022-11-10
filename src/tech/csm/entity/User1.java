package tech.csm.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString(exclude = "createdBy")
@Entity
@Table(name = "tbl_user")
public class User1 implements Serializable {
	
	@Id
	@Column(name = "user_id")
	private String userId;
	
	@Column(name = "user_name")
	private String userName;
	
	private String password;
	
	private String email;
	
	@Column(name = "phone_no")
	private String phoneNo;
	
	@Column(name = "aadhar_no")
	private String aadharNo;
	
	@Column(name = "aadhar_id_path")
	private String aadharIdPath;
	
	@ManyToOne
	@JoinColumn(name = "role_id")
	private Role role;
	
	private Integer otp;
	
	@Column(name = "created_on")
	private Date createdOn;
	
	@ManyToOne
	@JoinColumn(name = "created_by", referencedColumnName = "user_id")
	private User1 createdBy;
	
	@Column(name= "updated_on")
	private Date updatedOn;
	
	@Column(name = "is_active")
	private String isActive;
	
	private String status;
}
