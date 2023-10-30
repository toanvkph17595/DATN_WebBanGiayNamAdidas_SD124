package com.sd124.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;


@Data @AllArgsConstructor @NoArgsConstructor
@Entity
@Table(name = "Products")
public class Products {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Name")
    private String name;

    @Column(name = "Price")
    private double price;

    @Column(name = "Quantity")
    private Integer quantity;

    @Column(name = "Description")
    private String description;

    @Column(name = "Image")
    private String image;

    @ManyToOne
    @JoinColumn(name = "IdCATE")
    private Categories category_id;
}
