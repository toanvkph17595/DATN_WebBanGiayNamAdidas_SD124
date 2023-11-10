package com.sd124.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="Orderdetails")
@Entity
public class OrderDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdOD")
    private Orders orders_id;

    @ManyToOne
    @JoinColumn(name = "IdPRV")
    private ProductVariants productVariants_id;

    @Column(name = "Quantity")
    private Integer quantity;
}
