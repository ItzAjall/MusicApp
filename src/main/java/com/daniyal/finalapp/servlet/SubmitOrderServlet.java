package com.daniyal.finalapp.servlet;

import com.daniyal.finalapp.dao.AlbumDAO;
import com.daniyal.finalapp.dao.UserDAO;
import com.daniyal.finalapp.model.Album;
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

        for (Album album : user.getCart().keySet()) {
            user.addAlbum(album,user.getCart().get(album));
        }
        user.clearCart();
        userDAO.update(user);
        resp.sendRedirect("member.jsp");
    }
}
