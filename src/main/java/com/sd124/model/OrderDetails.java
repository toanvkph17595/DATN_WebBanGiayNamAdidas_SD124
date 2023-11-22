package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Orderdetails")
public class OrderDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdOD")
    private Orders order_id;

    @ManyToOne
    @JoinColumn(name = "IdPRV", nullable = false)
    private ProductVariants productVariant_id;

    @JoinColumn(name = "Quantity")
    private Integer quantity;
}
