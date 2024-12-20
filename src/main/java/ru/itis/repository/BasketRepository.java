package ru.itis.repository;

import ru.itis.model.BasketEntity;
import java.util.List;

public interface BasketRepository {
    List<BasketEntity> findBasketItemsByUserId(Long userId);
    void deleteBasketItem(Long userId, Long productId);
    void addBasketItem(Long userId, Long productId, int quantity);
}
