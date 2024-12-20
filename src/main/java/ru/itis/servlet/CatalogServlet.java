package ru.itis.servlet;

import ru.itis.dto.ProductResponse;
import ru.itis.repository.impl.ProductRepositoryImpl;
import ru.itis.service.ProductService;
import ru.itis.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/catalog")
public class CatalogServlet extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductServiceImpl(new ProductRepositoryImpl(), new ru.itis.mapper.impl.ProductMapperImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String skinType = (String) session.getAttribute("skinType");

        if (skinType != null) {
            req.setAttribute("skinType", skinType);
            session.removeAttribute("skinType");
        }

        List<ProductResponse> products = productService.getAllProducts();
        req.setAttribute("products", products);
        req.setAttribute("skinType", skinType);

        req.getRequestDispatcher("/jsp/catalog.jsp").forward(req, resp);

    }
}
