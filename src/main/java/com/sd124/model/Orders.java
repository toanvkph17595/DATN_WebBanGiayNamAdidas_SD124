package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;

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

    @JoinColumn(name = "Createdate")
    @Temporal(TemporalType.DATE)
    private Date createdate = new Date();

    @JoinColumn(name = "Total")
    private Double total;

    @JoinColumn(name = "Status")
    private String status;

    @JoinColumn(name = "Deliverdate")
    private Date deliverdate;

    @OneToMany(mappedBy = "order_id")
    List<OrderDetails> orderDetail;

    public static interface Status {
        public String New = "NEW";
        public String Delivered = "DELIVERED";
        public String Cancelled = "CANCELLED";
    }
}
