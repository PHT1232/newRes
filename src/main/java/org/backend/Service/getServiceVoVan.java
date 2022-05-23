package org.backend.Service;

import org.backend.Models.baiTapDTO;
import org.backend.Models.studentBaiTapDTO;

public interface getServiceVoVan {
    baiTapDTO getByNotification(String idlop, String username);
    studentBaiTapDTO getByUserNameAndLopTinChiSBT(String username, int idbaitap);
}
