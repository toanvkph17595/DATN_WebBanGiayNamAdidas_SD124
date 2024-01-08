package com.sd124.repository;

import com.sd124.model.PromotionDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PromotionDetaiRepository extends JpaRepository<PromotionDetails, Integer> {
}
