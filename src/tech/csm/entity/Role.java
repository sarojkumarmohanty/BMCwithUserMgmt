package tech.csm.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@Entity
@Table(name="tbl_role")
public class Role implements Serializable {
	@Id
	@Column(name = "role_id")
	private Integer roleId;
	@Column(name = "role_name")
	private String roleName;
}
