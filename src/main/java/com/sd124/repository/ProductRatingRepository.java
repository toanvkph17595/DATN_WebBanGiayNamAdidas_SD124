package com.sd124.repository;

import com.sd124.model.ProductRatings;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRatingRepository extends JpaRepository<ProductRatings, Integer> {

    @Query("select pr from ProductRatings pr where pr.product_id.id = :id")
    List<ProductRatings> getAllByProductId(@Param("id") Integer id);
}
