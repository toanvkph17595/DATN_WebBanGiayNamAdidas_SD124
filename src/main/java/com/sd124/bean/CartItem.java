package com.sd124.bean;

import com.sd124.model.Accounts;
import lombok.Data;

import java.util.List;

@Data
public class CartItem {
    int productId;
    String productName;
    int colorId;
    String colorName;
    int sizeId;
    String sizeName;
    int quantity;
    long productPrice;
    String productImage;
    int productImage_id;
}
