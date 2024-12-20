package ru.itis.repository;

import ru.itis.model.ProductEntity;

import java.util.List;
import java.util.Optional;

public interface ProductRepository {

    Optional<ProductEntity> findById(Long id);

    List<ProductEntity> findAll();

    ProductEntity save(ProductEntity product);

    ProductEntity update(ProductEntity product);

    boolean deleteById(Long id);
}
