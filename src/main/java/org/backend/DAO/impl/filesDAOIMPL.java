package org.backend.DAO.impl;

import java.util.List;

import org.backend.DAO.filesDAO;
import org.backend.Entity.files;
import org.springframework.stereotype.Repository;

@Repository
public class filesDAOIMPL implements filesDAO{

	@Override
	public List<files> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(files f) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(String id, files f) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public files getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
