package ru.itis.service;

import ru.itis.dto.ProductRequest;
import ru.itis.dto.ProductResponse;

import java.util.List;

public interface ProductService {

    ProductResponse createProduct(ProductRequest request);

    ProductResponse getProductById(Long id);

    List<ProductResponse> getAllProducts();

    ProductResponse updateProduct(Long id, ProductRequest request);

    boolean deleteProduct(Long id);
}
