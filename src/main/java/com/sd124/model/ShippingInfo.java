package com.sd124.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Shippinginfo")
public class ShippingInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @JoinColumn(name = "Shipfee")
    private Double shipfee;

    @JoinColumn(name = "Address")
    private String address;

    @JoinColumn(name = "Phone")
    private String phone;
}
