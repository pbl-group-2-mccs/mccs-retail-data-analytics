package edu.vt.pbl.retailanalytics.repositories;

import edu.vt.pbl.retailanalytics.entites.SalesOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.time.LocalDateTime;
import java.util.List;

public interface SalesOrderRepository extends JpaRepository<SalesOrder, Integer> {

    @Query("SELECT so FROM SalesOrder so WHERE so.orderDate BETWEEN :startTime AND :endTime")
    List<SalesOrder> findByOrderDateBetween(@Param("startTime") LocalDateTime startTime, @Param("endTime") LocalDateTime endTime);
}
