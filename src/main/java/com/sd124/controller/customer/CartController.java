package com.sd124.controller.customer;

import com.sd124.bean.CartItem;
import com.sd124.model.*;
import com.sd124.repository.*;
import jakarta.servlet.http.HttpSession;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    private ProductVariantRepository productVariantRepo;
    @Autowired
    private OrderRepository orderRepo;
    @Autowired
    private OrderDetailRepository orderDetailRepository;
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

    @Autowired
    private ProductImageRepository productImageRepository;

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

        return "redirect:/cart";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id){

        return "redirect:/cart";
    }
//    @GetMapping("/buy-now")
//    public String buynow(){
//
//        return "redirect:/";
//    }

    @GetMapping ("/checkout")
    public String check(@ModelAttribute ShippingInfo shippingInfo, Model model){

        return "customer/shippinginfo";
    }

    @Data
    public static class ShipInfo {
        String address;
        String phone;
    }

    long getCartToal(List<CartItem> carts) {
        if(carts == null) return  0;
        long total = 0;
        for(CartItem item : carts){
            total += item.getQuantity() * item.getProductPrice();
        }
        return  total;
    }
    @PostMapping("/saveShippingInfo")
    public String saveShippingInfo(@ModelAttribute ShipInfo shipInfo, Model model) {
        boolean hasError = false;
        if(shipInfo.getAddress().isEmpty()) {
            model.addAttribute("errAddress", "Thiếu thông tin địa chỉ");
            hasError = true;
        }
        if(shipInfo.getPhone().isEmpty()) {
            model.addAttribute("errPhone", "Thiếu thông tin điện thoại");
            hasError = true;
        }
        if(hasError) {
            return "customer/shippinginfo";
        }
        List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");
        Accounts acc = (Accounts) session.getAttribute("acc");
        acc.setAddress(shipInfo.getAddress());
        acc.setPhone(shipInfo.getPhone());
        accRepo.save(acc);

        Orders order = new Orders();
        order.setAcc_id(acc);
        order.setTotal((double) getCartToal(carts));
        order.setDeliverdate(new Date());
        order.setStatus(Orders.Status.New);
        orderRepo.save(order);

        for(CartItem item : carts) {
            OrderDetails orderDetails = new OrderDetails();
            orderDetails.setOrder_id(order);
            orderDetails.setProductVariant_id(
                productVariantRepo.findByProductIdAndColorIdAndSizeId(
                    item.getProductId(),
                    item.getColorId(),
                    item.getSizeId()
                ).orElse(null)
            );
            orderDetails.setQuantity(item.getQuantity());
            orderDetailRepository.save(orderDetails);
            carts.remove(item);
//            orderDetails = new OrderDetails();
        }
        return "redirect:/";
    }

}
