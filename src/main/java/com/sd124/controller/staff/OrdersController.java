package com.sd124.controller.staff;

import com.sd124.model.OrderDetails;
import com.sd124.model.Orders;
import com.sd124.model.ProductVariants;
import com.sd124.repository.OrderDetailRepository;
import com.sd124.repository.OrderRepository;
import com.sd124.repository.ProductVariantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/staff/order")
public class OrdersController {

    @Autowired
    private OrderRepository orderRepo;

    @Autowired
    private OrderDetailRepository orderDetailRepo;

    @Autowired
    private ProductVariantRepository productVariantRepo;

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
        return "staff/orderDetail/detail";
    }

    @GetMapping("edit/{id}")
    public  String edit(Model model,@PathVariable Integer id){
        Orders orders = orderRepo.getOne(id);
        List<OrderDetails> data = orderDetailRepo.findOrderDetailsByOrder(orders);
        model.addAttribute("orders",orders);
        model.addAttribute("data", data);
        return "staff/order/edit";
    }

    @GetMapping("save/{id}")
    public  String save(@PathVariable Integer id,
                        @RequestParam(name = "shippingFee") Integer shippingFee){
        Orders orders = orderRepo.getReferenceById(id);
        orders.setShippingFee(shippingFee);
        orderRepo.save(orders);
        return "redirect:/staff/order/detail/"+id.toString();
    }

    @GetMapping("orderDetail/delete/{id}&{orderId}")
    public String deleteOrderDetail(@PathVariable(name = "id") Integer id,
                                    @PathVariable(name = "orderId") Integer orderId){
        OrderDetails orderDetails = orderDetailRepo.getById(id);
        orderDetailRepo.delete(orderDetails);
        return "redirect:/staff/order/edit/"+orderId.toString();
    }

    @GetMapping("orderDetail/edit/{id}")
    public String editOrderDetail(Model model, @PathVariable("id") Integer id,
                                  OrderDetails orderDetails){
        orderDetails = orderDetailRepo.getById(id);
        model.addAttribute("orderDetails",orderDetails);
        return "staff/orderDetail/edit";
    }

    @PostMapping("orderDetail/edit/save/{id}&{prvId}&{ordDId}")
    public String saveOrderDetail(@PathVariable(name = "id") Integer id,
                                  @PathVariable(name = "prvId") Integer prvId,
                                  @PathVariable(name = "ordDId") Integer ordDId,
                                  @ModelAttribute("orderDetails") OrderDetails orderDetails){
        orderDetails.setId(ordDId);
        Orders orders = orderRepo.getReferenceById(id);
        orderDetails.setOrders_id(orders);
        ProductVariants prV = productVariantRepo.getReferenceById(prvId);
        orderDetails.setProductVariants_id(prV);
        orderDetailRepo.save(orderDetails);
        return "redirect:/staff/order/edit/"+orderDetails.getOrders_id().getId().toString();
    }

    @GetMapping("index/search")
    public  String search(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
                          @RequestParam(name = "size", defaultValue = "5") Integer size,
                          @RequestParam(name = "keyword") String keyword,
                          @RequestParam(name = "startDate",defaultValue = "#{T(java.time.LocalDate).now()}") LocalDate startDate,
                          @RequestParam(name = "endDate",defaultValue = "#{T(java.time.LocalDate).now()}") LocalDate endDate){
        Pageable pageable = PageRequest.of(page, size);
        String searchData = "%"+keyword+"%";
        int id = 0;
        try {
            id = Integer.parseInt(keyword);
        }catch (Exception e){
            e.printStackTrace();
        }

        Page<Orders> data = orderRepo.findOrdersBySearch(id,searchData,startDate,endDate,pageable);
        model.addAttribute("status", 0);
        model.addAttribute("data", data);
        return "staff/order/index";
    }
}
