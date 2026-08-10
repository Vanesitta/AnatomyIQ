package com.anatomyiq.repository;

import com.anatomyiq.entity.Organ;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrganRepository extends JpaRepository<Organ, Long> {
    List<Organ> findByBodySystemId(Long systemId);
}
