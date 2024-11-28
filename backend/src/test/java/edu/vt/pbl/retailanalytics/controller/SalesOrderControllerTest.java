package edu.vt.pbl.retailanalytics.controller;

import edu.vt.pbl.retailanalytics.entites.SalesOrder;
import edu.vt.pbl.retailanalytics.repositories.SalesOrderRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.web.servlet.MockMvc;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@ExtendWith(MockitoExtension.class)
class SalesOrderControllerTest {

    @Mock
    private SalesOrderRepository salesOrderRepository;

    @InjectMocks
    private SalesOrderController salesOrderController;

    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.standaloneSetup(salesOrderController).build();
    }

    @Test
    void getAllSalesOrders_ShouldReturnListOfSalesOrders() throws Exception {
        SalesOrder order1 = new SalesOrder();
        order1.setOrderId(1);
        order1.setTotalAmount(new BigDecimal("100.00"));
        order1.setOrderDate(LocalDateTime.now());

        when(salesOrderRepository.findAll()).thenReturn(Arrays.asList(order1));

        mockMvc.perform(get("/api/sales-orders")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON))
                .andExpect(jsonPath("$[0].totalAmount").value(100.00));
    }

    @Test
    void createSalesOrder_ShouldReturnCreatedSalesOrder() throws Exception {
        SalesOrder newOrder = new SalesOrder();
        newOrder.setTotalAmount(new BigDecimal("150.00"));
        newOrder.setOrderDate(LocalDateTime.now());

        when(salesOrderRepository.save(any(SalesOrder.class))).thenReturn(newOrder);

        mockMvc.perform(post("/api/sales-orders")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"totalAmount\":150.00}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.totalAmount").value(150.00));
    }

    @Test
    void getSalesOrderById_ShouldReturnSalesOrder() throws Exception {
        SalesOrder order = new SalesOrder();
        order.setOrderId(1);
        order.setTotalAmount(new BigDecimal("100.00"));

        when(salesOrderRepository.findById(1)).thenReturn(Optional.of(order));

        mockMvc.perform(get("/api/sales-orders/1")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.totalAmount").value(100.00));
    }

    @Test
    void updateSalesOrder_ShouldReturnUpdatedSalesOrder() throws Exception {
        SalesOrder existingOrder = new SalesOrder();
        existingOrder.setOrderId(1);
        existingOrder.setTotalAmount(new BigDecimal("100.00"));

        when(salesOrderRepository.findById(1)).thenReturn(Optional.of(existingOrder));
        when(salesOrderRepository.save(any(SalesOrder.class))).thenReturn(existingOrder);

        mockMvc.perform(put("/api/sales-orders/1")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"totalAmount\":200.00}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.totalAmount").value(100.00));
    }

    @Test
    void deleteSalesOrder_ShouldReturnNoContent() throws Exception {
        when(salesOrderRepository.existsById(1)).thenReturn(true);

        mockMvc.perform(delete("/api/sales-orders/1"))
                .andExpect(status().isNoContent());

        verify(salesOrderRepository, times(1)).deleteById(1);
    }
}