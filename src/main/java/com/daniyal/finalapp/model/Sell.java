package com.daniyal.finalapp.model;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
public class Sell {
    private Long id;
    private Album album;
    private Users user;
    private int year;
    private int month;

    public Sell() {}

    public Sell(Album album, Users user) {
        this.album = album;
        this.user = user;
        this.year = LocalDate.now().getYear();
        this.month = LocalDate.now().getMonthValue();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    private void setId(Long id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
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
