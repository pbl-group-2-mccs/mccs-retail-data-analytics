package edu.vt.pbl.retailanalytics.controllers;

import edu.vt.pbl.retailanalytics.entites.*;
import edu.vt.pbl.retailanalytics.repositories.SalesOrderRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.time.LocalDateTime;
import java.util.Arrays;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

//@SpringBootTest
//@AutoConfigureMockMvc
//class SalesOrderControllerTest {
//
//    @Autowired
//    private MockMvc mockMvc;
//
//    @Autowired
//    private ObjectMapper objectMapper;
//
//    @MockBean
//    private SalesOrderRepository salesOrderRepository;
//
//    private Customer createTestCustomer() {
//        return Customer.builder()
//                .customerId(1)
//                .name("Test Customer")
//                .email("test@example.com")
//                .phone("1234567890")
//                .addressLine1("123 Test St")
//                .city("Test City")
//                .state("Test State")
//                .zipCode("12345")
//                .country("Test Country")
//                .build();
//    }
//
//    private SalesOrder createTestSalesOrder() {
//        Customer customer = createTestCustomer();
//
////        return SalesOrder.builder()
////                .orderId(1)
////                .customer(customer)
////                .orderDate(LocalDateTime.now())
////                .totalAmount(100.0)
////                .status(OrderStatus.PENDING)
////                .build();
//    }
//
//    @Test
//    void getAllSalesOrdersSuccess() throws Exception {
//        SalesOrder order = createTestSalesOrder();
//        when(salesOrderRepository.findAll()).thenReturn(Arrays.asList(order));
//
//        mockMvc.perform(get("/api/sales-orders")
//                .contentType(MediaType.APPLICATION_JSON))
//                .andExpect(status().isOk());
//    }
//
//    @Test
//    void getSalesOrdersByTimePeriodSuccess() throws Exception {
//        LocalDateTime start = LocalDateTime.now().minusDays(1);
//        LocalDateTime end = LocalDateTime.now();
//
//        SalesOrder order = createTestSalesOrder();
//        when(salesOrderRepository.findByOrderDateBetween(any(), any()))
//                .thenReturn(Arrays.asList(order));
//
//        mockMvc.perform(get("/api/sales-orders/search")
//                .param("startTime", start.toString())
//                .param("endTime", end.toString())
//                .contentType(MediaType.APPLICATION_JSON))
//                .andExpect(status().isOk());
//    }
//
//    @Test
//    void createSalesOrderSuccess() throws Exception {
//        SalesOrder order = createTestSalesOrder();
//        when(salesOrderRepository.save(any(SalesOrder.class))).thenReturn(order);
//
//        mockMvc.perform(post("/api/sales-orders")
//                .contentType(MediaType.APPLICATION_JSON)
//                .content(objectMapper.writeValueAsString(order)))
//                .andExpect(status().isOk());
//    }
//}