package com.sd124.repository;

import com.sd124.model.ProductVariants;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductVariantRepository extends JpaRepository<ProductVariants, Integer> {
    @Query("select pv from ProductVariants pv where pv.product_id.id = :id")
    List<ProductVariants> findIdProduct(@Param("id") Integer id);

    @Query("select pv from ProductVariants pv where pv.product_id.id=?1 AND pv.color_id.id=?2 AND pv.size_id.id=?3")
    Optional<ProductVariants> findByProductIdAndColorIdAndSizeId(int productId, int colorId, int sizeId);

}
