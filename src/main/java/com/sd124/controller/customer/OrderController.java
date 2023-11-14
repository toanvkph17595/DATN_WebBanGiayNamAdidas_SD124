package com.sd124.controller.customer;

import com.sd124.model.OrderDetails;
import com.sd124.model.Orders;
import com.sd124.repository.OrderDetailRepository;
import com.sd124.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/staff/order")
public class OrderController {

    @Autowired
    private OrderRepository orderRepo;

    @Autowired
    private OrderDetailRepository orderDetailRepo;

    @GetMapping("index/{status}")
    public  String listOrder(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
                             @RequestParam(name = "size", defaultValue = "5") Integer size, @PathVariable(name = "status") Integer status){
        Pageable pageable = PageRequest.of(page, size);
        Page<Orders> data;
        if (status==0){
            data = this.orderRepo.findAllOrder(pageable);
        }else if(status==1){
            data = this.orderRepo.findOrder(0,pageable);
        }else if(status==2){
            data = this.orderRepo.findOrder(1,pageable);
        }else if(status==3){
            data = this.orderRepo.findOrder(2,pageable);
        }else{
            data = this.orderRepo.findOrder(3,pageable);
        }
        model.addAttribute("status", status);
        model.addAttribute("data", data);
        return "staff/order/index";
    }

    @GetMapping("/delete/{id}")
    public  String delete(@PathVariable Integer id){
        Orders orders = orderRepo.getOne(id);
        orders.setStatus(3);
        orderRepo.save(orders);
        return "redirect:/staff/order/index/0";
    }

    @GetMapping("/success0/{id}")
    public  String success0(@PathVariable Integer id){
        Orders orders = orderRepo.getOne(id);
        orders.setStatus(1);
        orderRepo.save(orders);
        return "redirect:/staff/order/index/0";
    }
    @GetMapping("/success1/{id}")
    public  String success1(@PathVariable Integer id){
        Orders orders = orderRepo.getOne(id);
        orders.setStatus(2);
        orderRepo.save(orders);
        return "redirect:/staff/order/index/0";
    }

    @GetMapping("/success3/{id}")
    public  String success3(@PathVariable Integer id){
        Orders orders = orderRepo.getOne(id);
        orders.setStatus(3);
        orderRepo.save(orders);
        return "redirect:/staff/order/index/0";
    }

    @GetMapping("detail/{id}")
    public  String detail(Model model,@PathVariable Integer id){
        Orders orders = orderRepo.getOne(id);
        List<OrderDetails> data = orderDetailRepo.findOrderDetailsByOrder(orders);
        model.addAttribute("orders",orders);
        model.addAttribute("data", data);
        return "staff/order/detail";
    }
}
