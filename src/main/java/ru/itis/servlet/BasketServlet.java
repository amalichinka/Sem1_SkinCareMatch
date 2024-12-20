package ru.itis.servlet;

import ru.itis.service.BasketService;
import ru.itis.service.impl.BasketServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/basket")
public class BasketServlet extends HttpServlet {
    private BasketService basketService;

    @Override
    public void init() {
        this.basketService = new BasketServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("/signIn");
            return;
        }

        Long userId = (Long) session.getAttribute("userId");
        req.setAttribute("basketItems", basketService.getBasketItemsByUserId(userId));
        req.getRequestDispatcher("/jsp/basket.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("/signIn");
            return;
        }

        Long userId = (Long) session.getAttribute("userId");
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            long productId;
            int quantity = 1;

            try {
                productId = Long.parseLong(req.getParameter("productId"));
            } catch (NumberFormatException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
                return;
            }

            basketService.addItemToBasket(userId, productId, quantity);
        } else if ("remove".equals(action)) {
            long productId;

            try {
                productId = Long.parseLong(req.getParameter("product_id"));
            } catch (NumberFormatException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
                return;
            }

            basketService.removeItemFromBasket(userId, productId);
        }

        resp.sendRedirect("/basket");
    }
}