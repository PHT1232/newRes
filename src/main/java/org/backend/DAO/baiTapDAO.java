package org.backend.DAO;

import java.util.List;

import org.backend.Entity.baiTap;
import org.springframework.stereotype.Repository;

public interface baiTapDAO {
	List<baiTap> getAll(String id, String monhoc);
	boolean insert(baiTap bt);
	boolean update(String id, baiTap bt);
	boolean delete(String id);
	baiTap getById(String id);
}
