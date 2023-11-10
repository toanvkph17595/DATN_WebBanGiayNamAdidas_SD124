package com.sd124.controller.customer;

import com.sd124.model.*;
import com.sd124.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    private ProductVariantRepository productVariantRepo;
    @Autowired
    private CartRepository cartRepo;
    @Autowired
    private AccountRepository accRepo;
    @Autowired
    private HttpSession session;

    @Autowired
    private ColorRepository colorRepository;

    @Autowired
    private SizeRepository sizeRepository;

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/cart")
    public String getCart(Model model){
        List<CartItem> lstCart = (List<CartItem>) session.getAttribute("carts");
        model.addAttribute("lstCart", lstCart);
        return "customer/cart";
    }


    @PostMapping("/add-to-cart/{id}")
    public String addToCart(@PathVariable int id, @RequestParam int quantity, @RequestParam int color_id, @RequestParam int size_id) {
        Colors color = colorRepository.findById(color_id).orElse(null);
        Sizes size = sizeRepository.findById(size_id).orElse(null);
        Products product = productRepository.findById(id).orElse(null);
        if(color != null && size != null && product != null) {
            CartItem item = new CartItem();
            item.setProductId(id);
            item.setProductName(product.getName());
            item.setColorId(color_id);
            item.setColorName(color.getName());
            item.setSizeId(size_id);
            item.setSizeName(size.getName());
            item.setQuantity(quantity);
            item.setProductImage(product.getImage());
            item.setProductPrice((long) product.getPrice());

            List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");
            if(carts == null) {
                carts = new ArrayList<>();
                session.setAttribute("carts", carts);
            }

            CartItem existingItem = null;
            for(CartItem c : carts) {
                if(c.getProductId() == id && c.getSizeId() == size_id && c.getColorId() == color_id) {
                    existingItem = c;
                    break;
                }
            }
            if(existingItem != null){
                existingItem.setQuantity(existingItem.getQuantity() + quantity);
            }else{
                carts.add(item);
            }
        }
        return "redirect:/";
    }

    @PostMapping("/buy-now")
    public String buynow(){
        return "/cart";

    }


}
