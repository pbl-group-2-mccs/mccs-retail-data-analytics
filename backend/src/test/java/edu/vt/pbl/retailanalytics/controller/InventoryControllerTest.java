// src/test/java/edu/vt/pbl/retailanalytics/controller/InventoryControllerTest.java
package edu.vt.pbl.retailanalytics.controller;

import edu.vt.pbl.retailanalytics.container.MySQLTestContainer;
import edu.vt.pbl.retailanalytics.model.Inventory;
import edu.vt.pbl.retailanalytics.repository.InventoryRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.math.BigDecimal;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
class InventoryControllerTest extends MySQLTestContainer {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private InventoryRepository inventoryRepository;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    @WithMockUser(roles = "ADMIN")
    void getAllProducts() throws Exception {
        mockMvc.perform(get("/api/inventory")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void createProduct() throws Exception {
        Inventory product = new Inventory();
        product.setProductName("Test Product");
        product.setProductLine("Test Line");
        product.setQuantity(10);
        product.setPrice(new BigDecimal("99.99"));

        mockMvc.perform(post("/api/inventory")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(product)))
                .andExpect(status().isCreated());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void updateProduct() throws Exception {
        // First create a product
        Inventory product = new Inventory();
        product.setProductName("Initial Product");
        product.setProductLine("Test Line");
        product.setQuantity(10);
        product.setPrice(new BigDecimal("99.99"));
        Inventory savedProduct = inventoryRepository.save(product);

        // Update the product
        savedProduct.setProductName("Updated Product");

        mockMvc.perform(put("/api/inventory/" + savedProduct.getProductId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(savedProduct)))
                .andExpect(status().isOk());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void deleteProduct() throws Exception {
        // First create a product
        Inventory product = new Inventory();
        product.setProductName("Product to Delete");
        product.setProductLine("Test Line");
        product.setQuantity(10);
        product.setPrice(new BigDecimal("99.99"));
        Inventory savedProduct = inventoryRepository.save(product);

        mockMvc.perform(delete("/api/inventory/" + savedProduct.getProductId()))
                .andExpect(status().isOk());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void getProductById() throws Exception {
        // First create a product
        Inventory product = new Inventory();
        product.setProductName("Test Product");
        product.setProductLine("Test Line");
        product.setQuantity(10);
        product.setPrice(new BigDecimal("99.99"));
        Inventory savedProduct = inventoryRepository.save(product);

        mockMvc.perform(get("/api/inventory/" + savedProduct.getProductId())
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.productName").value("Test Product"));
    }
}