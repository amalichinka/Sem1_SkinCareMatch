package ru.itis.mapper.impl;

import org.springframework.stereotype.Component;
import ru.itis.dto.ProductRequest;
import ru.itis.dto.ProductResponse;
import ru.itis.mapper.ProductMapper;
import ru.itis.model.ProductEntity;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ProductMapperImpl implements ProductMapper {

    public ProductEntity toEntity(ProductRequest request) {
        return ProductEntity.builder()
                .name(request.getName())
                .price(request.getPrice())
                .imageUrl(request.getImageUrl())
                .build();
    }

    public ProductResponse toResponse(ProductEntity entity) {
        return ProductResponse.builder()
                .id(entity.getId())
                .name(entity.getName())
                .price(entity.getPrice())
                .imageUrl(entity.getImageUrl())
                .build();
    }

    public List<ProductResponse> toResponseList(List<ProductEntity> entities) {
        return entities.stream().map(this::toResponse).collect(Collectors.toList());
    }
}
