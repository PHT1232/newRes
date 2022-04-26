package org.backend.DAO.impl;

import java.util.List;

import org.backend.DAO.SinhVienDAO;
import org.backend.Entity.SinhVien;
import org.springframework.stereotype.Repository;

@Repository
public class SinhVienDAOIMPL implements SinhVienDAO{

	@Override
	public List<SinhVien> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(SinhVien sv) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String masv) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(SinhVien sv, String masv) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<SinhVien> getById(String masv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SinhVien getBySinhVienid(String masv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SinhVien getByUserName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SinhVien> getByClassId(String classId) {
		// TODO Auto-generated method stub
		return null;
	}

}
