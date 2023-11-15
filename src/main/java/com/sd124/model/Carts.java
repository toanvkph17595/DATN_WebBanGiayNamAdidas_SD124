package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Carts")
public class Carts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdPRV")
    private ProductVariants productVariant_id;

    @ManyToOne
    @JoinColumn(name = "Username")
    private Accounts acc_id;

    @JoinColumn(name = "Quantity")
    private double quantity;
}
