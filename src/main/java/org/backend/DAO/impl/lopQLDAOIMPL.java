package org.backend.DAO.impl;

import java.util.List;

import org.backend.DAO.lopQLDAO;
import org.backend.Entity.lopQL;
import org.springframework.stereotype.Repository;

@Repository
public class lopQLDAOIMPL implements lopQLDAO{

	@Override
	public List<lopQL> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(lopQL lql) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(lopQL lql, String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public lopQL getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
