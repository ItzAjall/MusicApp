package com.daniyal.finalapp.servlet;

import com.daniyal.finalapp.dao.AlbumDAO;
import com.daniyal.finalapp.dao.SellDAO;
import com.daniyal.finalapp.dao.UserDAO;
import com.daniyal.finalapp.model.Album;
import com.daniyal.finalapp.model.Sell;
import com.daniyal.finalapp.model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/submitOrder")
public class SubmitOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Users user = (Users) req.getSession().getAttribute("user");
        UserDAO userDAO = new UserDAO();
        SellDAO sellDAO = new SellDAO();

        for (Album album : user.getCart().keySet()) {
            user.addAlbum(album,user.getCart().get(album));
            for (int i = 0; i < user.getCart().get(album); i++) {
                Sell sell = new Sell(album, user);
                sellDAO.save(sell);
            }
        }
        user.clearCart();
        userDAO.update(user);
        resp.sendRedirect("member.jsp");
    }
}
