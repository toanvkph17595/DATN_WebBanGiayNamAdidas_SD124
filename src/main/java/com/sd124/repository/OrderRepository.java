package com.sd124.repository;

import com.sd124.model.Orders;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Date;

@Repository
public interface OrderRepository extends JpaRepository<Orders, Integer> {
    @Query("SELECT o FROM Orders o WHERE o.status = :status ORDER BY o.createdDate DESC ")
    Page<Orders> findOrder(@Param("status") Integer status, Pageable pageable);

    @Query("SELECT o FROM Orders o WHERE o.id = :id OR o.userName.fullName like :search OR o.recipientPhone like :search AND (o.createdDate between :startDate and :endDate) ORDER BY o.createdDate DESC ")
    Page<Orders> findOrdersBySearch(@Param("id") Integer id, @Param("search") String search, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, Pageable pageable);

    @Query("SELECT o FROM Orders o ORDER BY o.createdDate DESC ")
    Page<Orders> findAllOrder(Pageable pageable);
}
