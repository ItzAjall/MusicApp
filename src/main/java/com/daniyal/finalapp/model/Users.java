package com.daniyal.finalapp.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Entity
public class Users {
    private Long id;
    private boolean isAdmin;
    private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private List<Album> boughtAlbums = new ArrayList<>();
    private Map<Album, Integer> cart = new HashMap<>();

    public Users() {}

    public Users(boolean isAdmin, String firstName, String lastName, String userName, String password) {
        this.isAdmin = isAdmin;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    private void setId(Long id) {
        this.id = id;
    }

    @Column(nullable = false)
    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(nullable = false, unique = true)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column(nullable = false)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_bought_albums",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "album_id")
    )
    public List<Album> getBoughtAlbums() {
        return boughtAlbums;
    }

    public void setBoughtAlbums(List<Album> boughtAlbums) {
        this.boughtAlbums = boughtAlbums;
    }

    public void addAlbum(Album album) {
        this.boughtAlbums.add(album);
    }


    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(
            name = "users_cart",
            joinColumns = @JoinColumn(name = "user_id")
    )
    @MapKeyJoinColumn(name = "album_id")
    @Column(name = "quantity")
    public Map<Album, Integer> getCart() {
        return cart;
    }

    public void setCart(Map<Album, Integer> cart) {
        this.cart = cart;
    }

    public void addToCart(Album album, int quantity) {
        if (cart.containsKey(album)) {
            cart.put(album, cart.get(album) + quantity);
        } else {
            cart.put(album, quantity);
        }
    }

    public void removeFromCart(Album album, int quantity) {
        if (cart.containsKey(album)) {
            int currentQuantity = cart.get(album);

            if (currentQuantity <= quantity) {
                cart.remove(album);
            } else {
                cart.put(album, currentQuantity - quantity);
            }
        }
    }.


    @Transient
    public int getCartSize() {
        int cartSize = 0;
        for (Album album : this.cart.keySet()) {
            cartSize += cart.get(album);
        }
        return cartSize;
    }

    @Transient
    public int getCartTotalPrice(){
        int totalPrice = 0;
        for (Album album : this.cart.keySet()) {
            totalPrice += cart.get(album) * album.getAlbumPrice();
        }
        return totalPrice;
    }
}
