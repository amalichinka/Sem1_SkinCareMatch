package ru.itis.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductEntity{
    private Long id;

    private String name;

    private Double price;

    private String imageUrl;
}
