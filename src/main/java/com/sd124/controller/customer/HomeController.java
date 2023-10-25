package com.sd124.controller.customer;

import com.sd124.model.ProductImages;
import com.sd124.model.ProductVariants;
import com.sd124.model.Products;
import com.sd124.model.Sizes;
import com.sd124.repository.ProductImageRepository;
import com.sd124.repository.ProductRepository;
import com.sd124.repository.ProductVariantRepository;
import com.sd124.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
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

    @GetMapping("/")
    public String home(Model model){
        List<Products> lstPro = productRepo.findAll();
        model.addAttribute("productList", lstPro);
        return "customer/index";
    }

    @GetMapping("/view-product/{id}")
    public String viewProduct(@PathVariable Integer id, Model model, @Param("url") String url) {
        List<Sizes> lstSize = sizeRepo.findAll();
        model.addAttribute("lstSize", lstSize);
//        List<ProductImages> lstImages = productImageRepo.findImageProductByUrl("%" + url + "%");
//        ProductVariants productVariants = productVariantRepo.findById(id).get();
        Products products = productRepo.findById(id).get();
//        model.addAttribute("productVariant", productVariants);
//        model.addAttribute("lstImage", lstImages);
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
