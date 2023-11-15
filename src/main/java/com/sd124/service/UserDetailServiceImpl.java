package com.sd124.service;

import com.sd124.model.Accounts;
import com.sd124.repository.AccountRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserDetailServiceImpl implements UserDetailsService{
    @Autowired
    AccountRepository accRepo;
    @Autowired
    HttpServletRequest request;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Accounts acc = accRepo.findById(username).orElse(null);
        HttpSession session = request.getSession();

        if(acc != null){
            session.setAttribute("acc", acc);
        }else {
            session.setAttribute("error", "Sai email hoặc mật khẩu");
            throw new UsernameNotFoundException("No user with username:" + username);
        }
        List<String> roles = acc.getRoles().stream()
                .map(r -> r.getId())
                .collect(Collectors.toList());

        return User
                .withUsername(username)
                .password(acc.getPassword())
                .roles(roles.toArray(new String[0]))
                .build();
    }
}
