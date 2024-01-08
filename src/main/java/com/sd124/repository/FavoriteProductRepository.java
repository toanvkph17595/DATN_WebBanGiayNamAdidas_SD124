package com.sd124.repository;

import com.sd124.model.FavoriteProducts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FavoriteProductRepository extends JpaRepository<FavoriteProducts, Integer> {
}
