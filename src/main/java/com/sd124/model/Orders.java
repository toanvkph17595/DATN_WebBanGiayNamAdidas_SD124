package com.sd124.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="Orders")
@Entity
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "Username")
    private Accounts userName;

    @Column(name = "CreatedD")
    private LocalDate createdDate;

    @Column(name = "Total")
    private Integer total;

    @Column(name = "Status")
    private Integer status;

    @Column(name = "DeliverD")
    private LocalDate deliverDate;

    @Column(name = "Shipfee")
    private Integer shippingFee;

    @Column(name = "Phone")
    private String recipientPhone;

    @Column(name = "Address")
    private String recipientAddress;

    public void setCreatedDate() {
        this.createdDate = java.time.LocalDate.now();
    }

    public void setDeliverDate() {
        this.deliverDate = LocalDate.now();
    }
}
