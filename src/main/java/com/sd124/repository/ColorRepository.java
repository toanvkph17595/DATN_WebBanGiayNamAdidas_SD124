package com.sd124.repository;

import com.sd124.model.Colors;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ColorRepository extends JpaRepository<Colors, Integer> {
    @Query("select cl from Colors cl left join ProductVariants pv on cl.id = pv.color_id.id where pv.product_id.id = :id")
    List<Colors> findColorByIdPro(@Param("id") Integer id);
}
