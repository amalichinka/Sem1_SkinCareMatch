package ru.itis.repository.impl;

import org.springframework.jdbc.core.JdbcTemplate;
import ru.itis.config.ModuleConfiguration;
import ru.itis.model.ProductEntity;
import ru.itis.repository.ProductRepository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class ProductRepositoryImpl implements ProductRepository {

    private final JdbcTemplate jdbcTemplate;

    public ProductRepositoryImpl() {
        this.jdbcTemplate = ModuleConfiguration.jdbcTemplate();
    }

    private static final String SQL_SELECT_ALL_PRODUCTS = "SELECT * FROM products";
    private static final String SQL_SELECT_PRODUCT_BY_ID = "SELECT * FROM products WHERE id = ?";
    private static final String SQL_INSERT_PRODUCT = "INSERT INTO products (name, price, image_url) VALUES (?, ?, ?) RETURNING id";
    private static final String SQL_UPDATE_PRODUCT = "UPDATE products SET name = ?, price = ?, image_url = ? WHERE id = ?";
    private static final String SQL_DELETE_PRODUCT_BY_ID = "DELETE FROM products WHERE id = ?";

    @Override
    public Optional<ProductEntity> findById(Long id) {
        try {
            ProductEntity product = jdbcTemplate.queryForObject(SQL_SELECT_PRODUCT_BY_ID, new Object[]{id}, this::mapRowToProduct);
            return Optional.ofNullable(product);
        } catch (Exception e) {
            return Optional.empty();
        }
    }
    @Override
    public List<ProductEntity> findAll() {
        List<ProductEntity> products = jdbcTemplate.query(SQL_SELECT_ALL_PRODUCTS, this::mapRowToProduct);
        return products;
    }

    @Override
    public ProductEntity save(ProductEntity product) {
        Long generatedId = jdbcTemplate.queryForObject(SQL_INSERT_PRODUCT, new Object[]{
                product.getName(),
                product.getPrice(),
                product.getImageUrl()
        }, Long.class);

        product.setId(generatedId);
        return product;
    }

    @Override
    public ProductEntity update(ProductEntity product) {
        int rowsAffected = jdbcTemplate.update(SQL_UPDATE_PRODUCT,
                product.getName(),
                product.getPrice(),
                product.getImageUrl(),
                product.getId()
        );

        if (rowsAffected > 0) {
            return product;
        } else {
            throw new RuntimeException("Failed to update product with id: " + product.getId());
        }
    }
    @Override
    public boolean deleteById(Long id) {
        int rowsAffected = jdbcTemplate.update(SQL_DELETE_PRODUCT_BY_ID, id);
        return rowsAffected > 0;
    }

    private ProductEntity mapRowToProduct(ResultSet rs, int rowNum) throws SQLException {
        return ProductEntity.builder()
                .id(rs.getLong("id"))
                .name(rs.getString("name"))
                .price(rs.getDouble("price"))
                .imageUrl(rs.getString("image_url"))
                .build();
    }
}
