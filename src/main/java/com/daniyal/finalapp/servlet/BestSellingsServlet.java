package com.daniyal.finalapp.servlet;

import com.daniyal.finalapp.dao.SellDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/get_bestsellers")
public class BestSellingsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String date = req.getParameter("date");

        LocalDate releaseDate = LocalDate.parse(date);

        int year = releaseDate.getYear();
        int month = releaseDate.getMonthValue();
        SellDAO sellDAO = new SellDAO();

        List<Object[]> topSellsPerMonth = sellDAO.getTopSellsPerMonth(year, month);
        req.getSession().setAttribute("bestSeller", topSellsPerMonth);
        String referer = req.getHeader("Referer");

        if (referer != null && !referer.isEmpty()) {
            resp.sendRedirect(referer);
        } else {
            resp.sendRedirect("member.jsp");
        }
    }
}
