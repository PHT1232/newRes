package org.backend.DAO.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.backend.DAO.baiTapDAO;
import org.backend.Entity.baiTap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

@Repository
public class baiTapDAOIMPL implements baiTapDAO{

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public List<baiTap> getAll(String id, String monhoc) {
		// TODO Auto-generated method stub
		String sql = "Select * from baiTap where classId = ? and monhocId = ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<baiTap>>() {
			@Override
			public List<baiTap> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<baiTap> ls = new ArrayList();
                while (rs.next()) {
                    baiTap bt = new baiTap();
                    bt.setId(rs.getInt("id"));
                    bt.setName(rs.getString("name"));
                    bt.setUsername(rs.getString("username"));
                    bt.setDeadline(rs.getString("deadline"));
                    bt.setTenBaiTap(rs.getString("tenBaiTap"));
                    bt.setNoiDungBaiTap(rs.getString("noiDungBaiTap"));
                    bt.setClassId(rs.getString("classID"));
                    bt.setMonhocId(rs.getString("monhocID"));
                    ls.add(bt);
                }
                return ls;
			}
		}, id, monhoc);
	}

	@Override
	public boolean insert(baiTap bt) {
		// TODO Auto-generated method stub
		String sql = "Insert into baiTap (`name`, `username`, `deadline`, `tenBaiTap`, `noiDungBaiTap`, `classId`, `monhocId`) values (?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, bt.getName(), bt.getUsername(), bt.getDeadline(), bt.getTenBaiTap(), bt.getNoiDungBaiTap(), bt.getClassId(), bt.getMonhocId()) > 0;
	}

	@Override
	public boolean update(String id, baiTap bt) {
		// TODO Auto-generated method stub
		String sql = "Update baiTap set name = ?, username = ?, deadline = ?, tenBaiTap = ?, noiDungBaiTap = ?, classId = ?, monhocId = ? where id = ?";
		return jdbcTemplate.update(sql, bt.getName(), bt.getUsername(), bt.getDeadline(), bt.getTenBaiTap(), bt.getNoiDungBaiTap(), bt.getClassId(), bt.getMonhocId(), id) > 0;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public baiTap getById(String id) {
		// TODO Auto-generated method stub
		String sql = "Select * from baiTap where id = ?";
		return jdbcTemplate.query(sql, new ResultSetExtractor<baiTap>() {
			@Override
			public baiTap extractData(ResultSet rs) throws SQLException, DataAccessException {
                baiTap bt = new baiTap();
                while (rs.next()) {
                    bt.setUsername(rs.getString("username"));
                    bt.setDeadline(rs.getString("deadline"));
                    bt.setTenBaiTap(rs.getString("tenBaiTap"));
                    bt.setNoiDungBaiTap(rs.getString("noiDungBaiTap"));
                    bt.setClassId(rs.getString("classID"));
                    bt.setMonhocId(rs.getString("monhocID"));
                }
                return bt;
			}
		}, id);
	}

}
