package edu.vt.pbl.retailanalytics.controllers;

import edu.vt.pbl.retailanalytics.dtos.RegionSalesDto;
import edu.vt.pbl.retailanalytics.services.SalesService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/visualization")
public class VisualizationController {

    @Autowired
    private SalesService salesService;

    @GetMapping("/sales-by-region")
    @Operation(summary = "Get total sales by region")
    public ResponseEntity<List<RegionSalesDto>> getTotalSalesByRegion() {
        List<RegionSalesDto> regionSales = salesService.getSalesByRegion();
        return ResponseEntity.ok(regionSales);
    }
    @GetMapping("/sales-by-date")
    public List<Map<String, Object>> getSalesByDate() {
        return salesService.getSalesByDate();
    }
}
