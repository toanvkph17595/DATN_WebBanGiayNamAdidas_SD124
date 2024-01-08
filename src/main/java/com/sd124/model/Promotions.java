package com.sd124.model;

import com.sd124.DateUtil;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JoinColumn(name = "StartDate")
    private Date start_date;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JoinColumn(name = "EndDate")
    private Date end_date;

    @JoinColumn(name = "status")
    private Integer status;

    @JoinColumn(name="note")
    private String note;

    List<PromotionDetails> promotionDetailsList = new ArrayList<>();

    public String getStartDateDisplay(){
        return DateUtil.formatDate(start_date, "dd/MM/yyyy");
    }

    public String getEndDateDisplay(){
        return DateUtil.formatDate(end_date, "dd/MM/yyyy");
    }
}
