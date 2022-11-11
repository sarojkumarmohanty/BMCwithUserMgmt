package tech.csm.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@Entity
@Table(name="birth_certificate")
public class BirthCertificate implements Serializable {
	@Id
	@Column(name="certificate_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer certificateId;
	
	@Column(name = "child_name")
	private String childName;
	
	@Column(name= "child_dob")
	private Date childDob;
	
	@Column(name= "child_blood_group")
	private String bloodGroup;
	
	@Column(name = "child_weight")
	private Double childWeight;
	
	@Column(name = "child_gender")
	private String childGender;
	
	@Column(name = "hospital_name")
	private String hospitaName;
	
	@Column(name = "hospital_doc_path")
	private String hospitalDoc;
	
	@Column(name = "father_name")
	private String fatherName;
	
	@Column(name = "mother_name")
	private String motherName;
	
	private String address;
	
	@Column(name = "address_proof")
	private String addressProfDoc;
	
	@Column(name = "applied_on")
	private Date appliedOn;
	
	@ManyToOne
	@JoinColumn(name="applied_by", referencedColumnName = "user_id")
	private User1 appliedBy;
	
	@Column(name = "approved_on")
	private Date approvedOn;
	
	@ManyToOne
	@JoinColumn(name="approved_by", referencedColumnName = "user_id")
	private User1 approvedBy;
	
	@Column(name = "application_status")
	private String appStatus;
	
	
	
	
	
}
