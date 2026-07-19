# 🎵 MusicApp

A full-stack music web application built with **Java**, **JSP**, **Servlets**, **Hibernate**, and **PostgreSQL**.  
Users can browse albums, listen to music, manage their cart, purchase albums, and vote for their favorite music genres.

## ✨ Features

- 🔐 User authentication (Login & Register)
- 👤 User and Admin roles
- 🎵 Browse albums and songs
- ▶️ Online music player
- 🛒 Shopping cart system
- 💳 Album purchasing
- ⭐ Genre voting system
- 📅 Monthly voting limitation (one vote per genre per month)
- 📁 Upload album covers and music files
- 🗄️ Database management with Hibernate ORM
- 🎨 Responsive UI with Bootstrap

---

## 🛠 Technologies

- Java 17+
- Jakarta Servlet
- JSP
- Hibernate ORM
- PostgreSQL
- Maven
- Apache Tomcat
- Bootstrap 5
- HTML5 / CSS / JavaScript

---

## 🏗 Architecture

The project follows an MVC-style architecture:

```
src/
 ├── controller/     # Servlets handling requests
 ├── model/          # Entity classes
 ├── repository/     # Database operations
 ├── service/        # Business logic
 ├── util/           # Utilities (Hibernate configuration, etc.)

webapp/
 ├── css/
 ├── images/
 ├── uploads/
 ├── *.jsp
```

---

## 🚀 Getting Started

### Requirements

- Java 17 or newer
- Maven
- PostgreSQL
- Apache Tomcat 10/11

---

## 📥 Installation

### Clone the repository

```bash
git clone https://github.com/ItzAjall/MusicApp.git
cd MusicApp
```

### Configure PostgreSQL

Create a PostgreSQL database:

```sql
CREATE DATABASE musicapp;
```

Update your Hibernate configuration file:

```
src/main/resources/hibernate.cfg.xml
```

Example:

```xml
<property name="hibernate.connection.driver_class">
    org.postgresql.Driver
</property>

<property name="hibernate.connection.url">
    jdbc:postgresql://localhost:5432/musicapp
</property>

<property name="hibernate.connection.username">
    your_username
</property>

<property name="hibernate.connection.password">
    your_password
</property>
```

---

## 🔨 Build

Run:

```bash
mvn clean package
```

Deploy the generated `.war` file to Apache Tomcat.

---

## 📸 Screenshots

Add screenshots here:

```
screenshots/
 ├── home.png
 ├── album.png
 ├── player.png
 ├── cart.png
 └── admin.png
```

---

## 🔮 Future Improvements

- 🔎 Search system
- 🎧 Playlists
- ❤️ Favorites / Wishlist
- 👤 User profile management
- 🔑 Password recovery
- ⭐ Ratings and reviews
- 🌙 Dark mode
- 🚀 REST API support
- Spring Boot migration

---

## 📚 Learning Goals

This project was created to practice:

- Java Web Development
- MVC Design Pattern
- Hibernate ORM
- PostgreSQL Database Integration
- Authentication & Authorization
- Session Management
- File Upload Handling
- JSP & Servlet Development

---

## 📄 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

**Daniyal Ajalloueian**

GitHub: https://github.com/ItzAjall
