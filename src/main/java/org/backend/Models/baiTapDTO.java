package org.backend.Models;

public class baiTapDTO {
	private int id;
	private String name;
	private String username;
	private String deadline;
	private String tenBaiTap;
	private String noiDungBaiTap;
	private String classId;
	private String monhocId;
	
	public baiTapDTO() {
		
	}

	public baiTapDTO(int id, String name, String username, String deadline, String tenBaiTap, String noiDungBaiTap,
			String classId, String monhocId) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.deadline = deadline;
		this.tenBaiTap = tenBaiTap;
		this.noiDungBaiTap = noiDungBaiTap;
		this.classId = classId;
		this.monhocId = monhocId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getTenBaiTap() {
		return tenBaiTap;
	}

	public void setTenBaiTap(String tenBaiTap) {
		this.tenBaiTap = tenBaiTap;
	}

	public String getNoiDungBaiTap() {
		return noiDungBaiTap;
	}

	public void setNoiDungBaiTap(String noiDungBaiTap) {
		this.noiDungBaiTap = noiDungBaiTap;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getMonhocId() {
		return monhocId;
	}

	public void setMonhocId(String monhocId) {
		this.monhocId = monhocId;
	}
	
}
