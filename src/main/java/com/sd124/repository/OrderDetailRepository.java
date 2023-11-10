package com.sd124.repository;

import com.sd124.model.OrderDetails;
import com.sd124.model.Orders;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetails, Integer> {
    @Query("SELECT o FROM OrderDetails o WHERE o.orders_id = :order")
    List<OrderDetails> findOrderDetailsByOrder(@Param("order") Orders order);

}
