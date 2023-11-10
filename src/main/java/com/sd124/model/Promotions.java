package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Data
@NoArgsConstructor @AllArgsConstructor
@Entity
@Table(name = "Promotions")
public class Promotions {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @JoinColumn(name = "Name")
    private String name;

    @JoinColumn(name = "StartDate")
    private Date start_date;

    @JoinColumn(name = "EndDate")
    private Date end_date;
}
