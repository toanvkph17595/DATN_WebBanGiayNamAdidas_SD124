package com.sd124.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="Authoritis")
@Entity
public class Authoritis {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "IdROLE")
    private Roles role_id;

    @ManyToOne
    @JoinColumn(name = "Username")
    private Accounts username;
}
