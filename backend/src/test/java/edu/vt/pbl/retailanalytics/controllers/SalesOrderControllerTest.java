package edu.vt.pbl.retailanalytics.controllers;

import edu.vt.pbl.retailanalytics.entites.Inventory;
import edu.vt.pbl.retailanalytics.entites.OrderStatus;
import edu.vt.pbl.retailanalytics.entites.SalesOrder;
import edu.vt.pbl.retailanalytics.entites.SalesOrderItems;
import edu.vt.pbl.retailanalytics.repositories.SalesOrderRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class SalesOrderControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private SalesOrderRepository salesOrderRepository;

    private SalesOrder createTestSalesOrder() {
        // Create test order items
        SalesOrderItems orderItem = new SalesOrderItems();
        orderItem.setOrderItemId(1);
        orderItem.setQuantity(2);
        orderItem.setPrice(50.0);

        // Create test inventory
        Inventory inventory = new Inventory();
        inventory.setProductId(1);
        inventory.setProductName("Test Product");
        inventory.setQuantity(100);
        inventory.setPrice(50.0);
        orderItem.setProduct(inventory);

        // Create test sales order
        SalesOrder order = new SalesOrder();
        order.setId(1);
        order.setCustomer("Test Customer");
        order.setOrderDate(LocalDateTime.now());
        order.setTotalAmount(new BigDecimal("100.00"));
        order.setStatus(OrderStatus.PENDING);
        
        // Set up bidirectional relationship
        orderItem.setSalesOrder(order);
        Set<SalesOrderItems> items = new HashSet<>();
        items.add(orderItem);

        return order;
    }

    @Test
    void getAllSalesOrdersSuccess() throws Exception {
        SalesOrder order = createTestSalesOrder();
        when(salesOrderRepository.findAll()).thenReturn(Arrays.asList(order));

        mockMvc.perform(get("/api/sales-orders")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    void getSalesOrdersByTimePeriodSuccess() throws Exception {
        LocalDateTime start = LocalDateTime.now().minusDays(1);
        LocalDateTime end = LocalDateTime.now();
        
        SalesOrder order = createTestSalesOrder();
        when(salesOrderRepository.findByOrderDateBetween(any(), any()))
                .thenReturn(Arrays.asList(order));

        mockMvc.perform(get("/api/sales-orders/search")
                .param("startTime", start.toString())
                .param("endTime", end.toString())
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    void createSalesOrderSuccess() throws Exception {
        SalesOrder order = createTestSalesOrder();
        when(salesOrderRepository.save(any(SalesOrder.class))).thenReturn(order);

        mockMvc.perform(post("/api/sales-orders")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(order)))
                .andExpect(status().isOk());
    }
} 