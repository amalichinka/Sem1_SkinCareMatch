package ru.itis.repository.impl;

import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import ru.itis.config.ModuleConfiguration;
import ru.itis.model.BasketEntity;
import ru.itis.repository.BasketRepository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Slf4j
public class BasketRepositoryImpl implements BasketRepository {

    private final JdbcTemplate jdbcTemplate = ModuleConfiguration.jdbcTemplate();

    private static final String SQL_SELECT_BY_USER_ID = "SELECT basket.id, basket.quantity, products.id AS product_id, products.name, products.price, products.image_url, basket.user_id\n" +
            "FROM basket\n" +
            "JOIN products ON basket.product_id = products.id\n" +
            "WHERE basket.user_id = ?\n";

    private static final String SQL_DELETE_BASKET_ITEM = "DELETE FROM basket WHERE user_id = ? AND product_id = ?";

    private static final String SQL_INSERT_BASKET_ITEM =
            "INSERT INTO basket (user_id, product_id, quantity) VALUES (?, ?, ?)";

    private final BasketItemRowMapper basketItemRowMapper = new BasketItemRowMapper();

    @Override
    public List<BasketEntity> findBasketItemsByUserId(Long userId) {
        try {
            return jdbcTemplate.query(SQL_SELECT_BY_USER_ID, new Object[]{userId}, basketItemRowMapper);
        } catch (EmptyResultDataAccessException e) {
            return List.of();
        }
    }

    @Override
    public void deleteBasketItem(Long userId, Long productId) {
        jdbcTemplate.update(SQL_DELETE_BASKET_ITEM, userId, productId);
    }

    @Override
    public void addBasketItem(Long userId, Long productId, int quantity) {
        jdbcTemplate.update(SQL_INSERT_BASKET_ITEM, userId, productId, quantity);
    }

    private static final class BasketItemRowMapper implements RowMapper<BasketEntity> {

        @Override
        public BasketEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
            return BasketEntity.builder()
                    .id(rs.getLong("id"))
                    .userId(rs.getLong("user_id"))
                    .productId(rs.getLong("product_id"))
                    .productName(rs.getString("name"))
                    .price(rs.getDouble("price"))
                    .quantity(rs.getInt("quantity"))
                    .build();
        }
    }
}
