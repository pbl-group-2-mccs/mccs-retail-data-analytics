package edu.vt.pbl.retailanalytics.controllers;

import edu.vt.pbl.retailanalytics.entites.Inventory;
import edu.vt.pbl.retailanalytics.repositories.InventoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/inventory")
public class InventoryController {

    @Autowired
    private InventoryRepository inventoryRepository;

    @GetMapping
    public List<Inventory> getAllInventory() {
        return inventoryRepository.findAll();
    }

    @PostMapping
    public Inventory createInventory(@RequestBody Inventory inventory) {
        return inventoryRepository.save(inventory);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Inventory> getInventoryById(@PathVariable Integer id) {
        return inventoryRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Inventory> updateInventory(@PathVariable Integer id, @RequestBody Inventory inventoryDetails) {
        return inventoryRepository.findById(id)
                .map(inventory -> {
                    inventory.setProductName(inventoryDetails.getProductName());
                    inventory.setProductLine(inventoryDetails.getProductLine());
                    inventory.setQuantity(inventoryDetails.getQuantity());
                    inventory.setPrice(inventoryDetails.getPrice());
                    return ResponseEntity.ok(inventoryRepository.save(inventory));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteInventory(@PathVariable Integer id) {
        // Check if the inventory item exists
        if (inventoryRepository.existsById(id)) {
            inventoryRepository.deleteById(id); // Use deleteById to avoid returning an object
            return ResponseEntity.noContent().build(); // Return 204 No Content
        } else {
            return ResponseEntity.notFound().build(); // Return 404 Not Found if inventory not found
        }
    }
}