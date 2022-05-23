package org.backend.DAO;

import org.backend.Entity.baiTap;
import org.backend.Entity.studentBaiTap;

public interface getDAOVoVan {
    baiTap getByNotification(String idlop, String username);
    studentBaiTap getByUserNameAndLopTinChiSBT(String username, int idbaitap);
}
