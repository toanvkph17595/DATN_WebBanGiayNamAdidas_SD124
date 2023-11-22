package com.sd124.repository;

import com.sd124.model.FavoriteProducts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FavoriteProductRepository extends JpaRepository<FavoriteProducts, Integer> {
    @Query("SELECT f FROM FavoriteProducts f WHERE f.product_id.id=?1 AND f.acc_id.userName=?2")
    Optional<FavoriteProducts> findByProductIdAndAcc(int productId, String acc);
}
