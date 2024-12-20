package ru.itis.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/skin-test")
public class SkinTypeTestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/skinTest.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int oily = Integer.parseInt(req.getParameter("oily"));
        int breakouts = Integer.parseInt(req.getParameter("breakouts"));
        int tightness = Integer.parseInt(req.getParameter("tightness"));
        int sunReaction = Integer.parseInt(req.getParameter("sunReaction"));

        int oilyScore = 0;
        int dryScore = 0;
        int combinationScore = 0;
        int normalScore = 0;

        // Подсчёт для жирной кожи
        if (oily == 1) oilyScore += 3;
        if (breakouts == 1) oilyScore += 3;

        // Подсчёт для сухой кожи
        if (tightness == 1) dryScore += 3;
        if (sunReaction == 1) dryScore += 3;

        // Подсчёт для комбинированной кожи
        if (oily == 2) combinationScore += 2;
        if (breakouts == 2) combinationScore += 2;
        if (tightness == 2) combinationScore += 2;
        if (sunReaction == 3) combinationScore += 1;

        // Подсчёт для нормальной кожи
        if (oily == 4) normalScore += 3;
        if (breakouts == 4) normalScore += 3;
        if (tightness == 4) normalScore += 3;
        if (sunReaction == 3) normalScore += 3;

        // Определение типа кожи
        String skinType = "Unknown";
        if (oilyScore > dryScore && oilyScore > combinationScore && oilyScore > normalScore) {
            skinType = "Oily";
        } else if (dryScore > oilyScore && dryScore > combinationScore && dryScore > normalScore) {
            skinType = "Dry";
        } else if (combinationScore > oilyScore && combinationScore > dryScore && combinationScore > normalScore) {
            skinType = "Combination";
        } else if (normalScore > oilyScore && normalScore > dryScore && normalScore > combinationScore) {
            skinType = "Normal";
        } else if (oilyScore >= dryScore && oilyScore >= combinationScore) {
            skinType = "Oily";
        }

        HttpSession session = req.getSession();
        session.setAttribute("skinType", skinType);

        resp.sendRedirect("/catalog");
    }
}
