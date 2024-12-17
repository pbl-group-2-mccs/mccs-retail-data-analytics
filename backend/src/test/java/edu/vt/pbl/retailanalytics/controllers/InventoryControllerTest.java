package edu.vt.pbl.retailanalytics.controllers;

import edu.vt.pbl.retailanalytics.entites.Inventory;
import edu.vt.pbl.retailanalytics.repositories.InventoryRepository;
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
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class InventoryControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private InventoryRepository inventoryRepository;

    private Inventory createTestInventory() {
        return Inventory.builder()
                .productId(1)
                .productName("Test Product")
                .productLine("Test Line")
                .quantity(100)
                .unitPrice(50.0)
                .createdAt(LocalDateTime.now())
                .build();
    }

    @Test
    void getAllInventorySuccess() throws Exception {
        Inventory inventory = createTestInventory();
        when(inventoryRepository.findAll()).thenReturn(Arrays.asList(inventory));

        mockMvc.perform(get("/api/inventory")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    void createInventorySuccess() throws Exception {
        Inventory inventory = createTestInventory();
        when(inventoryRepository.save(any(Inventory.class))).thenReturn(inventory);

        mockMvc.perform(post("/api/inventory")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(inventory)))
                .andExpect(status().isOk());
    }

    @Test
    void getInventoryByIdSuccess() throws Exception {
        Inventory inventory = createTestInventory();
        when(inventoryRepository.findById(1)).thenReturn(Optional.of(inventory));

        mockMvc.perform(get("/api/inventory/1")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    void updateInventorySuccess() throws Exception {
        Inventory inventory = createTestInventory();
        when(inventoryRepository.findById(1)).thenReturn(Optional.of(inventory));
        when(inventoryRepository.save(any(Inventory.class))).thenReturn(inventory);

        mockMvc.perform(put("/api/inventory/1")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(inventory)))
                .andExpect(status().isOk());
    }

    @Test
    void deleteInventorySuccess() throws Exception {
        when(inventoryRepository.existsById(1)).thenReturn(true);

        mockMvc.perform(delete("/api/inventory/1"))
                .andExpect(status().isNoContent());
    }

    @Test
    void getInventoryByIdNotFound() throws Exception {
        when(inventoryRepository.findById(1)).thenReturn(Optional.empty());

        mockMvc.perform(get("/api/inventory/1")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }
} 