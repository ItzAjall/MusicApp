package com.daniyal.finalapp.dao;

import com.daniyal.finalapp.model.User;
import com.daniyal.finalapp.util.HibernateUtil;
import org.hibernate.Session;

import java.util.List;

public class UserDAO {
    public List<User> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from User", User.class)
                    .getResultList();
        }
    }
    public void save(User user) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();

            session.persist(user);

            session.getTransaction().commit();
        }
    }
    public User findById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.find(User.class, id);
        }
    }

    public User findByUsername(String username) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            return session.createSelectionQuery(
                            "from User where userName = :username",
                            User.class
                    )
                    .setParameter("username", username)
                    .uniqueResult();
        }
    }

    public boolean setUserAdmin(User user) {
        if  (user == null)
            return false;
        if   (user.isAdmin())
            return false;
        user.setAdmin(true);
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.merge(user);
            session.getTransaction().commit();
            return true;
        }
    }
}
