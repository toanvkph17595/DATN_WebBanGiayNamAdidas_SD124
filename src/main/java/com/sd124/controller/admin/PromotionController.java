package com.sd124.controller.admin;

import com.sd124.repository.PromotionDetaiRepository;
import com.sd124.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class PromotionController {

    @Autowired
    PromotionRepository promotionRepository;

    @Autowired
    PromotionDetaiRepository promotionDetaiRepository;

    @GetMapping("/list-promotions")
    public String listPro(Model model){
        model.addAttribute("list",promotionRepository.findAll());
        return "admin/promotion/promotion_list";
    }
}
