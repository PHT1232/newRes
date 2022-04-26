package org.backend.DAO.impl;

import java.util.List;

import org.backend.DAO.khoaDAO;
import org.backend.Entity.khoa;
import org.springframework.stereotype.Repository;

@Repository
public class khoaDAOIMPL implements khoaDAO{

	@Override
	public List<khoa> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(khoa kh) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(khoa kh, String mkh) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String mkh) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public khoa getById(String mkh) {
		// TODO Auto-generated method stub
		return null;
	}

}
