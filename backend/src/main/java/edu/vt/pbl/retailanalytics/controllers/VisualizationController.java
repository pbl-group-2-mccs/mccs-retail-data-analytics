package edu.vt.pbl.retailanalytics.controllers;

import edu.vt.pbl.retailanalytics.services.SalesService;
import org.springframework.beans.factory.annotation.Autowired;
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

    // 날짜별 매출 데이터를 반환하는 엔드포인트
    @GetMapping("/sales-by-date")
    public List<Map<String, Object>> getSalesByDate() {
        return salesService.getSalesByDate();
    }
}
