package com.sd124.repository;

import com.sd124.model.OrderDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface OrderDetailRepository extends JpaRepository<OrderDetails, Integer> {
    @Query(value = "select cast(o.createdate as date) as date,\n" +
            "           sum(quantity * price) as revenua \n" +
            "           from OrderDetails od join Orders o \n" +
            "\t\t   on o.Id = od.IdOD\n" +
            "           where o.createdate BETWEEN ?1 AND ?2\n" +
            "           group by cast(o.createdate as date)\n" +
            "\t\t   order by revenua desc", nativeQuery = true)
    List<Object[]> reportByDay(Date d1, Date d2);

    @Query(value = "select p.name,\n" +
            "            sum(od.quantity*od.price) as revenue,\n" +
            "            sum(od.quantity) as quantity\n" +
            "            FROM OrderDetails od JOIN Orders o ON o.id=od.order_id.id JOIN Products p ON p.id =od.id\n" +
            "            WHERE o.createdate BETWEEN cast('2023-11-01' as date) and cast ('2023-11-30' as date)\n" +
            "            GROUP BY p.name\n" +
            "            ORDER BY revenue DESC")
    List<Object[]> reportByProduct(Date d1, Date d2);
}
