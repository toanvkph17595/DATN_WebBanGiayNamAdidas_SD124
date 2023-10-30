package com.sd124.controller.customer;

import com.sd124.model.ProductImages;
import com.sd124.model.ProductVariants;
import com.sd124.model.Products;
import com.sd124.model.Sizes;
import com.sd124.repository.ProductVariantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class ProductVariantController {
    @Autowired
    private ProductVariantRepository productVariantRepo;

//    @GetMapping("/view-product/{id}")
//    public String viewProduct(@PathVariable Integer id, Model model) {
//        ProductVariants productVariants = productVariantRepo.findIdProduct(id);
//        model.addAttribute("productVariant", productVariants);
//
//        return "customer/view_product";
//    }
}
