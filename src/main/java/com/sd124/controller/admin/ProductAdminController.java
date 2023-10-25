package com.sd124.controller.admin;

import com.sd124.model.Products;
import com.sd124.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class ProductAdminController {
    @Autowired
    private ProductRepository productRepo;

    @GetMapping("")
    public String listProduct(Model model){
        List<Products> lstPro = productRepo.findAll();
        model.addAttribute("productList", lstPro);
        return "admin/product/index";
    }

    @GetMapping("/add")
    public String addProduct(){
        return "admin/product/form";
    }

    @GetMapping("/update/{id}")
    public  String updateProduct(@PathVariable Integer id) {
        return "admin/product/form";
    }
}
