package com.sd124.model;

import lombok.Data;

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
}
