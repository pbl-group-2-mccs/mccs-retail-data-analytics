package edu.vt.pbl.retailanalytics.entites;

public enum OrderStatus {
    PENDING("Pending"),
    COMPLETED("Completed"),
    CANCELLED("Cancelled");

    private final String value;

    OrderStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static OrderStatus fromString(String status) {
        if (status != null) {
            for (OrderStatus os : OrderStatus.values()) {
                if (os.getValue().equalsIgnoreCase(status) ||
                        os.name().equalsIgnoreCase(status)) {
                    return os;
                }
            }
        }
        throw new IllegalArgumentException("No enum constant for status: " + status);
    }
}