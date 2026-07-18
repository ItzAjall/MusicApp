package com.daniyal.finalapp.model;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
public class Vote {
    private Long id;
    private Users user;
    private Genre genre;
    private int year;
    private int month;

    public Vote() {}

    public Vote(Users user, Genre genre) {
        this.user = user;
        this.genre = genre;
        LocalDate now = LocalDate.now();
        this.year = now.getYear();
        this.month = now.getMonthValue();
    }


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne
    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    @ManyToOne
    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }
}
