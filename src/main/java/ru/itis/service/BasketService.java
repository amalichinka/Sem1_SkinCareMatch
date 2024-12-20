package ru.itis.service;

import ru.itis.model.BasketEntity;;

import java.util.List;


public interface BasketService {
    List<BasketEntity> getBasketItemsByUserId(Long userId);
    void removeItemFromBasket(Long userId, Long productId);
    void addItemToBasket(Long userId, Long productId, int quantity);
}

