package com.sd124.repository;

import com.sd124.model.Authoritis;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorityRepository extends JpaRepository<Authoritis, Integer> {
}

