package com.sd124.repository;

import com.sd124.model.ProductVariants;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductVariantRepository extends JpaRepository<ProductVariants, Integer> {
    @Query("select pv from ProductVariants pv where pv.product_id.id = :id")
    List<ProductVariants> findIdProduct(@Param("id") Integer id);

}
