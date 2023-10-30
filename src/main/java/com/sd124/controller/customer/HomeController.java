package com.sd124.controller.customer;

import com.sd124.model.*;
import com.sd124.repository.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private ProductRepository productRepo;
    @Autowired
    private ProductVariantRepository productVariantRepo;
    @Autowired
    private ProductImageRepository productImageRepo;
    @Autowired
    private SizeRepository sizeRepo;
    @Autowired
    private CategoryRepository cateRepo;
    @Autowired
    private ColorRepository colorRepo;

    @GetMapping({"/", "/home"})
    public String home(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
                       @RequestParam(name = "size", defaultValue = "6") Integer size){
        Pageable pageable = PageRequest.of(page, size);
        Page<Products> data = productRepo.findAll(pageable);
        List<Categories> lstCate = cateRepo.findAll();
        model.addAttribute("data", data);
        model.addAttribute("lstCate", lstCate);
        return "customer/index";
    }

    @GetMapping("/filter/{id}")
    public String filter(@PathVariable Integer id, Model model, Categories categories){
        List<Categories> lstCate = cateRepo.findAll();
        categories = cateRepo.findById(id).get();
        List<Products> lstPro = categories.getProducts();
        model.addAttribute("lstCate", lstCate);
        model.addAttribute("lstPro", lstPro);
        return "customer/filter";
    }

    @GetMapping("/view-product/{id}")
    public String viewProduct(@PathVariable Integer id, Model model) {
        Products products = productRepo.findById(id).get();
        List<ProductImages> lstImages = productImageRepo.findAll();
        List<Sizes> lstSize = sizeRepo.findAll();


        model.addAttribute("lstSize", lstSize);
        model.addAttribute("lstImage", lstImages);
        model.addAttribute("product", products);

        return "customer/view_product";
    }

    @GetMapping("/cart")
    public String cart(){
        return "customer/cart";
    }

    @GetMapping("/confirmation")
    public String confirmation(){
        return "customer/confirmation";
    }

}
