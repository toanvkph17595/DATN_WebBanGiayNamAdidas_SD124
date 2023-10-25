package com.sd124.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/order")
public class OrderController {

    @GetMapping("")
    public  String listOrder(){
        return "admin/order/index";
    }

    @GetMapping("/detail/{id}")
    public  String viewOrder(@PathVariable Integer id){
        return "admin/order/detail";
    }
}
