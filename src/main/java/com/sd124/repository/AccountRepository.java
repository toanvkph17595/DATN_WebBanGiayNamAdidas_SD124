package com.sd124.repository;

import com.sd124.model.Accounts;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountRepository extends JpaRepository<Accounts, String> {
    @Query("SELECT a FROM Accounts a WHERE a.userName in :listUserName AND a.status = :status")
    Page<Accounts> findStaff(@Param("listUserName") List<String> listUserName, @Param("status") int status, Pageable pageable);

    @Query("SELECT a FROM Accounts a WHERE a.userName = :userName")
    Accounts findStaffByUsername(@Param("userName") String userName);

    @Query("SELECT a FROM Accounts a WHERE a.userName in :listUserName")
    Page<Accounts> findAllStaff(@Param("listUserName") List<String> listUserName, Pageable pageable);
}