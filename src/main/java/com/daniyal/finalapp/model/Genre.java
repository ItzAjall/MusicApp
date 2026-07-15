package com.daniyal.finalapp.model;

import jakarta.persistence.*;

@Entity
public class Genre {
    private Long id;
    private String genreName;
    public Genre() {
    }
    public Genre(String genreName) {
        this.genreName = genreName;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    private void setId(Long id) {
        this.id = id;
    }

    @Column(unique = true)
    public String getGenreName() {
        return genreName;
    }

    public void setGenreName(String genreName) {
        this.genreName = genreName;
    }
}
