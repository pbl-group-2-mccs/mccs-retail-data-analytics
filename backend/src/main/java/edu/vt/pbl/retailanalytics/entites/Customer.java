package edu.vt.pbl.retailanalytics.entites;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
@Entity
@Table(name = "customers")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer customerId;

    @Column(nullable = false)
    @Size(max = 100)
    private String name;

    @Column(nullable = false, unique = true)
    @Email
    @Size(max = 100)
    private String email;

    @Column(nullable = false)
    @Size(max = 15)
    private String phone;

    @Column(name = "address_line1", nullable = false)
    @Size(max = 255)
    private String addressLine1;

    @Column(name = "address_line2")
    @Size(max = 255)
    private String addressLine2;

    @Column(nullable = false)
    @Size(max = 100)
    private String city;

    @Column(nullable = false)
    @Size(max = 100)
    private String state;

    @Column(name = "zip_code", nullable = false)
    @Size(max = 10)
    private String zipCode;

    @Column(nullable = false)
    @Size(max = 100)
    private String country;
}