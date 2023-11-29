package com.sd124.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class HomeAdminController {
    @GetMapping("")
    public String home(){
        return "admin/index";
    }

    @GetMapping("/char")
    public String chart(){
        return "admin/char";
    }
}
