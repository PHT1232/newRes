package org.backend.DAO;

import java.util.List;

import org.backend.Entity.baiTap;
import org.backend.Entity.studentBaiTap;
import org.springframework.stereotype.Repository;

public interface studentBaiTapDAO {
	List<studentBaiTap> getAll();
	boolean insert(studentBaiTap sbt);
	boolean update(String id, studentBaiTap sbt);
	boolean delete(String id);
	baiTap getById(String id);
}
