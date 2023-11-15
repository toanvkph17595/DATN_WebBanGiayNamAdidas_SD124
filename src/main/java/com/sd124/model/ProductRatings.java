package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Productratings")
public class ProductRatings {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdPRD")
    private Products product_id;

    @ManyToOne
    @JoinColumn(name = "Username")
    private Accounts acc_id;

    @JoinColumn(name = "Raiting")
    private Integer raiting;

    @JoinColumn(name = "Comment")
    private String comment;
}
