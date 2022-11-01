package com.model;

import jakarta.persistence.*;

@Entity
public class Users {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_users")
    private int idUsers;
    @Basic
    @Column(name = "nom")
    private String nom;
    @Basic
    @Column(name = "prenom")
    private String prenom;
    @Basic
    @Column(name = "email")
    private String email;
    @Basic
    @Column(name = "password")
    private String password;
    @Basic
    @Column(name = "ville")
    private String ville;
    @Basic
    @Column(name = "centre")
    private String centre;
    @Basic
    @Column(name = "type")
    private String type;
    public Users() {
    }

    public Users(String nom, String prenom, String email, String password, String rol, String ville, String centre) {
        super();
        this.nom=nom;
        this.prenom=prenom;
        this.email=email;
        this.password=password;
        this.type=rol;
        this.ville=ville;
        this.centre=centre;
    }

    public Users(int id, String nom, String prenom, String email) {
        super();
        this.idUsers=id;
        this.nom=nom;
        this.prenom=prenom;
        this.email=email;
    }


    public int getIdUsers() {
        return idUsers;
    }

    public void setIdUsers(int idUsers) {
        this.idUsers = idUsers;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getCentre() {
        return centre;
    }

    public void setCentre(String centre) {
        this.centre = centre;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Users users = (Users) o;

        if (idUsers != users.idUsers) return false;
        if (nom != null ? !nom.equals(users.nom) : users.nom != null) return false;
        if (prenom != null ? !prenom.equals(users.prenom) : users.prenom != null) return false;
        if (email != null ? !email.equals(users.email) : users.email != null) return false;
        if (password != null ? !password.equals(users.password) : users.password != null) return false;
        if (ville != null ? !ville.equals(users.ville) : users.ville != null) return false;
        if (centre != null ? !centre.equals(users.centre) : users.centre != null) return false;
        if (type != null ? !type.equals(users.type) : users.type != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idUsers;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (prenom != null ? prenom.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (ville != null ? ville.hashCode() : 0);
        result = 31 * result + (centre != null ? centre.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }
}
