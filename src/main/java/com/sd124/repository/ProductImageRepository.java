package com.sd124.repository;

import com.sd124.model.ProductImages;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImages, Integer> {
    @Query("select im from ProductImages im where im.url like :url")
    List<ProductImages> findImageProductByUrl(String url);
}
