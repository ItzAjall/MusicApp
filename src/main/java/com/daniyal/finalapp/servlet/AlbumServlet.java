package com.daniyal.finalapp.servlet;

import com.daniyal.finalapp.dao.AlbumDAO;
import com.daniyal.finalapp.dao.GenreDAO;
import com.daniyal.finalapp.dao.SingerDAO;
import com.daniyal.finalapp.model.Album;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.time.LocalDate;

@WebServlet("/add_album")
@MultipartConfig
public class AlbumServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        int singerId = Integer.parseInt(request.getParameter("singerId"));
        int genreId = Integer.parseInt(request.getParameter("genreId"));
        String albumName = request.getParameter("albumName");
        LocalDate releaseDate = LocalDate.parse(request.getParameter("releaseDate"));
        int albumPrice = Integer.parseInt(request.getParameter("albumPrice"));

        Part music = request.getPart("music");


        String uploadPath = System.getProperty("user.dir") + File.separator + "uploads";

        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = Paths.get(music.getSubmittedFileName())
                .getFileName()
                .toString();

        String filePath = uploadPath + File.separator + fileName;

        music.write(filePath);

        AlbumDAO albumDAO = new AlbumDAO();
        SingerDAO singerDAO = new SingerDAO();
        GenreDAO genreDAO = new GenreDAO();

        Album album = new Album(
                singerDAO.findById(singerId),
                genreDAO.findById(genreId),
                albumName,
                releaseDate,
                albumPrice,
                fileName
        );

        albumDAO.save(album);
        response.sendRedirect("admin.jsp");
    }
}