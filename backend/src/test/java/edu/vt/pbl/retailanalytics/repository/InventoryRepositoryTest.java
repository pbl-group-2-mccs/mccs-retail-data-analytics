// src/test/java/edu/vt/pbl/retailanalytics/repository/InventoryRepositoryTest.java
// repository test

package edu.vt.pbl.retailanalytics.repository;

import edu.vt.pbl.retailanalytics.container.MySQLTestContainer;
import edu.vt.pbl.retailanalytics.model.Inventory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.math.BigDecimal;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class InventoryRepositoryTest extends MySQLTestContainer {

    @Autowired
    private InventoryRepository inventoryRepository;

    @Test
    void shouldSaveAndRetrieveProduct() {
        // Create test product
        Inventory product = new Inventory();
        product.setProductName("Test Product");
        product.setProductLine("Test Line");
        product.setQuantity(10);
        product.setPrice(new BigDecimal("99.99"));

        // Save product
        Inventory savedProduct = inventoryRepository.save(product);

        // Retrieve product
        Optional<Inventory> foundProduct = inventoryRepository.findById(savedProduct.getProductId());

        // Verify
        assertThat(foundProduct).isPresent();
        assertThat(foundProduct.get().getProductName()).isEqualTo("Test Product");
    }
}