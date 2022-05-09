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

    public class baiTapNop {
        int id;
        String masv;
        String username;
        String name;

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
    }

    public class fileNop {
        int id;
        String username;
        String[] fileName;

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

        public String[] getFileName() {
            return fileName;
        }

        public void setFileName(String[] fileName) {
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
            List<dkTinChiDTO> ltd = learningService.getByTeacherIdAndMon(acd.getTeacherId(), xhcn);
            for (LearningDTO ld : ltd) {
                SubjectsDTO sdto = subjectsService.getBySingleId(ld.getIdMon());
                ClassesDTO cdt = classesService.getBySingleId(ld.getClassId());
                sdtl.add(sdto);
                cdtol.add(cdt);
            }
            map.addAttribute("urlToClasse", "Teacher");
            map.addAttribute("name", teacherService.getByUser(username).getName());
        } else {
            map.addAttribute("urlToClasse", "Student");
            map.addAttribute("name", studentService.getByUser(username).getName());
        }
        map.addAttribute("subjectList", sdtl);
        map.addAttribute("classList", cdtol);
        map.addAttribute("monhoc", xhcn);
        map.addAttribute("username", username);
        return "teacher-index";
    }

    @RequestMapping(value = "/Profile", method = RequestMethod.GET)
    public String profile(ModelMap map, HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        String requestContext = request.getContextPath();
        String requestServerName = request.getServerName();
        int requestServerPort = request.getServerPort();
        String s = "http://" + requestServerName + ":" + requestServerPort + requestContext + "/getTeacherById?username=" + username;
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
        List<TeacherDTO> lsdto = new ArrayList<>();
        JSONArray jsonArray = new JSONArray(str);
        for (int i = 0; i < jsonArray.length(); i++) {
            TeacherDTO tc = new TeacherDTO();
            JSONObject obj = jsonArray.getJSONObject(i);
            tc.setId(obj.getString("id"));
            tc.setName(obj.getString("name"));
            map.addAttribute("name", obj.getString("name"));
            tc.setAge(obj.getInt("age"));
            tc.setAddress(obj.getString("address"));
            tc.setSdt(obj.getString("sdt"));
            lsdto.add(tc);
        }
//        String email = jsonObject.getString("username");
        map.addAttribute("url", "Teacher");
        map.addAttribute("updateContext", requestContext + "/updateTeacherProfile");
        map.addAttribute("username", username);
        map.addAttribute("lsDTO", lsdto);
        return "user_profile";
    }

//    @RequestMapping(value = "/Update", method = RequestMethod.POST)
//    public String update(ModelMap map, HttpServletRequest request, @RequestParam("name") String name, @RequestParam("age") int age, @RequestParam("phone") String phone, @RequestParam("address") String address) throws IOException{
//        String id = (String) session.getAttribute("id");
//        String requestContext = request.getContextPath();
//        String requestServerName = request.getServerName();
//        int requestServerPort = request.getServerPort();
//        String s = "http://" + requestServerName + ":" + requestServerPort + requestContext + "/update";
//        HttpClient httpClient = HttpClients.createDefault();
//        HttpPost httpPost = new HttpPost(s);
//        List<NameValuePair> params = new ArrayList<NameValuePair>(2);
//        params.add(new BasicNameValuePair("name", name));
//        params.add(new BasicNameValuePair("id", id));
//        params.add(new BasicNameValuePair("address", address));
//        params.add(new BasicNameValuePair("sdt", phone));
//        httpPost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
//        try (CloseableHttpClient httpCl = HttpClients.createDefault();
//             CloseableHttpResponse response = httpCl.execute(httpPost)) {
//
//            System.out.println(EntityUtils.toString(response.getEntity()));
//        }
//        return "login";
//    }

    @RequestMapping(value = "/addBaiTap", method = RequestMethod.GET)
    public String baiTap(@RequestParam(value = "success", required = false) String success, HttpServletRequest request, ModelMap map, @RequestParam(value = "className", required = false) String className, @RequestParam(value = "classID", required = false) String classID) throws IOException {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        String requestContext = request.getContextPath();
        String requestServerName = request.getServerName();
        int requestServerPort = request.getServerPort();
        String s = "http://" + requestServerName + ":" + requestServerPort + requestContext + "/getTeacherById?username=" + username;
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
        JSONArray jsonArray = new JSONArray(str);
        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject obj = jsonArray.getJSONObject(i);
            map.addAttribute("name", obj.getString("name"));
        }
        List<SubjectsDTO> sdtl = new ArrayList<>();
        List<ClassesDTO> cdtol = new ArrayList<>();
        AccountDTO acd = accountService.getByUserName(username);
        List<LearningDTO> ltd = learningService.getByTeacherId(acd.getTeacherId());
        for (LearningDTO ld : ltd) {
            SubjectsDTO sdto = subjectsService.getBySingleId(ld.getIdMon());
            ClassesDTO cdt = classesService.getBySingleId(ld.getClassId());
            sdtl.add(sdto);
            cdtol.add(cdt);
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
        String requestContext = request.getContextPath();
        String requestServerName = request.getServerName();
        int requestServerPort = request.getServerPort();
        String s = "http://" + requestServerName + ":" + requestServerPort + requestContext + "/getBaiTapNop?id=" + id;
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
        JSONArray jsonArray = new JSONArray(str);
        List<String> username = new ArrayList<>();
        int[] idarr = new int[jsonArray.length()];
        List<fileNop> fileNops = new ArrayList<>();
        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject obj = jsonArray.getJSONObject(i);
            fileNop fn = new fileNop();
            username.add(obj.getString("username"));
            idarr[i] = obj.getInt("id");
            fn.username = obj.getString("username");
            fn.id = obj.getInt("id");
            fileNops.add(fn);
        }
        for (int i = 0; i < idarr.length; i++) {
            String s1 = "http://" + requestServerName + ":" + requestServerPort + requestContext + "/getFileNop?id=" + idarr[i];
            url = new URL(s1);

            sc = new Scanner(url.openStream(), "UTF-8");
            str = new String();
            while (sc.hasNext()) {
                str += sc.nextLine();
            }
            sc.close();
            JSONArray jsonArray2 = new JSONArray(str);
//            ListIterator<fileNop> lsi = fileNops.listIterator();
//            List<fileNop> list = new ArrayList<>();
            fileNop fnn = new fileNop();
            fnn.fileName = new String[jsonArray2.length()];
            for (int i1 = 0; i1 < jsonArray2.length(); i1++) {
                JSONObject obj = jsonArray2.getJSONObject(i1);
                for (fileNop fn : fileNops) {
                    if (fn.id == obj.getInt("nopBaiTapId")) {
                        fnn.id = fn.id;
                        fnn.username = fn.username;
                        fnn.fileName[i1] = obj.getString("filename");
                    }
                }
            }
            fileNops.set(i, fnn);
        }
        List<baiTapNop> btnl = new ArrayList<>();
        for (int i = 0; i < username.size(); i++) {
            String s2 = "http://" + requestServerName + ":" + requestServerPort + requestContext + "/findStudentByUsername?username=" + username.get(i);
            url = new URL(s2);

            sc = new Scanner(url.openStream(), "UTF-8");
            str = new String();
            while (sc.hasNext()) {
                str += sc.nextLine();
            }
            sc.close();
            JSONObject obj = new JSONObject(str);
            baiTapNop btn = new baiTapNop();
            btn.masv = obj.getString("id");
            btn.name = obj.getString("name");
            btn.username = username.get(i);
            btnl.add(btn);
        }
        if (success != null) {
            map.addAttribute("success", "Yes");
        }
        map.addAttribute("baiTapid", id);
        map.addAttribute("filenop", fileNops);
        map.addAttribute("baitapnop", btnl);
        map.addAttribute("urlToClasse", "Teacher");
        return "chamDiem";
    }

    @RequestMapping(value = "/Class")
    public String Class(ModelMap map, @RequestParam("id") String id, @RequestParam("monhoc") String xhcn) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        AccountDTO acd = accountService.getByUserName(username);
        List<baiTapDTO> btd = bts.getListById(id, xhcn);
//        List<SubjectsDTO> sdtl = new ArrayList<>();
//        List<ClassesDTO> cdtol = new ArrayList<>();
        if (acd.getStudentId() == null) {
//            List<LearningDTO> ltd = learningService.getByTeacherId(acd.getTeacherId());
//            for (LearningDTO ld : ltd) {
//                SubjectsDTO sdto = subjectsService.getBySingleId(ld.getIdMon());
//                ClassesDTO cdt = classesService.getBySingleId(ld.getClassId());
//                sdtl.add(sdto);
//                cdtol.add(cdt);
//            }
            map.addAttribute("urlToClasse", "Teacher");
            map.addAttribute("name", teacherService.getByUser(username).getName());
        } else {
            map.addAttribute("urlToClasse", "Student");
            map.addAttribute("name", studentService.getByUser(username).getName());
        }
//        map.addAttribute("subjectList", sdtl);
//        map.addAttribute("classList", cdtol);
        map.addAttribute("baiTapLists", btd);
        map.addAttribute("username", username);
        map.addAttribute("classId", id);
        map.addAttribute("monhoc", xhcn);
        return "baiTap";
    }

    @RequestMapping("/hienThiSinhVien")
    public String hienThiSV(ModelMap map, @RequestParam("id") String id, @RequestParam("monhoc") String monhoc) {
        List<StudentDTO> stl = studentService.getByClassId(id);
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

    @RequestMapping(value = "diem")
    public String hienThiDiem(ModelMap map, @RequestParam("id") int id) {
        List<chamDiemDTO> chamDiemDTOS = cds.getListByBaiTapId(id);
        List<StudentDTO> studentDTOS = new ArrayList<>();
        for (chamDiemDTO cdt : chamDiemDTOS) {
            System.out.println(cdt.getStudentId());
            StudentDTO stdo = studentService.getByStudentId(cdt.getStudentId());
            System.out.println(stdo.getName());
            studentDTOS.add(stdo);
        }
        map.addAttribute("baiTapid", id);
        map.addAttribute("urlToClasse", "Teacher");
        map.addAttribute("diems", chamDiemDTOS);
        map.addAttribute("studentdtos", studentDTOS);
        return "hienThiDiem";
    }
}
