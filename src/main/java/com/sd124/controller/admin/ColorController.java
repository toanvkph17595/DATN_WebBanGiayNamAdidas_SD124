package com.sd124.controller.admin;

import com.sd124.model.Colors;
import com.sd124.repository.ColorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/color")
public class ColorController {
    @Autowired
    ColorRepository colorRepo;

    @GetMapping("")
    public String home(Model model){
        List<Colors> lstColor = colorRepo.findAll();
        model.addAttribute("lstColor", lstColor);
        return "admin/color/index";
    }

    @GetMapping("/add")
    public String add(Model model, @ModelAttribute("color") Colors colors){
        return "admin/color/form";
    }

    @PostMapping("/create")
    public String create(Model model, @ModelAttribute("color") Colors colors){
        colorRepo.save(colors);
        return "redirect:/admin/color";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Integer id, Model model){
        Colors colors = colorRepo.findById(id).get();
        model.addAttribute("color", colors);
        return "admin/color/edit";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Integer id, Colors colors){
        colorRepo.save(colors);
        return "redirect:/admin/color";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id){
        colorRepo.deleteById(id);
        return "redirect:/admin/color";
    }
}
