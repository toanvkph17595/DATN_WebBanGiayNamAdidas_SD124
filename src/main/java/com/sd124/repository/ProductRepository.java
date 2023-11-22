package com.sd124.repository;

import com.sd124.model.Products;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Products, Integer> {

    @Query("select p from Products p where p.name like %?1%")
    Page<Products> findProductByName(String keyword, Pageable pageable);

    @Query("select p from Products p where p.category_id.id = ?1")
    Page<Products> findProductByCate(@Param("id") Integer id, Pageable pageable);

//    @Query("select p from Products p where p.price between ?1 and ?2")
//    Page<Products> findProductByPrice(Double min, Double max, Pageable pageable);

}
