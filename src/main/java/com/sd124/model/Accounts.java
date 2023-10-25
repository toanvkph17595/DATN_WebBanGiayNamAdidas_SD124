package com.sd124.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Data
@NoArgsConstructor @AllArgsConstructor
@Table(name="Accounts")
@Entity
public class Accounts {
    @Id
    @Column(name ="Username")
    private String userName;
    @Column(name ="Password")
    private String password;
    @Column(name ="Fullname")
    private String fullName;
    @Column(name ="Email")
    private String email;
    @Column(name ="Image")
    private String Image;
    @Column(name ="Address")
    private String address;
}
