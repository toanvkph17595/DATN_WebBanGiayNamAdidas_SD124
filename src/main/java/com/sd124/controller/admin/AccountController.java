package com.sd124.controller.admin;

import com.sd124.model.Accounts;
import com.sd124.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/account")
public class AccountController {
    @Autowired
    private AccountRepository accountRepo;

    @GetMapping("index")
    public String index(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
                       @RequestParam(name = "size", defaultValue = "1") Integer size){
        Pageable pageable = PageRequest.of(page, size);
        Page<Accounts> data = this.accountRepo.findAllStaff(pageable);
        model.addAttribute("data", data);
        return "admin/staff/listview";
    }
}
