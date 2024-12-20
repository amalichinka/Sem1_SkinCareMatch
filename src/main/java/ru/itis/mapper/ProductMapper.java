package ru.itis.mapper;

import ru.itis.dto.ProductRequest;
import ru.itis.dto.ProductResponse;
import ru.itis.model.ProductEntity;

import java.util.List;

public interface ProductMapper {

    ProductEntity toEntity(ProductRequest request);

    ProductResponse toResponse(ProductEntity entity);

    List<ProductResponse> toResponseList(List<ProductEntity> entities);
}
