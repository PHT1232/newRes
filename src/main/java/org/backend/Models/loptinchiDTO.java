package org.backend.Models;

public class loptinchiDTO {
	private int id;
	private String TenLopTC;
	private int idKhoa;
	private int idKhoaHoc;
	private int idMon;
	private String MaGV;
	private int status;
	private String created_by;
	private String created_at;
	private String updated_at;
	
	public loptinchiDTO() {
		
	}

	public loptinchiDTO(int id, String tenLopTC, int idKhoa, int idKhoaHoc, int idMon, String maGV, int status,
			String created_by, String created_at, String updated_at) {
		super();
		this.id = id;
		TenLopTC = tenLopTC;
		this.idKhoa = idKhoa;
		this.idKhoaHoc = idKhoaHoc;
		this.idMon = idMon;
		MaGV = maGV;
		this.status = status;
		this.created_by = created_by;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenLopTC() {
		return TenLopTC;
	}

	public void setTenLopTC(String tenLopTC) {
		TenLopTC = tenLopTC;
	}

	public int getIdKhoa() {
		return idKhoa;
	}

	public void setIdKhoa(int idKhoa) {
		this.idKhoa = idKhoa;
	}

	public int getIdKhoaHoc() {
		return idKhoaHoc;
	}

	public void setIdKhoaHoc(int idKhoaHoc) {
		this.idKhoaHoc = idKhoaHoc;
	}

	public int getIdMon() {
		return idMon;
	}

	public void setIdMon(int idMon) {
		this.idMon = idMon;
	}

	public String getMaGV() {
		return MaGV;
	}

	public void setMaGV(String maGV) {
		MaGV = maGV;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	
}
