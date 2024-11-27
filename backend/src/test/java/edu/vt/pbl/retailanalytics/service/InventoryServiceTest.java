// src/test/java/com/example/inventory/service/InventoryServiceTest.java
package com.example.inventory.service;

import com.example.inventory.model.Product;
import com.example.inventory.repository.ProductRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class InventoryServiceTest {

    @Mock
    private ProductRepository productRepository;

    @InjectMocks
    private InventoryService inventoryService;

    private Product testProduct;

    @BeforeEach
    void setUp() {
        testProduct = new Product();
        testProduct.setId(1L);
        testProduct.setProductName("Test Product");
        testProduct.setProductLine("Test Line");
        testProduct.setQuantity(10);
        testProduct.setPrice(new BigDecimal("99.99"));
    }

    @Test
    void getAllProducts_ShouldReturnAllProducts() {
        when(productRepository.findAll()).thenReturn(Arrays.asList(testProduct));

        List<Product> products = inventoryService.getAllProducts();

        assertNotNull(products);
        assertEquals(1, products.size());
        assertEquals("Test Product", products.get(0).getProductName());
    }

    @Test
    void getProductById_ShouldReturnProduct() {
        when(productRepository.findById(1L)).thenReturn(Optional.of(testProduct));

        Optional<Product> product = inventoryService.getProductById(1L);

        assertTrue(product.isPresent());
        assertEquals("Test Product", product.get().getProductName());
    }

    @Test
    void createProduct_ShouldReturnCreatedProduct() {
        when(productRepository.save(any(Product.class))).thenReturn(testProduct);

        Product created = inventoryService.createProduct(testProduct);

        assertNotNull(created);
        assertEquals("Test Product", created.getProductName());
    }

    @Test
    void updateProduct_ShouldReturnUpdatedProduct() {
        when(productRepository.findById(1L)).thenReturn(Optional.of(testProduct));
        when(productRepository.save(any(Product.class))).thenReturn(testProduct);

        Optional<Product> updated = inventoryService.updateProduct(1L, testProduct);

        assertTrue(updated.isPresent());
        assertEquals("Test Product", updated.get().getProductName());
    }

    @Test
    void deleteProduct_ShouldDeleteSuccessfully() {
        doNothing().when(productRepository).deleteById(1L);

        inventoryService.deleteProduct(1L);

        verify(productRepository, times(1)).deleteById(1L);
    }
}