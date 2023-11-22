package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

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

    @JoinColumn(name = "Rating")
    private Integer rating;

    @JoinColumn(name = "Comment")
    private String comment;

    @JoinColumn(name = "CommentDate")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date commentdate = new Date();
}
