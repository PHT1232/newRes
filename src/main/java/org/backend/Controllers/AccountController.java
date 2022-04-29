package org.backend.Controllers;

import org.backend.Entity.Account;
import org.backend.Models.*;
import org.backend.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AccountController {
	@Autowired
    AccountService accountService;

    @Autowired
    monService subjectsService;

    @Autowired
    giangVienService teacherService;

    @Autowired
    dangHocService learningService;

    @Autowired
    loptinchiService lopHocService;

    @Autowired
    SinhVienService studentService;

    @RequestMapping(value = "/login")
    public String login(@RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout,
                        ModelMap model) throws ServletException, IOException {
        String errorMessge = null;
        if (error != null) {
            errorMessge = "Username or Password is incorrect !!";
        }
        if (logout != null) {
            errorMessge = "You have been successfully logged out !!";
        }
        model.addAttribute("errorMessage", errorMessge);
        return "signIn";
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Account account) {

        if (account != null) {
            model.addAttribute("message", "Hi " + account.getUsername()
                    + "<br> You do not have permission to access this page!");
        } else {
            model.addAttribute("msg",
                    "You do not have permission to access this page!");
        }
        return "403page";
    }

    @RequestMapping("/error")
    public String error() {
        return "error";
    }

    @RequestMapping("/index")
    public String index(ModelMap map) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        AccountDTO acd = accountService.getByUserName(username);
        SinhVienDTO std = studentService.getById(acd.getStudentId());
        List<MonDTO> sdtl = new ArrayList<>();
        List<loptinchiDTO> cdtol = new ArrayList<>();
        if (acd.getStudentId() == null) {
        	List<dangHocDTO> ltd = learningService.getAll();
            for (dangHocDTO ld : ltd) {
                MonDTO sdto = subjectsService.getById(ld.getIdMon());
                loptinchiDTO cdt = lopHocService.getById(ld.getClassId());
                sdtl.add(sdto);
                cdtol.add(cdt);
            }
            map.addAttribute("urlToClasse", "Teacher");
            map.addAttribute("name", teacherService.getById(acd.getTeacherId()).getTenGV());
        } else {
            List<dangHocDTO> ltd = learningService.getByClassId(std.getClassId());
            for (dangHocDTO ld : ltd) {
                MonDTO sdto = subjectsService.getBySingleId(ld.getIdMon());
                loptinchiDTO cdt = lopHocService.getBySingleId(ld.getClassId());
                sdtl.add(sdto);
                cdtol.add(cdt);
            }
            map.addAttribute("urlToClasse", "Student");
            map.addAttribute("name", studentService.getByUser(username).getName());
            map.addAttribute("classStudent", studentService.getByUser(username).getClassId());
        }
        map.addAttribute("subjectList", sdtl);
        map.addAttribute("classList", cdtol);
        map.addAttribute("username", username);
        return "index";
    }
}
