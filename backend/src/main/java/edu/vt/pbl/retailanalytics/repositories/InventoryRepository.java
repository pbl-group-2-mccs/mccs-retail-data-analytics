package edu.vt.pbl.retailanalytics.repositories;

import edu.vt.pbl.retailanalytics.entites.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InventoryRepository extends JpaRepository<Inventory, Integer> {
}
