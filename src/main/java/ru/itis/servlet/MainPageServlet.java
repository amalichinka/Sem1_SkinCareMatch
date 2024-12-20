package ru.itis.servlet;

import ru.itis.filter.AuthFilter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/main")
public class MainPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute(AuthFilter.AUTHORIZATION) != null) {
            String userName = (String) session.getAttribute("userName");
            String userEmail = (String) session.getAttribute("userEmail");
            req.setAttribute("userName", userName);
            req.setAttribute("userEmail", userEmail);
            req.getRequestDispatcher("jsp/main.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/signIn");
        }
    }
}


