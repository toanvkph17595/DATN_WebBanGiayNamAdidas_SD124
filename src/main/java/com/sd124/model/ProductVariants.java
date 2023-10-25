package com.sd124.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data @NoArgsConstructor @AllArgsConstructor
@Table(name = "ProductVariants")
public class ProductVariants {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdPRD")
    private Products product_id;

    @ManyToOne
    @JoinColumn(name = "IdCL")
    private Colors color_id;

    @ManyToOne
    @JoinColumn(name = "IdSZ")
    private Sizes size_id;

    @ManyToOne
    @JoinColumn(name = "IdPRI")
    private ProductImages proImage_id;
}
