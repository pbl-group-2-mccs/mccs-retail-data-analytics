package edu.vt.pbl.retailanalytics.repositories;

import edu.vt.pbl.retailanalytics.dtos.RegionSalesDto;
import edu.vt.pbl.retailanalytics.entites.SalesOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public interface SalesOrderRepository extends JpaRepository<SalesOrder, Integer> {

    @Query("SELECT so FROM SalesOrder so WHERE so.orderDate BETWEEN :startTime AND :endTime")
    List<SalesOrder> findByOrderDateBetween(@Param("startTime") LocalDateTime startTime, @Param("endTime") LocalDateTime endTime);


    @Query("SELECT new edu.vt.pbl.retailanalytics.dtos.RegionSalesDto(" +
            "COALESCE(c.state, 'Unknown'), " +
            "SUM(so.quantity * so.unitPrice)) " +  // Correct calculation for total sales
            "FROM SalesOrder so " +
            "JOIN so.customer c " +
            "GROUP BY c.state " +
            "ORDER BY SUM(so.quantity * so.unitPrice) DESC")
    List<RegionSalesDto> findTotalSalesByRegion();
}
