package com.daniyal.finalapp.servlet;

import com.daniyal.finalapp.dao.GenreDAO;
import com.daniyal.finalapp.model.Genre;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/add_genre")
public class GenreServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");

        GenreDAO genreDAO = new GenreDAO();

        if (!genreDAO.isGenreExists(name)) {
            response.getWriter().println("Genre already exists");
            return;
        }

        Genre genre = new Genre(name);

        genreDAO.save(genre);
        response.sendRedirect("admin.jsp");
    }
}
