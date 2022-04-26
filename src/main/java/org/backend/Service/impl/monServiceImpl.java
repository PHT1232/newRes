package org.backend.Service.impl;

import java.util.List;

import org.backend.Models.MonDTO;
import org.backend.Service.monService;
import org.springframework.stereotype.Service;

@Service
public class monServiceImpl implements monService{

	@Override
	public List<MonDTO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(MonDTO mdt) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(MonDTO mdt, String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MonDTO getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
