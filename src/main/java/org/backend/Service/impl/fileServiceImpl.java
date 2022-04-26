package org.backend.Service.impl;

import java.util.List;

import org.backend.Models.filesDTO;
import org.backend.Service.fileService;
import org.springframework.stereotype.Service;

@Service
public class fileServiceImpl implements fileService{

	@Override
	public List<filesDTO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(filesDTO ftd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(filesDTO ftd, String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public filesDTO getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
