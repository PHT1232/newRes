package org.backend.DAO.impl;

import java.util.List;

import org.backend.DAO.monDAO;
import org.backend.Entity.Mon;
import org.springframework.stereotype.Repository;

@Repository
public class monDAOIMPL implements monDAO{

	@Override
	public List<Mon> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(Mon mn) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Mon mn, String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Mon getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
