package com.sd124.controller.admin;

import com.sd124.model.Categories;
import com.sd124.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/category")
public class CategoryAdminController {
    @Autowired
    CategoryRepository cateRepo;

    @GetMapping("")
    public String listCategory(Model model){
        List<Categories> lstCate = cateRepo.findAll();
        model.addAttribute("lstCate", lstCate);
        return "admin/category/index";
    }

    @GetMapping("edit/{id}")
    public String edit(Model model, @PathVariable("id") Integer id, Categories categories){
        categories = cateRepo.getOne(id);
        model.addAttribute("category", categories);
        return "admin/category/edit";
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Integer id, Categories categories){
        cateRepo.save(categories);
        return "redirect:/admin/category";
    }
    @GetMapping("/add")
    public String addCategory(@ModelAttribute("category") Categories categories){
        return "admin/category/form";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("category") Categories categories){
        cateRepo.save(categories);
        return "redirect:/admin/category";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id){
        cateRepo.deleteById(id);
        return "redirect:/admin/category";
    }
}
