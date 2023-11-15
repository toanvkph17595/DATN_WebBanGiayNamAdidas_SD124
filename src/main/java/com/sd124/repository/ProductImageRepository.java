package com.sd124.repository;

import com.sd124.model.ProductImages;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImages, Integer> {
//    @Query("select im from ProductImages im where im.url like '%IG%'")
//    List<ProductImages> findImageProductByUrl();
}
