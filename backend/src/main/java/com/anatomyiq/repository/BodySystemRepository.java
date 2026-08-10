package com.anatomyiq.repository;

import com.anatomyiq.entity.BodySystem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BodySystemRepository extends JpaRepository<BodySystem, Long> {
}
