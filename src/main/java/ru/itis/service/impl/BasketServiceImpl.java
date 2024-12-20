package ru.itis.service.impl;

import ru.itis.model.BasketEntity;
import ru.itis.repository.impl.BasketRepositoryImpl;
import ru.itis.service.BasketService;

import java.util.List;

public class BasketServiceImpl implements BasketService {

    private final BasketRepositoryImpl basketRepository;

    public BasketServiceImpl() {
        this.basketRepository = new BasketRepositoryImpl();
    }

    @Override
    public List<BasketEntity> getBasketItemsByUserId(Long userId) {
        return basketRepository.findBasketItemsByUserId(userId);
    }

    @Override
    public void removeItemFromBasket(Long userId, Long productId) {
        basketRepository.deleteBasketItem(userId, productId);
    }

    @Override
    public void addItemToBasket(Long userId, Long productId, int quantity) {
        basketRepository.addBasketItem(userId, productId, quantity);
    }
}
