package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Authoritis")
public class Authorities {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdROLE")
    private Roles role_id;

    @ManyToOne
    @JoinColumn(name = "Username")
    private Accounts acc_id;
}
