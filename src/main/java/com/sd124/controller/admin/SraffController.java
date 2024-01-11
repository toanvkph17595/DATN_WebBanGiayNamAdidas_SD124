package com.sd124.controller.admin;

import com.sd124.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
//@RequestMapping("/admin")
public class SraffController {

    @Autowired
    OrderDetailRepository orderDetailRepository;

   @GetMapping("/report-by-day")
    public String getReportByDay(){
        return "admin/report/by-day";
    }

    @PostMapping("/report-by-day")
    public String reportByDay(
            @RequestParam(defaultValue="1970-01-01 00:00:00") String fromDate,
            @RequestParam(defaultValue="2100-01-01 00:00:00") String toDate,
            Model model
    ) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d1 = sdf.parse(fromDate + " 00:00:00");
        Date d2 = sdf.parse(toDate + " 23:59:59");
        List<Object[]> data = orderDetailRepository.reportByDay(d1, d2);
        model.addAttribute("data", data);
        return "admin/report/by-day";

    }
    @GetMapping("/report-by-product")
    public String getReportByProduct(){
        return "admin/report/by-product";
    }

    @PostMapping("/report-by-product")
    public String reportByProduct(
            @RequestParam(defaultValue="1970-01-01 00:00:00") String fromDate,
            @RequestParam(defaultValue="2100-01-01 00:00:00") String toDate,
            Model model
    ) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d1 = sdf.parse(fromDate + " 00:00:00");
        Date d2 = sdf.parse(toDate + " 23:59:59");
        List<Object[]> data = orderDetailRepository.reportByProduct(d1, d2);
        model.addAttribute("data", data);
        return "admin/report/by-product";

    }
}
