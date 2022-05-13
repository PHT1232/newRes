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
    public String Class(ModelMap map, @RequestParam("loptinchi") String loptinchi) {
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
            for (loptinchiDTO ltd : classesService.getAll()) {
                if (ltd.getId().equals(loptinchi)) {
                    if (ltd.get().equals(acd.getTeacherId())) {
                        monhoc = ltd.getIdMon();
                        for (baiTapDTO btd : bts.getAll()) {
                            if (btd.getLoptinchi().equals(ltd.getId())) {
//                                System.out.println("sai username");
                                btdt.add(btd);
                            }
                        }
                        MonDTO sdto = subjectsService.getById(ltd.getIdMon());
//                    loptinchiDTO cdt = classesService.getById(ltd.getId());
                        sdtl.add(sdto);
//                    cdtol.add(cdt);
                        cdtol.add(ltd);
                    } else {
                        if (acd != null) {
                            map.addAttribute("message", "Hi " + acd.getUsername()
                                    + "<br> You do not have permission to access this page!");
                        } else {
                            map.addAttribute("msg",
                                    "You do not have permission to access this page!");
                        }
                        return "/403page";
                    }
                }
                map.addAttribute("urlToClasse", "Student");
                map.addAttribute("name", studentService.getById(acd.getStudentId()).getTenSV());
            }
//        map.addAttribute("subjectList", sdtl);
//        map.addAttribute("classList", cdtol);
        }
        map.addAttribute("subjectList", sdtl);
        map.addAttribute("classList", cdtol);
        map.addAttribute("baiTapLists", btdt);
        map.addAttribute("username", username);
        map.addAttribute("classId", loptinchi);
        map.addAttribute("monhoc", monhoc);
        return "baiTap";
    }
    @RequestMapping("/hienThiSinhVien")
    public String hienThiSV(ModelMap map, @RequestParam("id") String id, @RequestParam("monhoc") String monhoc) {
        List<StudentDTO> stl = studentService.getByClassId(id);
        map.addAttribute("baitapnop", stl);
        map.addAttribute("classId", id);
        map.addAttribute("monhoc", monhoc);
        map.addAttribute("urlToClasse", "Student");
        return "hienThiSinhVien";
    }

    @RequestMapping(value = "diem")
    public String hienThiDiem(ModelMap map, @RequestParam("id") int id) {
        List<chamDiemDTO> chamDiemDTOS = cds.getListByBaiTapId(id);
        List<StudentDTO> studentDTOS = new ArrayList<>();
        for (chamDiemDTO cdt : chamDiemDTOS) {
            StudentDTO stdo = studentService.getByStudentId(cdt.getStudentId());
            studentDTOS.add(stdo);
        }
        map.addAttribute("diems", chamDiemDTOS);
        map.addAttribute("studentdtos", studentDTOS);
        return "hienThiDiem";
    }
}