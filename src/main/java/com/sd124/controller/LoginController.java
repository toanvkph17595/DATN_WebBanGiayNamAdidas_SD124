package com.sd124.controller;

import com.sd124.model.Accounts;
import com.sd124.repository.AccountRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    AccountRepository accRepo;

    @GetMapping("/login_form")
    public String getForm(){
        return "login";
    }

//    @PostMapping("/login")
//    public String login(@RequestParam("email") String username, @RequestParam("password") String password){
//        Accounts acc = accRepo.findById(username).get();
//        HttpSession session = request.getSession();
//
//        int check = 2;
//        if(acc != null){
//            session.setAttribute("user", acc);
//
//        }
//        return "redirect:/login";
//    }
}
