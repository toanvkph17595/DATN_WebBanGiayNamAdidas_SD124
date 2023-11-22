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

import java.util.*;
import java.util.stream.Collectors;

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
    private OrderRepository orderRepo;
    @Autowired
    private FavoriteProductRepository favoriteProductRepo;
    @Autowired
    private ProductRatingRepository productRatingRepo;

    @Autowired HttpSession session;

    @GetMapping ("/")
    public String home(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
                       @RequestParam(name = "size", defaultValue = "6") Integer size,
                       @Param("keyword") String keyword){
        Pageable pageable = PageRequest.of(page, size);
        Page<Products> data = productRepo.findAll(pageable);
        //tìm kiếm theo tên
        if(keyword != null){
            data = productRepo.findProductByName(keyword, pageable);
            model.addAttribute("keyword", keyword);
        }

        List<Categories> lstCate = cateRepo.findAll();

        model.addAttribute("data", data);
        model.addAttribute("lstCate", lstCate);
        return "customer/index";
    }

    @GetMapping("/filter/{id}")
    public String filter(@PathVariable Integer id, Model model, Categories categories){
        List<Categories> lstCate = cateRepo.findAll();
        Pageable pageable = PageRequest.of(0,6);
        Page<Products> lstPro = productRepo.findProductByCate(id, pageable);
        model.addAttribute("lstCate", lstCate);
        model.addAttribute("lstPro", lstPro);
        return "customer/filter";
    }

    @GetMapping("/view-product/{id}")
    public String viewProduct(@PathVariable Integer id, Model model) {
        List<ProductVariants> lstPro = productVariantRepo.findIdProduct(id);
        List<Colors> colors = new ArrayList<>();
        List<Sizes> sizes = new ArrayList<>();
        for(ProductVariants pv : lstPro) {
            if(!colors.contains(pv.getColor_id())) {
                colors.add(pv.getColor_id());
            }
            if(!sizes.contains(pv.getSize_id())) {
                sizes.add(pv.getSize_id());
            }
        }

        Boolean liked = null;
        Accounts acc = (Accounts) session.getAttribute("acc");
        if(acc != null) {
            liked = favoriteProductRepo.findByProductIdAndAcc(id, acc.getUserName()).isPresent();
        }

        List<ProductRatings> lstPr = productRatingRepo.getAllByProductId(id);

        model.addAttribute("lstPr", lstPr);
        model.addAttribute("product", productRepo.findById(id).orElse(null));
        model.addAttribute("colors", colors);
        model.addAttribute("sizes", sizes);
        model.addAttribute("lstPro", lstPro);
        model.addAttribute("liked", liked);


        return "customer/view_product";
    }

    @PostMapping("/comment/{id}")
    public String comments(@PathVariable Integer id, Model model,
                           @RequestParam("comment") String comment){
        Accounts acc = (Accounts) session.getAttribute("acc");
        Products product = productRepo.findById(id).orElse(null);
        ProductRatings productRating = new ProductRatings();
        productRating.setAcc_id(acc);
        productRating.setProduct_id(product);
        productRating.setCommentdate(new Date());
        productRating.setComment(comment);
        productRating.setRating(5);

        productRatingRepo.save(productRating);
        return "redirect:/view-product/" + id;
    }
    
    @GetMapping("/favorite/{id}")
    public String favorite(@PathVariable String id, Model model){
        Accounts acc = accRepo.findById(id).orElse(null);
        if(acc != null){
            List<FavoriteProducts> lstFavorPro = acc.getFavoriteProducts();
            model.addAttribute("lstProfavor", lstFavorPro);
        }
        return "customer/favorite_product";
    }
    @GetMapping("/delete-favorite/{id}")
    public String deleteFavorite(@PathVariable Integer id){
        Accounts acc = (Accounts) session.getAttribute("acc");
        Products products = productRepo.findById(id).orElse(null);
        FavoriteProducts favoriteProducts = favoriteProductRepo.findByProductIdAndAcc(id, acc.getUserName()).orElse(null);
        if(favoriteProducts != null) {
            favoriteProductRepo.delete(favoriteProducts);
        }
        return "redirect:/view-product/" + id;
    }

    @RequestMapping("/add-to-favorite/{id}")
    public String addFavorite(@PathVariable Integer id) {
        Accounts acc = (Accounts) session.getAttribute("acc");
        Products products = productRepo.findById(id).orElse(null);
        if (favoriteProductRepo.findByProductIdAndAcc(id, acc.getUserName()).isEmpty()) {
            FavoriteProducts favoriteProducts = new FavoriteProducts();
            favoriteProducts.setAcc_id(acc);
            favoriteProducts.setProduct_id(products);
            favoriteProductRepo.save(favoriteProducts);
        }

        return "redirect:/view-product/" + id;

    }

    @GetMapping("/order_history/{id}")
    public String detail(Model model, @PathVariable("id") String userName){
        Accounts accounts = accRepo.findById(userName).orElse(null);
        List<Orders> lstOrder = accounts.getOrders();
        model.addAttribute("lstOrder", lstOrder);
        return "customer/order_history";
    }

    @GetMapping("/order_history/detail/{id}")
    public String detail_history(Model model, @PathVariable("id") Integer id){
        Orders orders = orderRepo.findById(id).orElse(null);
        List<OrderDetails> lstOrderDetail = orders.getOrderDetail();
        model.addAttribute("lstOrderDetail", lstOrderDetail);
        return "customer/detail_history";
    }

    @GetMapping("/confirmation")
    public String confirmation(){
        return "customer/confirmation";
    }

}
