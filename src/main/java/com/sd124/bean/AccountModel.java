package com.sd124.bean;

import lombok.Data;

import java.util.List;

@Data
public class AccountModel {
    private String userName;
    private List<CartItem> cart;
}
