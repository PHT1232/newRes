package org.backend.Models;

public class chamDiemDTO {
	private int id;
	private int diem;
	private int baitapid;
	private String studentId;
	
	public chamDiemDTO() {
		
	}

	public chamDiemDTO(int id, int diem, int baitapid, String studentId) {
		super();
		this.id = id;
		this.diem = diem;
		this.baitapid = baitapid;
		this.studentId = studentId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDiem() {
		return diem;
	}

	public void setDiem(int diem) {
		this.diem = diem;
	}

	public int getBaitapid() {
		return baitapid;
	}

	public void setBaitapid(int baitapid) {
		this.baitapid = baitapid;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	
}
