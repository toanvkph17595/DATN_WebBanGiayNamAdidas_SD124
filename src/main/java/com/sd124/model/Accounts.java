package com.sd124.model;

import com.sd124.bean.CartItem;
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
    private String image;
    @Column(name ="Address")
    private String address;
    @Column(name ="Phone")
    private String phone;
    @Column(name ="Status", nullable = true)
    private boolean status;


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "Authoritis",
            joinColumns = @JoinColumn(name = "username"),
            inverseJoinColumns = @JoinColumn(name = "idrole")
    )
    List<Roles> roles;

    @OneToMany(mappedBy = "acc_id")
    List<FavoriteProducts> favoriteProducts;

    @OneToMany(mappedBy = "acc_id")
    List<Orders> orders;

    public String toString(){
        return fullName;
    }
}
