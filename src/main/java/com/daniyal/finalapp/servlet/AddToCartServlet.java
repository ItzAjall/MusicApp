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

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Users user = (Users) req.getSession().getAttribute("user");
        int albumId = Integer.parseInt(req.getParameter("id"));
        int quantity =Integer.parseInt(req.getParameter("qty"));

        UserDAO userDAO = new UserDAO();
        AlbumDAO albumDAO = new AlbumDAO();
        Album album = albumDAO.findById(albumId);

        for (int i = 0; i < quantity; i++) {
            user.addToCart(album);
        }

        userDAO.update(user);
        resp.sendRedirect("member.jsp");
    }
}
