package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Promotiondetails")
public class PromotionDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdPRD")
    private Products product_id;

    @ManyToOne
    @JoinColumn(name = "IdPRM")
    private Promotions promotion_id;

    @JoinColumn(name = "Amount")
    private Integer amount;
}
