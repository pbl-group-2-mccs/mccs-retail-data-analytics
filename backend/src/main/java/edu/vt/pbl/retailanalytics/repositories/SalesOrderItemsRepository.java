package edu.vt.pbl.retailanalytics.repositories;

import edu.vt.pbl.retailanalytics.entites.SalesOrderItems;
import org.springframework.data.jpa.repository.JpaRepository;



public interface SalesOrderItemsRepository extends JpaRepository<SalesOrderItems, Integer> {
}
