package org.backend.Service;

import java.util.List;

import org.backend.Models.studentBaiTapDTO;

public interface studentBaiTapService {
	List<studentBaiTapDTO> getAll();
	boolean insert(studentBaiTapDTO sbtd);
	boolean update(studentBaiTapDTO sbtd);
	boolean delete(String id);
	studentBaiTapDTO getById(String id);
}
