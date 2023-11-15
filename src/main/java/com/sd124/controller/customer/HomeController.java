package com.sd124.controller.customer;

import com.sd124.model.*;
import com.sd124.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {
    @Autowired
    private ProductRepository productRepo;
    @Autowired
    private ProductVariantRepository productVariantRepo;
    @Autowired
    private ProductImageRepository productImageRepo;
    @Autowired
    private AccountRepository accRepo;
    @Autowired
    private CategoryRepository cateRepo;
    @Autowired
    private ColorRepository colorRepo;
    @Autowired
    private FavoriteProductRepository favoriteProductRepo;

    @GetMapping ("/")
    public String home(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
                       @RequestParam(name = "size", defaultValue = "6") Integer size,
                       @Param("keyword") String keyword, @Param("min") Double min,
                       @Param("max") Double max){
        Pageable pageable = PageRequest.of(page, size);
        Page<Products> data = productRepo.findAll(pageable);
        //tìm kiếm theo tên
        if(keyword != null){
            data = productRepo.findProductByName(keyword, pageable);
            model.addAttribute("keyword", keyword);
        }

        //tìm kiếm theo giá
//        if(min != 0 && max != 0) {
//            data = productRepo.findProductByPrice(min, max, pageable);
//        }

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
        List<ProductVariants> lstPro = productVariantRepo.findIdProduct(id);
        for (int i = 0; i < lstPro.size(); i++) {
            Products products = lstPro.get(i).getProduct_id();
            model.addAttribute("product", products);
        }

//        List<Sizes> lstSize = sizeRepo.findAll();

//        model.addAttribute("lstSize", lstSize);
        model.addAttribute("lstPro", lstPro);


        return "customer/view_product";
    }
    
//    @GetMapping("/search")
//    public String search(Model model, @RequestParam("name") String keyword){
//        Pageable pageable = PageRequest.of(0,6);
//        if(keyword != null){
//            Page<Products> products = productRepo.findProductByName(keyword, pageable);
//            model.addAttribute("pro", products);
//        }
//        return "redirect:/home";
//    }
    
    @GetMapping("/favorite/{id}")
    public String favorite(@PathVariable String id, Model model){
        Accounts acc = accRepo.findById(id).orElse(null);
        if(acc != null){
            List<FavoriteProducts> lstFavorPro = acc.getFavoriteProducts();
            model.addAttribute("lstProfavor", lstFavorPro);
            return "customer/favorite_product";
        }else {
            return "redirect:/";
        }
    }
    @GetMapping("/deleteFavorite/{id}")
    public String deleteFovor(@PathVariable Integer id){
        favoriteProductRepo.deleteById(id);
        return "redirect:/";
    }
    @PostMapping("/add-to-favorite/{id}")
    public String addFavorite(@PathVariable Integer id, HttpSession session){
        Accounts acc = (Accounts) session.getAttribute("acc");
        Products products = productRepo.findById(id).orElse(null);
        FavoriteProducts favoriteProducts = new FavoriteProducts(acc, products);
        favoriteProductRepo.save(favoriteProducts);
        return "redirect:/";
    }

    @GetMapping("/confirmation")
    public String confirmation(){
        return "customer/confirmation";
    }

}
