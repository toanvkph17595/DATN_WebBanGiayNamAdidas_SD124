package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="Roles")
@Entity
public class Roles {
    @Id
    @JoinColumn(name = "Id")
    private String id;

    @Column(name = "Name")
    private String name;
}
