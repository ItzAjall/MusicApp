package com.daniyal.finalapp.model;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
public class Album {
    private Long id;
    private Singer singer;
    private Genre genre;
    private String albumName;
    private LocalDate releaseDate;
    private int albumPrice;
    private String songPath;

    public Album() {

    }

    public Album(Singer singer, Genre genre, String albumName, LocalDate releaseDate, int albumPrice, String songPath) {
        this.singer = singer;
        this.genre = genre;
        this.albumName = albumName;
        this.releaseDate = releaseDate;
        this.albumPrice = albumPrice;
        this.songPath = songPath;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    private void setId(Long id) {
        this.id = id;
    }

    @ManyToOne
    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }

    @ManyToOne
    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName;
    }

    public LocalDate getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(LocalDate releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getAlbumPrice() {
        return albumPrice;
    }

    public void setAlbumPrice(int albumPrice) {
        this.albumPrice = albumPrice;
    }

    public String getSongPath() {
        return songPath;
    }

    public void setSongPath(String songPath) {
        this.songPath = songPath;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Album)) return false;

        Album album = (Album) o;
        return id.equals(album.id);
    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }
}
