package edu.vt.pbl.retailanalytics.controllers;

import edu.vt.pbl.retailanalytics.dtos.RegionSalesDto;
import edu.vt.pbl.retailanalytics.services.SalesService;
import edu.vt.pbl.retailanalytics.entites.OrderStatus;
import edu.vt.pbl.retailanalytics.entites.SalesOrder;
import edu.vt.pbl.retailanalytics.repositories.SalesOrderRepository;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/sales-orders")
public class SalesOrderController {

    @Autowired
    private SalesOrderRepository salesOrderRepository;
    private SalesService salesService;

    @GetMapping("/region-sales")
    @Operation(summary = "Get total sales by region")
    public ResponseEntity<List<RegionSalesDto>> getTotalSalesByRegion() {
        List<RegionSalesDto> regionSales = salesService.getSalesByRegion();
        return ResponseEntity.ok(regionSales);
    }

    @GetMapping
    public List<SalesOrder> getAllSalesOrders() {
        return salesOrderRepository.findAll();
    }

    @GetMapping("/search")
    @Operation(summary = "Get sales orders within a time period")
    public ResponseEntity<List<SalesOrder>> getSalesOrdersByTimePeriod(
            @RequestParam("startTime") String startTime,
            @RequestParam("endTime") String endTime) {
        LocalDateTime start = LocalDateTime.parse(startTime);
        LocalDateTime end = LocalDateTime.parse(endTime);
        List<SalesOrder> salesOrders = salesOrderRepository.findByOrderDateBetween(start, end);
        return ResponseEntity.ok(salesOrders);
    }

    @PostMapping
    public SalesOrder createSalesOrder(@RequestBody SalesOrder salesOrder) {
        return salesOrderRepository.save(salesOrder);
    }

    @GetMapping("/{id}")
    public ResponseEntity<SalesOrder> getSalesOrderById(@PathVariable Integer id) {
        return salesOrderRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<SalesOrder> updateSalesOrder(@PathVariable Integer id, @RequestBody SalesOrder salesOrderDetails) {
        return salesOrderRepository.findById(id)
                .map(salesOrder -> {
                    salesOrder.setCustomer(salesOrderDetails.getCustomer());
                    salesOrder.setOrderDate(salesOrderDetails.getOrderDate());
                    salesOrder.setTotalAmount(salesOrderDetails.getTotalAmount());
                    salesOrder.setStatus(salesOrderDetails.getStatus());
                    return ResponseEntity.ok(salesOrderRepository.save(salesOrder));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSalesOrder(@PathVariable Integer id) {
        if (salesOrderRepository.existsById(id)) {
            salesOrderRepository.deleteById(id);
            return ResponseEntity.noContent().build();
        }else{
            return ResponseEntity.notFound().build();
        }
    }
}