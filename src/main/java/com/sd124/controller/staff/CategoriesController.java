package com.sd124.controller.staff;

import com.sd124.model.Accounts;
import com.sd124.model.Categories;
import com.sd124.repository.CategoryRepository;
import jakarta.persistence.Id;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/staff/category")
public class CategoriesController {
    @Autowired
    CategoryRepository cateRepo;

    @GetMapping("index")
    public String index(Model model,@RequestParam(name = "page", defaultValue = "0") Integer page,
                        @RequestParam(name = "size", defaultValue = "5") Integer size){
        Pageable pageable = PageRequest.of(page, size);
        Page<Categories> data = cateRepo.findAll(pageable);
        model.addAttribute("data", data);
        return "staff/category/index";
    }

    @GetMapping("edit/{id}")
    public String edit(Model model, @PathVariable("id") Integer id, Categories categories){
        categories = cateRepo.getOne(id);
        model.addAttribute("category", categories);
        return "staff/category/edit";
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Integer id, Categories categories){
        cateRepo.save(categories);
        return "redirect:/staff/category/index";
    }
    @GetMapping("/add")
    public String addCategory(@ModelAttribute("category") Categories categories){
        return "admin/category/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("category") Categories categories){
        cateRepo.save(categories);
        return "redirect:/staff/category/index";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable(name = "id") Integer id, Categories categories){
        categories = cateRepo.getOne(id);
        cateRepo.delete(categories);
        return "redirect:/admin/category/index";
    }
}
