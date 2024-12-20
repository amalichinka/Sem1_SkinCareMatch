package ru.itis.model;

import lombok.*;

@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BasketEntity {
    private Long id;

    private Long userId;

    private Long productId;

    private String productName;

    private Double price;

    private Integer quantity;
}
