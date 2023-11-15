package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Data
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Orders")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "Username")
    private Accounts acc_id;

    @JoinColumn(name = "CreateDate")
    private Date create_date = new Date();

    @JoinColumn(name = "Total")
    private Double total;

    @JoinColumn(name = "Status")
    private String status;

    @JoinColumn(name = "DeliverDate")
    private Date delever_date;

    @JoinColumn(name = "Shipfee")
    private Double shipfee;

    @JoinColumn(name = "Address")
    private String address;

    @JoinColumn(name = "Phone")
    private String phone;
}
