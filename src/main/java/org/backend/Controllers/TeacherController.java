package org.backend.Controllers;

import org.backend.Models.*;
import org.backend.Service.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/Teacher")
public class TeacherController {
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
    baiTapService bts;

    @Autowired
    chamDiemService cds;

    @Autowired
    studentBaiTapService sbts;

    @Autowired
    fileService fs;

    @Autowired
    svLopQLService svqls;
    public class baiTapNop {
        int id;
        String masv;
        String username;
        String name;

        String fileName;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getMasv() {
            return masv;
        }

        public void setMasv(String masv) {
            this.masv = masv;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getFileName() {
            return fileName;
        }

        public void setFileName(String fileName) {
            this.fileName = fileName;
        }
    }

    public class fileNop {
        int id;
        String username;
        String fileName;

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getFileName() {
            return fileName;
        }

        public void setFileName(String fileName) {
            this.fileName = fileName;
        }
    }

    @RequestMapping("/index")
    public String index(ModelMap map, @RequestParam("monhoc") String xhcn) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        AccountDTO acd = accountService.getByUserName(username);
        List<MonDTO> sdtl = new ArrayList<>();
        List<loptinchiDTO> cdtol = new ArrayList<>();
        if (acd.getStudentId() == null) {
            giangVienDTO gvd = teacherService.getById(acd.getTeacherId());
            List<loptinchiDTO> ltcd = classesService.getAll();
            for (loptinchiDTO ltd : ltcd) {
                if (ltd.getMaGV().equals(acd.getTeacherId())) {
                    MonDTO sdto = subjectsService.getById(ltd.getIdMon());
//                    loptinchiDTO cdt = classesService.getById(ltd.getId());
                    sdtl.add(sdto);
//                    cdtol.add(cdt);
                    cdtol.add(ltd);
                }
            }
            map.addAttribute("urlToClasse", "Teacher");
            map.addAttribute("name", gvd.getTenGV());
        } else {
            SinhVienDTO svd = studentService.getById(acd.getStudentId());
            map.addAttribute("urlToClasse", "Student");
            map.addAttribute("name", svd.getTenSV());
        }
        map.addAttribute("subjectList", sdtl);
        map.addAttribute("classList", cdtol);
        map.addAttribute("monhoc", xhcn);
        map.addAttribute("lopql");
        map.addAttribute("username", username);
        return "teacher-index";
    }

    @RequestMapping(value = "/Profile", method = RequestMethod.GET)
    public String profile(ModelMap map, HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        AccountDTO acd = accountService.getByUserName(username);
        giangVienDTO gvd = teacherService.getById(acd.getTeacherId());
////        String email = jsonObject.getString("username");
        map.addAttribute("url", "Teacher");
//        map.addAttribute("updateContext", requestContext + "/updateTeacherProfile");
        map.addAttribute("username", username);
        map.addAttribute("lsDTO", gvd);
        return "user_profile";
    }
//
////    @RequestMapping(value = "/Update", method = RequestMethod.POST)
////    public String update(ModelMap map, HttpServletRequest request, @RequestParam("name") String name, @RequestParam("age") int age, @RequestParam("phone") String phone, @RequestParam("address") String address) throws IOException{
////        String id = (String) session.getAttribute("id");
////        String requestContext = request.getContextPath();
////        String requestServerName = request.getServerName();
////        int requestServerPort = request.getServerPort();
////        String s = "http://" + requestServerName + ":" + requestServerPort + requestContext + "/update";
////        HttpClient httpClient = HttpClients.createDefault();
////        HttpPost httpPost = new HttpPost(s);
////        List<NameValuePair> params = new ArrayList<NameValuePair>(2);
////        params.add(new BasicNameValuePair("name", name));
////        params.add(new BasicNameValuePair("id", id));
////        params.add(new BasicNameValuePair("address", address));
////        params.add(new BasicNameValuePair("sdt", phone));
////        httpPost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
////        try (CloseableHttpClient httpCl = HttpClients.createDefault();
////             CloseableHttpResponse response = httpCl.execute(httpPost)) {
////
////            System.out.println(EntityUtils.toString(response.getEntity()));
////        }
////        return "login";
////    }

    @RequestMapping(value = "/addBaiTap", method = RequestMethod.GET)
    public String baiTap(@RequestParam(value = "success", required = false) String success, HttpServletRequest request, ModelMap map, @RequestParam(value = "className", required = false) String className, @RequestParam(value = "classID", required = false) String classID) throws IOException {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        List<MonDTO> sdtl = new ArrayList<>();
        List<loptinchiDTO> cdtol = new ArrayList<>();
        AccountDTO acd = accountService.getByUserName(username);
        List<loptinchiDTO> ltd = classesService.getAll();
        for (loptinchiDTO ld : ltd) {
            if (ld.getMaGV().equals(acd.getTeacherId())) {
                MonDTO sdto = subjectsService.getById(ld.getIdMon());
//                    loptinchiDTO cdt = classesService.getById(ltd.getId());
                sdtl.add(sdto);
//                    cdtol.add(cdt);
                cdtol.add(ld);
            }
        }
        map.addAttribute("classesDT", cdtol);
        map.addAttribute("subjectsDT", sdtl);
        map.addAttribute("username", username);
        if (success != null) {
            map.addAttribute("success", "Yes");
        }
        return "add-baiTap";
    }

    @RequestMapping(value = "/chamDiem")
    public String chamDiem(@RequestParam(value = "success", required = false) String success, ModelMap map, HttpServletRequest request, @RequestParam(value = "id", required = false) int id) throws IOException {
        List<studentBaiTapDTO> stbtd = sbts.getByBaiTapId(id);
        List<filesDTO> fileNops = fs.getAll();
        List<baiTapNop> fileNops1 = new ArrayList<>();
        int i = 0;
        for (studentBaiTapDTO stbt : stbtd) {
            baiTapNop fn = new baiTapNop();
            for (filesDTO flsdt : fileNops) {
                if (stbt.getBaiTapId() == flsdt.getBaiTapId()) {
                    AccountDTO acd = accountService.getByUserName(stbt.getUsername());
                    SinhVienDTO svd = studentService.getById(acd.getTeacherId());
                    fn.setId(i);
                    fn.setUsername(stbt.getUsername());
                    fn.setName(svd.getTenSV());
                    fn.setMasv(svd.getMasv());
                    fn.setFileName(flsdt.getFilename());
                    fileNops1.add(fn);
                }
            }
            i += 1;
        }
        if (success != null) {
            map.addAttribute("success", "Yes");
        }
        map.addAttribute("baiTapid", id);
//        map.addAttribute("filenop", fileNops1);
        map.addAttribute("baitapnop", fileNops1);
        map.addAttribute("urlToClasse", "Teacher");
        return "chamDiem";
    }
//
    @RequestMapping(value = "/Class")
    public String Class(ModelMap map, @RequestParam("lopql") String lopql, @RequestParam("loptinchi") String loptinchi) {
//        String username = SecurityContextHolder.getContext().getAuthentication().getName();
//        AccountDTO acd = accountService.getByUserName(username);
//
//////        List<SubjectsDTO> sdtl = new ArrayList<>();
//////        List<ClassesDTO> cdtol = new ArrayList<>();
//        if (acd.getStudentId() == null) {
////            List<LearningDTO> ltd = learningService.getByTeacherId(acd.getTeacherId());
////            for (LearningDTO ld : ltd) {
////                SubjectsDTO sdto = subjectsService.getBySingleId(ld.getIdMon());
////                ClassesDTO cdt = classesService.getBySingleId(ld.getClassId());
////                sdtl.add(sdto);
////                cdtol.add(cdt);
////            }
//            map.addAttribute("urlToClasse", "Teacher");
//            map.addAttribute("name", teacherService.getByUser(username).getName());
//        } else {
//            map.addAttribute("urlToClasse", "Student");
//            map.addAttribute("name", studentService.getByUser(username).getName());
//        }
//        map.addAttribute("subjectList", sdtl);
//        map.addAttribute("classList", cdtol);
//        map.addAttribute("baiTapLists", btd);
//        map.addAttribute("username", username);
//        map.addAttribute("classId", id);
//        map.addAttribute("monhoc", xhcn);
        return "baiTap";
    }

    @RequestMapping("/hienThiSinhVien")
    public String hienThiSV(ModelMap map, @RequestParam("id") String id, @RequestParam("monhoc") String monhoc) {
        List<SinhVienDTO> stl = new ArrayList<>();
        for (dkTinChiDTO dtcd : learningService.getAll()) {
            if (dtcd.getIdLopTC().equals(id)) {
                stl.add(studentService.getById(dtcd.getMaSV()));
            }
        }
        map.addAttribute("baitapnop", stl);
        map.addAttribute("classId", id);
        map.addAttribute("monhoc", monhoc);
        map.addAttribute("urlToClasse", "Teacher");
        return "hienThiSinhVien";
    }

    @RequestMapping(value = "/baiTap", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public String addBaiTap(ModelMap map, HttpServletRequest request) throws IOException, ParseException {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        int id = Integer.parseInt(request.getParameter("id"));
        String requestContext = request.getContextPath();
        String requestServerName = request.getServerName();
        int requestServerPort = request.getServerPort();
        String s = "http://" + requestServerName + ":" + requestServerPort + requestContext + "/getBaiTap?id=" + id;
        URL url;
        Scanner sc;
        String str;
        url = new URL(s);

        sc = new Scanner(url.openStream(), "UTF-8");
        str = new String();
        while (sc.hasNext()) {
            str += sc.nextLine();
        }
        sc.close();
        JSONArray array = new JSONArray(str);
        final String new_format = "dd-MM-yyyy";
        final String old_format = "yyyy-MM-dd";
        List<String> filename = new ArrayList<>();
        for (int i = 1; i < array.length(); i++) {
            JSONObject obj2 = array.getJSONObject(i);
            filename.add(obj2.getString("filename"));
        }
        JSONObject obj = array.getJSONObject(0);
        String old_dateS = obj.getString("deadline");
        SimpleDateFormat sdf = new SimpleDateFormat(old_format);
        Date d = sdf.parse(old_dateS);
        sdf.applyPattern(new_format);
        String newStringDate = sdf.format(d);
        map.addAttribute("urlToClasse", "Teacher");
        map.addAttribute("myFile", filename);
        map.addAttribute("tenBaiTap", obj.getString("tenBaiTap"));
        map.addAttribute("denHan", newStringDate);
        map.addAttribute("noiDungBaiTap", obj.getString("noiDungBaiTap"));
        map.addAttribute("id", id);
        map.addAttribute("username", username);
        return "BaiTapDisplay";
    }
//
    @RequestMapping(value = "diem")
    public String hienThiDiem(ModelMap map, @RequestParam("id") int id) {
        List<SinhVienDTO> studentDTOS = new ArrayList<>();
        List<chamDiemDTO> chamDiemDTOS = new ArrayList<>();
        for (chamDiemDTO cddt : cds.getAll()) {
            if (cddt.getBaitapid() == id) {
                studentDTOS.add(studentService.getById(cddt.getStudentId()));
                chamDiemDTOS.add(cds.getById(cddt.getId()));
            }
        }

        map.addAttribute("baiTapid", id);
        map.addAttribute("urlToClasse", "Teacher");
        map.addAttribute("diems", chamDiemDTOS);
        map.addAttribute("studentdtos", studentDTOS);
        return "hienThiDiem";
    }
}
