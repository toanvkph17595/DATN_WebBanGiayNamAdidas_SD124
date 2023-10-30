package com.sd124.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

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

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "Authoritis",
            joinColumns = @JoinColumn(name = "IdROLE"),
            inverseJoinColumns = @JoinColumn(name = "Username")
    )
    List<Roles> roles;
}
