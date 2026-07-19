package com.daniyal.finalapp.model;

import jakarta.persistence.*;

@Entity
public class Sell {
    private Long id;
    private Album album;
    private Users user;
    private int amount;

    public Sell() {}

    public Sell(Album album, Users user, int amount) {
        this.album = album;
        this.user = user;
        this.amount = amount;
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

    @Column(nullable = false)
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
