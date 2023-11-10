package com.sd124.controller;

import com.sd124.model.Accounts;
import com.sd124.model.Roles;
import com.sd124.repository.AccountRepository;
import com.sd124.repository.RoleRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


@Controller
public class LoginController {
    @Autowired
    private AccountRepository accRepo;
    @Autowired
    private RoleRepository roleRepo;
    @Autowired
    PasswordEncoder pe;
//    @Autowired
//    private HttpServletRequest request;


    @GetMapping("/login")
    public String getForm(){
        return "login";
    }


    @GetMapping("/sigup")
    public String getSigup(){return "sigup";}

    @PostMapping("/sigup")
    public String sigup(@RequestParam String username,
                        @RequestParam String password,
                        @RequestParam String password2,
                        @RequestParam String fullname,
                        @RequestParam String email,
                        @RequestParam String image,
                        @RequestParam String address,
                        @RequestParam String phone,
                        Model model){
        String message = "";
        String regexEmail = "^(.+)@(\\S+)$";
        if(ObjectUtils.isEmpty(username)){
            message = "Username trống";
        } else if (accRepo.findById(username).isPresent()) {
            message = "Username đã tồn tại";
        } else if (ObjectUtils.isEmpty(address)) {
            message = "Địa chỉ trống";
        } else if (!email.matches(regexEmail)) {
            message = "Email sai định dạng";
        } else if (ObjectUtils.isEmpty(fullname)) {
            message = "Tên trống";
        } else if (password.length() < 6) {
            message = "Mật khẩu phải 6 kí tự trở lên";
        } else if (!password2.equals(password)) {
            message = "Xác nhận mật khẩu không khớp";
        }
        if(!message.isEmpty()){
            model.addAttribute("message", message);
            return "sigup";
        }
        Accounts accounts = new Accounts();
        accounts.setUserName(username);
        accounts.setFullName(fullname);
        accounts.setPassword(pe.encode(password));
        accounts.setEmail(email);
        accounts.setAddress(address);
        accounts.setPhone(phone);
        accounts.setImage(image);
        accRepo.save(accounts);
        model.addAttribute("account", accounts);
        return "redirect:/login_form";
    }

}
