package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Favoriteproducts")
public class FavoriteProducts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdPRD")
    private Products product_id;

    @ManyToOne
    @JoinColumn(name = "Username")
    private Accounts acc_id;

    public FavoriteProducts(Accounts acc_id, Products product_id){
        this.acc_id = acc_id;
        this.product_id = product_id;
    }
}
