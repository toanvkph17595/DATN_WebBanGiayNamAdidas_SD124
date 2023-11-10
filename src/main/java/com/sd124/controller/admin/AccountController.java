package com.sd124.controller.admin;

import com.sd124.model.Accounts;
import com.sd124.model.Authoritis;
import com.sd124.model.Roles;
import com.sd124.repository.AccountRepository;
import com.sd124.repository.AuthorityRepository;
import com.sd124.repository.RolesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/account")
public class AccountController {
    @Autowired
    private AccountRepository accountRepo;

    @Autowired
    private AuthorityRepository authorRepo;

    @Autowired
    private RolesRepository rolesRepo;

    @GetMapping("index/{status}")
    public String index(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
                       @RequestParam(name = "size", defaultValue = "5") Integer size, @PathVariable(name = "status") int status){
        List<Authoritis> listAuthor = authorRepo.findAll();
        List<String> listUserName = listAuthor.stream().filter(Authoritis -> Authoritis.getRole_id()
                .getName().equals("Staff")).map(Authoritis::getUsername).map(Accounts::getUserName).toList();
        Pageable pageable = PageRequest.of(page, size);
        Page<Accounts> data;
        if (status==0){
            data = this.accountRepo.findStaff(listUserName,0,pageable);
        }else if(status==1){
            data = this.accountRepo.findStaff(listUserName,1,pageable);
        }else{
            data = this.accountRepo.findAllStaff(listUserName,pageable);
        }
        model.addAttribute("status", status);
        model.addAttribute("data", data);
        return "admin/staff/index";
    }

    @GetMapping("delete/{username}")
    public String delete(@PathVariable(name = "username") String userName){
        Accounts acc = accountRepo.findStaffByUsername(userName);
        acc.setStatus(0);
        accountRepo.save(acc);
        return "redirect:/admin/account/index/1";
    }

    @GetMapping("/add")
    public String addStaff(@ModelAttribute("account") Accounts account){
        return "admin/staff/form";
    }

    @GetMapping("/edit/{username}")
    public String editStaff(Model model, @PathVariable("username") String username){
        Accounts accounts = accountRepo.findStaffByUsername(username);
        model.addAttribute("account", accounts);
        return "admin/staff/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("account") Accounts account){
        Accounts acc = accountRepo.findStaffByUsername(account.getUserName());
        if(acc==null){
            account.setPassword("1");
            account.setStatus(1);
            System.out.println(account.getUserName());
            accountRepo.save(account);
            Roles roles = rolesRepo.getReferenceById(2);
            Authoritis authoritis = new Authoritis();
            authoritis.setRole_id(roles);
            authoritis.setUsername(account);
            authorRepo.save(authoritis);
        }else{
            accountRepo.save(account);
        }
        return "redirect:/admin/account/index/1";
    }
}
