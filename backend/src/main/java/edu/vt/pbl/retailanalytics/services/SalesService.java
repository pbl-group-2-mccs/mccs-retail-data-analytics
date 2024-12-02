package edu.vt.pbl.retailanalytics.services;

import edu.vt.pbl.retailanalytics.dtos.RegionSalesDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SalesService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 날짜별 총 매출을 조회하는 메서드
    public List<Map<String, Object>> getSalesByDate() {
        String query = """
            SELECT DATE(order_date) AS order_date, SUM(total_amount) AS total_sales
            FROM sales_order
            GROUP BY DATE(order_date)
            ORDER BY order_date;
        """;
        return jdbcTemplate.queryForList(query);
    }

    // 지역별 총 매출을 조회하는 메서드
    public List<RegionSalesDto> getSalesByRegion() {
        String query = """
            SELECT c.state AS region, SUM(so.total_amount) AS total_sales
            FROM sales_order so
            INNER JOIN customers c ON so.customer_id = c.customer_id
            GROUP BY c.state
            ORDER BY total_sales DESC;
        """;

        return jdbcTemplate.query(query, (rs, rowNum) -> new RegionSalesDto(
                rs.getString("region"),
                rs.getDouble("total_sales")
        ));
    }
}
