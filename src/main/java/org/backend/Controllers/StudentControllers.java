package org.backend.Controllers;

import org.backend.Models.*;
import org.backend.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

@Controller
@RequestMapping("/Student")
public class StudentControllers {
    @Autowired
    baiTapService bts;

    @Autowired
    AccountService accountService;

    @Autowired
    monService subjectsService;

    @Autowired
    giangVienService teacherService;

    @Autowired
    dkTinChiService learningService;

    @Autowired
    loptinchiService classesService;

    @Autowired
    SinhVienService studentService;

    @Autowired
    chamDiemService cds;

    @Autowired
    fileService fs;

    //hàm ko liên quan tới mapping
    public notificationBaiTap getNearestDate(List<notificationBaiTap> notibts, Date currentDate) throws ParseException {
        List<notificationBaiTap> ls = new ArrayList<>();
        long minDiff = -1, currentTime = currentDate.getTime();
        Date minDate = null;
        int id = 0;
        String tenbaitap = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        notificationBaiTap notif = new notificationBaiTap();
        for (notificationBaiTap notibt : notibts) {
            Date date = sdf.parse(notibt.deadline);
            long diff = Math.abs(currentTime - date.getTime());
            if ((minDiff == -1) || (diff < minDiff)) {
                minDiff = diff;
                minDate = date;
                id = notibt.getIdbaiTap();
                tenbaitap = notibt.getTenbaiTap();
            }
        }
        notif.setIdbaiTap(id);
        notif.setTenbaiTap(tenbaitap);
        notif.setDeadline(sdf.format(minDate));
        return notif;
    }

    public class notificationBaiTap {
        int idbaiTap;
        String tenbaiTap;
        String deadline;

        public int getIdbaiTap() {
            return idbaiTap;
        }

        public void setIdbaiTap(int idbaiTap) {
            this.idbaiTap = idbaiTap;
        }

        public String getTenbaiTap() {
            return tenbaiTap;
        }

        public void setTenbaiTap(String tenbaiTap) {
            this.tenbaiTap = tenbaiTap;
        }

        public String getDeadline() {
            return deadline;
        }

        public void setDeadline(String deadline) {
            this.deadline = deadline;
        }
    }

    public List<notificationBaiTap> checkHetHan() throws ParseException {
        List<notificationBaiTap> ls1 = new ArrayList<>();
        List<notificationBaiTap> ls2 = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date deadline;
        Date current = new Date();
        String loptinchi = "";
        for (baiTapDTO bdt : bts.getAll()) {
            notificationBaiTap nbt = new notificationBaiTap();
//            if (bts.getAll().indexOf(bdt) == 1) {
//                loptinchi = bdt.getLoptinchi();
//            }
            System.out.println(bts.getAll().indexOf(bdt));
//            System.out.println("loptinchi" + loptinchi);
//            System.out.println("lopbdt" + bdt.getLoptinchi());
//            if (loptinchi.equals(bdt.getLoptinchi())) {
//                deadline = sdf.parse(bdt.getDeadline());
//                if (current.compareTo(deadline) < 0) {
//                    nbt.setTenbaiTap(bdt.getTenBaiTap());
//                    nbt.setIdbaiTap(bdt.getId());
//                    nbt.setDeadline(bdt.getDeadline());
//                    ls1.add(nbt);
//                }
//            } else {
//                ls2.add(getNearestDate(ls1, current));
//                loptinchi = bdt.getLoptinchi();
//            }
        }
        return ls2;
    }
//    @RequestMapping("/Profile")
//    public String profile(ModelMap map, HttpServletRequest request) throws IOException {
//        request.setCharacterEncoding("UTF-8");
//        String username = SecurityContextHolder.getContext().getAuthentication().getName();
//        map.addAttribute("username", username);
//        String s = "http://localhost:8080/projectAPI_war/getTeacher";
//        URL url = new URL(s);
//
//        Scanner sc = new Scanner(url.openStream(), "UTF-8");
//        String str = new String();
//        while (sc.hasNext()) {
//            str += sc.nextLine();
//        }
//        sc.close();
//        List<TeacherDTO> lsdto = new ArrayList<>();
//        JSONArray jsonArray = new JSONArray(str);
//        for (int i = 0; i < jsonArray.length(); i++) {
//            TeacherDTO tc = new TeacherDTO();
//            JSONObject obj = jsonArray.getJSONObject(i);
//            tc.setId(obj.getString("id"));
//            tc.setName(obj.getString("name"));
//            tc.setAge(obj.getInt("age"));
//            tc.setAddress(obj.getString("address"));
//            tc.setSdt(obj.getString("sdt"));
//            lsdto.add(tc);
//        }
//        for (TeacherDTO tc : ls) {
//            map.addAttribute("name", tc.getName());
//        }
//        map.addAttribute("lsDTO", lsdto);
//        return "teacher-index";
//    }

    @RequestMapping(value = "/baiTap", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public String addBaiTap(@RequestParam(value = "success", required = false) String success, ModelMap map, HttpServletRequest request) throws IOException, ParseException {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        AccountDTO acd = accountService.getByUserName(username);
        int id = Integer.parseInt(request.getParameter("id"));
        baiTapDTO btd = bts.getById(id);
        List<filesDTO> fdt = new ArrayList<>();
        for (filesDTO fd : fs.getAll()) {
            if (fd.getBaiTapId() == id) {
                fdt.add(fd);
            }
        }
        final String new_format = "dd-MM-yyyy";
        final String old_format = "yyyy-MM-dd";
        String old_dateS = btd.getDeadline();
        String newStringDate = "";
        SimpleDateFormat sdf = new SimpleDateFormat(old_format);
        try {
            Date d = sdf.parse(old_dateS);
            sdf.applyPattern(new_format);
            newStringDate = sdf.format(d);
        } catch (Exception dfe) {
            dfe.printStackTrace();
        }
        map.addAttribute("role", "STUDENT");
        map.addAttribute("myFile", fdt);
        map.addAttribute("tenBaiTap", btd.getTenBaiTap());
        map.addAttribute("denHan", newStringDate);
        map.addAttribute("noiDungBaiTap", btd.getNoiDungBaiTap());
        map.addAttribute("id", id);
        map.addAttribute("username", username);
        map.addAttribute("urlToClasse","Student");
        return "BaiTapDisplay";
    }

//    @RequestMapping("/index")
//    public String index(ModelMap map, @RequestParam("monhoc") String xhcn) {
//        String username = SecurityContextHolder.getContext().getAuthentication().getName();
//        AccountDTO acd = accountService.getByUserName(username);
//        StudentDTO std = studentService.getByUser(username);
//        List<SubjectsDTO> sdtl = new ArrayList<>();
//        List<ClassesDTO> cdtol = new ArrayList<>();
//        if (acd.getStudentId() == null) {
//            List<LearningDTO> ltd = learningService.getByTeacherId(acd.getTeacherId());
//            for (LearningDTO ld : ltd) {
//                SubjectsDTO sdto = subjectsService.getBySingleId(ld.getIdMon());
//                ClassesDTO cdt = classesService.getBySingleId(ld.getClassId());
//                sdtl.add(sdto);
//                cdtol.add(cdt);
//            }
//            map.addAttribute("urlToClasse", "Teacher");
//            map.addAttribute("name", teacherService.getByUser(username).getName());
//        } else {
//            List<LearningDTO> ltd = learningService.getByClassId(std.getClassId());
//            for (LearningDTO ld : ltd) {
//                SubjectsDTO sdto = subjectsService.getBySingleId(ld.getIdMon());
//                ClassesDTO cdt = classesService.getBySingleId(ld.getClassId());
//                sdtl.add(sdto);
//                cdtol.add(cdt);
//            }
//            map.addAttribute("urlToClasse", "Student");
//            map.addAttribute("name", studentService.getByUser(username).getName());
//        }
//        map.addAttribute("subjectList", sdtl);
//        map.addAttribute("classList", cdtol);
//        map.addAttribute("monhoc", xhcn);
//        map.addAttribute("username", username);
//        return "student-index";
//    }

    @RequestMapping(value = "/Class")
    public String Class(ModelMap map, @RequestParam("loptinchi") String loptinchi) throws ParseException {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        AccountDTO acd = accountService.getByUserName(username);
        String monhoc = "";
        List<MonDTO> sdtl = new ArrayList<>();
        List<loptinchiDTO> cdtol = new ArrayList<>();
        List<baiTapDTO> btdt = new ArrayList<>();
        if (acd.getStudentId() == null) {
//            List<LearningDTO> ltd = learningService.getByTeacherId(acd.getTeacherId());
//            for (LearningDTO ld : ltd) {
//                SubjectsDTO sdto = subjectsService.getBySingleId(ld.getIdMon());
//                ClassesDTO cdt = classesService.getBySingleId(ld.getClassId());
//                sdtl.add(sdto);
//                cdtol.add(cdt);
//            }
            map.addAttribute("urlToClasse", "Teacher");
            map.addAttribute("name", teacherService.getById(acd.getTeacherId()).getTenGV());
        } else {
            boolean isInClass = false;
            for (dkTinChiDTO dtcd : learningService.getAll()) {
                if (dtcd.getMaSV().equals(acd.getStudentId())) {
                    if (dtcd.getIdLopTC().equals(classesService.getById(loptinchi).getId())) {
                        isInClass = true;
                    }
                }
            }

            if (isInClass == false) {
                return "403page";
            }
//            List<Date> dates = new ArrayList();

            for (loptinchiDTO ltd : classesService.getAll()) {
                if (ltd.getId().equals(loptinchi)) {
                        monhoc = ltd.getIdMon();
                        for (baiTapDTO btd : bts.getAll()) {
                            if (btd.getLoptinchi().equals(ltd.getId())) {
//                                System.out.println("sai username")
//                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//                                Date deadline;
//                                Date current = new Date();
//                                deadline = sdf.parse(btd.getDeadline());
//                                if (current.compareTo(deadline) < 0) {
////                                    System.out.println("current comes after Deadline");
////                                } else if (currentDate.compareTo(deadline) < 0) {
////                                    System.out.println("current date comes before Deadline");
////                                    btdt.add(btd);
////                                } else if (currentDate.compareTo(deadline) == 0) {
////                                    dates.add(deadline);
//                                    notificationBaiTap nt = new notificationBaiTap();
//                                    nt.setTenbaiTap(btd.getTenBaiTap());
//                                    nt.setIdbaiTap(btd.getId());
//                                    nt.setDeadline(btd.getDeadline());
//                                    ntbt.add(nt);
//                                }
                                btdt.add(btd);
                            }
                        }
                        MonDTO sdto = subjectsService.getById(ltd.getIdMon());
//                    loptinchiDTO cdt = classesService.getById(ltd.getId());
                        sdtl.add(sdto);
//                    cdtol.add(cdt);
                        cdtol.add(ltd);
                }
                map.addAttribute("urlToClasse", "Student");
                map.addAttribute("name", studentService.getById(acd.getStudentId()).getTenSV());
            }
//        map.addAttribute("subjectList", sdtl);
//        map.addAttribute("classList", cdtol);
        }
        map.addAttribute("notification", checkHetHan());
        map.addAttribute("subjectList", sdtl);
        map.addAttribute("classList", cdtol);
        map.addAttribute("baiTapLists", btdt);
        map.addAttribute("username", username);
        map.addAttribute("classId", loptinchi);
        map.addAttribute("monhoc", monhoc);
        return "baiTap";
    }

    @RequestMapping("/hienThiSinhVien")
    public String hienThiSV(ModelMap map, @RequestParam("id") String id) {
        List<SinhVienDTO> svds = new ArrayList<>();
        loptinchiDTO ltcd = classesService.getById(id);
        dkTinChiDTO dtcdt = new dkTinChiDTO();
        for (dkTinChiDTO dtcd : learningService.getAll()) {
            if (ltcd.getId().equals(dtcd.getIdLopTC())) {
                dtcdt = dtcd;
            }
        }
        for (SinhVienDTO svdt : studentService.getAll()) {
            if (svdt.getMasv().equals(dtcdt.getMaSV())) {
                svds.add(svdt);
            }
        }
        map.addAttribute("baitapnop", svds);
        map.addAttribute("classId", id);
        map.addAttribute("monhoc", ltcd.getIdMon());
        map.addAttribute("urlToClasse", "Student");
        return "hienThiSinhVien";
    }

    @RequestMapping(value = "diem")
    public String hienThiDiem(ModelMap map, @RequestParam("id") int id) {
        List<chamDiemDTO> chamDiemDTOS = new ArrayList<>();
        for (chamDiemDTO cdto : cds.getAll()) {
            if (cdto.getBaitapid() == id) {
                chamDiemDTOS.add(cdto);
            }
        }
        List<SinhVienDTO> studentDTOS = new ArrayList<>();
        for (chamDiemDTO cdt : chamDiemDTOS) {
            SinhVienDTO stdo = studentService.getById(cdt.getStudentId());
            studentDTOS.add(stdo);
        }
        map.addAttribute("diems", chamDiemDTOS);
        map.addAttribute("studentdtos", studentDTOS);
        return "hienThiDiem";
    }
}