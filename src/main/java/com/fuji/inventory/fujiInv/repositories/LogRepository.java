package com.fuji.inventory.fujiInv.repositories;

import com.fuji.inventory.fujiInv.models.Logs;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LogRepository extends JpaRepository<Logs, Long> {
    List<Logs> getLogsByItem_Id(Long id);
}
