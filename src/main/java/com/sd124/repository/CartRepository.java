package com.sd124.repository;

import com.sd124.model.Carts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<Carts, Integer> {
    @Query("select c from Carts c where c.acc_id = :id")
    List<Carts> findByCartAcc(@Param("id") String id);
}
