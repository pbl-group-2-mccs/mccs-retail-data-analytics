package edu.vt.pbl.retailanalytics.entites;

import jakarta.persistence.*;

@Entity
@Table(name = "sales_order_items")

public class SalesOrderItems {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderItemId;

    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false)
    private SalesOrder salesOrder; // Reference to the SalesOrder entity

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Inventory product; // Reference to the Inventory entity

    @Column(nullable = false)
    private Integer quantity;

    @Column(nullable = false)
    private Double price; // Price at the time of sale

    // Getters and Setters
    public Integer getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }

    public SalesOrder getSalesOrder() {
        return salesOrder;
    }

    public void setSalesOrder(SalesOrder salesOrder) {
        this.salesOrder = salesOrder;
    }

    public Inventory getProduct() {
        return product;
    }

    public void setProduct(Inventory product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}