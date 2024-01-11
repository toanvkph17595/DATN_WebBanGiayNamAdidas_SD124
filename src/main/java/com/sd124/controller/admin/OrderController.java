package com.sd124.controller.admin;

import com.sd124.dto.District;
import com.sd124.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/order")
public class OrderController {
   @Autowired
    LocationService locationService;

    @GetMapping("")
    public  String listOrder(){
        return "admin/order/index";
    }

        @GetMapping("/detail/{id}")
    public  String listDataOrder(@PathVariable Integer id, Model model){
        model.addAttribute("lstProvince", locationService.getProvinces());
        // TODO : Tinh tong khoi luong don hang
        int weight = 1000;
        model.addAttribute("from_district_id", 1482); // Bac Tu Liem
        model.addAttribute("weight", weight);
        return "admin/order/detail";
    }
}


