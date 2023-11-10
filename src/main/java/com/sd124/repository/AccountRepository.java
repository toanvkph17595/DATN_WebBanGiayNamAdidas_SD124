package com.sd124.repository;

import com.sd124.model.Accounts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends JpaRepository<Accounts, String> {
    @Query("select acc from Accounts acc where acc.email = :email")
    Accounts findAccByEmail(@Param("email") String email);
}
