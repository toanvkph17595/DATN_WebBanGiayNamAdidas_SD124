package com.sd124.service;

import com.sd124.model.Accounts;
//import com.sd124.repository.AccountRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

//@Service
public class UserDetailServiceImpl  {
//    @Autowired
//    AccountRepository accRepo;

//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        Accounts acc = accRepo.findById(username).orElse(null);
//        if(acc == null){
//            throw new UsernameNotFoundException("No user with username:" + username);
//        }
//        List<Integer> roles = acc.getRoles().stream()
//                .map(r -> r.getId()).collect(Collectors.toList());
//        return User
//                .withUsername(username)
//                .password(acc.getPassword())
//                .roles(roles.toArray(new String[0]))
//                .build();
//    }
}
