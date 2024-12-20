package ru.itis.service.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import ru.itis.dto.ProductRequest;
import ru.itis.dto.ProductResponse;
import ru.itis.mapper.ProductMapper;
import ru.itis.model.ProductEntity;
import ru.itis.repository.ProductRepository;
import ru.itis.service.ProductService;

import java.util.List;
import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductMapper productMapper;

    @Override
    public ProductResponse createProduct(ProductRequest request) {
        if (request.getName() == null || request.getName().isBlank())
            throw new IllegalArgumentException("Product name cannot be empty");

        if (request.getPrice() == null || request.getPrice() <= 0)
            throw new IllegalArgumentException("Invalid product price");

        ProductEntity productEntity = productMapper.toEntity(request);
        ProductEntity savedProduct = productRepository.save(productEntity);

        return productMapper.toResponse(savedProduct);
    }

    @Override
    public ProductResponse getProductById(Long id) {
        ProductEntity product = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        return productMapper.toResponse(product);
    }

    @Override
    public List<ProductResponse> getAllProducts() {
        List<ProductEntity> products = productRepository.findAll();
        return productMapper.toResponseList(products);
    }

    @Override
    public ProductResponse updateProduct(Long id, ProductRequest request) {
        ProductEntity existingProduct = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        ProductEntity updatedEntity = productMapper.toEntity(request);
        updatedEntity.setId(existingProduct.getId());

        ProductEntity updatedProduct = productRepository.update(updatedEntity);
        return productMapper.toResponse(updatedProduct);
    }

    @Override
    public boolean deleteProduct(Long id) {
        return productRepository.deleteById(id);
    }
}
