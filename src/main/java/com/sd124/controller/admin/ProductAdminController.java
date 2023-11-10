package com.sd124.controller.admin;

import com.sd124.model.Categories;
import com.sd124.model.Products;
import com.sd124.repository.CategoryRepository;
import com.sd124.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class ProductAdminController {
    @Autowired
    private ProductRepository productRepo;
    @Autowired
    private CategoryRepository cateRepo;

    @GetMapping("")
    public String listProduct(Model model){
        List<Products> lstPro = productRepo.findAll();
        model.addAttribute("lstPro", lstPro);
        return "admin/product/index";
    }

    @GetMapping("/add")
    public String addProduct(Model model, @ModelAttribute("product") Products products){
        List<Categories> lstCate = cateRepo.findAll();
        model.addAttribute("listCate", lstCate);
        return "admin/product/form";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("product") Products products){
        productRepo.save(products);
        return "redirect:/admin/product";
    }

    @GetMapping("/edit/{id}")
    public  String editPro(@PathVariable Integer id, Model model,@ModelAttribute("product") Products products) {
        products = productRepo.findById(id).get();
        List<Categories> lstCate = cateRepo.findAll();

        model.addAttribute("lstCate", lstCate);
//        model.addAttribute("product", products);
        return "admin/product/edit";
    }

    @PostMapping("update/{id}")
    public String updatePro(@PathVariable Integer id,@ModelAttribute("product") Products products){
        productRepo.save(products);
        return "redirect:/admin/product";
    }

    @GetMapping("/delete/{id}")
    public String deletePro(@PathVariable Integer id){
        productRepo.deleteById(id);
        return "redirect:/admin/product";
    }
}
