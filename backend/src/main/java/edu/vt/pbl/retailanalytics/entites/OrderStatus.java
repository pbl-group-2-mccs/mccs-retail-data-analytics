package edu.vt.pbl.retailanalytics.entites;

public enum OrderStatus {
    PENDING,
    PROCESSING,
    COMPLETED,
    CANCELLED;

    public static OrderStatus fromString(String status) {
        try {
            return OrderStatus.valueOf(status.toUpperCase());
        } catch (IllegalArgumentException e) {
            return PENDING; // Default value if status string is invalid
        }
    }

    @Override
    public String toString() {
        return name();
    }
}