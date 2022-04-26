package org.backend.DAO.impl;

import java.util.List;

import org.backend.DAO.giangVienDAO;
import org.backend.Entity.giangVien;
import org.springframework.stereotype.Repository;

@Repository
public class giangVienDAOIMPL implements giangVienDAO{

	@Override
	public List<giangVien> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(giangVien gv) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(String mgv, giangVien gv) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String mgv) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<giangVien> getById(String mgv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public giangVien getByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
