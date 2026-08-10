package com.anatomyiq.repository;

import com.anatomyiq.entity.HealthLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HealthLogRepository extends JpaRepository<HealthLog, Long> {
    List<HealthLog> findByUser_IdOrderByLogDateDesc(Long userId);
}
